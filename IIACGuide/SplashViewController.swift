//
//  SplashViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import RealmSwift

class SplashViewController: BaseViewController {
    
    var establishmentData : EstablishmentData?
    var coupons = [Coupon]()
    var mapT1s = [Map]()
    var mapT2s = [Map]()
    var notices = [Notice]()
    
    var isEndEstablishmentData = false
    var isEndCampaign = false
    var isEndEstablishmentsMap = false
    var isEndNotice = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: SplashViewController.self))
        if self.hasJailbreak() {
            exit(0)
        }
        
        self.view.addSubview(self.launchImage)
        self.launchImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LoadingSplash.show()
        
        self.getEstablishmentsNative()
        self.getCampaign()
        self.getEstablishmentsMapT1() // end -> getEstablishmentsMapT2()
        self.getNotices()
        self.getBookmarksDevice()
        
        DispatchQueue.global(qos: .background).async {
            while(self.isLoop()){
                
                Thread.sleep(forTimeInterval: 0.5)
            }
            DispatchQueue.main.async {
                
                self.replaceRoot()
            }
        }
        
    }
    
    func isLoop() -> Bool {
        
        if self.isEndEstablishmentData && self.isEndCampaign && self.isEndEstablishmentsMap && self.isEndNotice {
            
            return false
        }else{
            return true //looping
        }
    }
    
    private let launchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "splash0")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    func hasJailbreak() -> Bool {
        
        guard let cydiaUrlScheme = NSURL(string: "cydia://package/com.example.package") else { return false }
        if UIApplication.shared.canOpenURL(cydiaUrlScheme as URL) {
            return true
        }
        #if arch(i386) || arch(x86_64)
        return false
        #endif
        
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            fileManager.fileExists(atPath: "/bin/bash") ||
            fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
            fileManager.fileExists(atPath: "/etc/apt") ||
            fileManager.fileExists(atPath: "/usr/bin/ssh") ||
            fileManager.fileExists(atPath: "/private/var/lib/apt") {
            return true
        }
        if canOpen(path: "/Applications/Cydia.app") ||
            canOpen(path: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            canOpen(path: "/bin/bash") ||
            canOpen(path: "/usr/sbin/sshd") ||
            canOpen(path: "/etc/apt") ||
            canOpen(path: "/usr/bin/ssh") {
            return true
        }
        let path = "/private/" + NSUUID().uuidString
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
    }
    func canOpen(path: String) -> Bool {
        let file = fopen(path, "r")
        guard file != nil else { return false }
        fclose(file)
        return true
    }
    
    func replaceRoot(){
        
        LoadingSplash.hide()
        UIApplication.shared.keyWindow?.rootViewController = TabBarController()
    }
}
extension SplashViewController {
    func getEstablishmentsNative(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getEstablishment")
        
        let updateDateTime = UserDefaultsUtils.getFacilityUpdateDate()
        
        var param = [
            "updateDateTime": updateDateTime,
        ]
        if updateDateTime == "" {
            param = [:]
        }
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.establishmentsNative
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters: param,
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<EstablishmentData>.self, from: dataJson)

                            self.establishmentData = result?.data as! EstablishmentData
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        if (self.establishmentData?.data?.count)! > 0 {
                            
                            try! self.realm.write {
                                for facility in (self.establishmentData?.data)! {
                                    
                                    if facility.telNOS?.count != 0 {
                                        facility.telNo = facility.telNOS?[0]
                                    }
                                    if facility.keywords?.count != 0 {
                                        var tempKeyword = ""
                                        for keyword in (facility.keywords)! {
                                            tempKeyword += "\(keyword),"
                                        }
                                        facility.keyword = tempKeyword
                                    }
                                    if facility.optionalImageUrls?.count != 0 {
                                        facility.optionalImageUrl = facility.optionalImageUrls?[0]
                                    }
                                    
                                    self.realm.add(facility, update: .modified)
                                }
                            }
                        }
                        UserDefaultsUtils.setFacilityUpdateDate(self.establishmentData?.updatedTimestamp ?? "")
                        
                        self.isEndEstablishmentData = true
                        
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    
    func getCampaign(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getCampaign")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.campaigns
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[Coupon]>.self, from: dataJson)

                            self.coupons = result?.data as! [Coupon]
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        
                        try! self.realm.write {
                            
                            let result = self.realm.objects(CampaignTarget.self)
                            self.realm.delete(result)
                            
                            for coupon in self.coupons {
                                self.realm.add(coupon, update: .modified)
                                
                                if coupon.targets != nil && coupon.targets?.count ?? 0 > 0{
                                    
                                    for target in coupon.targets! {
                                        target.campaignId = coupon.campaignID
                                        self.realm.add(target)
                                    }
                                }
                                
                            }
                        }
                        
                        self.isEndCampaign = true
                        
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    
    func getEstablishmentsMapT1(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getMap")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.establishmentsMap + "P01"
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[Map]>.self, from: dataJson)

                            self.mapT1s = result?.data as! [Map]
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        try! self.realm.write {
                            
                            let result = self.realm.objects(Map.self)
                            self.realm.delete(result)
                            
                            for map in self.mapT1s {
                                self.realm.add(map)
                            }
                        }
                        
                        self.getEstablishmentsMapT2()
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    
    func getEstablishmentsMapT2(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getMap")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.establishmentsMap + "P03"
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[Map]>.self, from: dataJson)
                            
                            self.mapT2s = result?.data as! [Map]
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        try! self.realm.write {
                            
                            for map in self.mapT2s {
                                self.realm.add(map)
                            }
                        }
                        
                        self.isEndEstablishmentsMap = true
                        
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    
    func getNotices(){

        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getNotice")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.notices

        Session.default.request(
            apiUrl,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[Notice]>.self, from: dataJson)

                            self.notices = result?.data as! [Notice]

                        } catch {
                            print(error.localizedDescription)
                        }

                        try! self.realm.write {
                            
                            let result = self.realm.objects(Notice.self)
                            self.realm.delete(result)

                            for notice in self.notices {
                                self.realm.add(notice)
                            }
                        }

                        self.isEndNotice = true

                    } else {

                    }
                case .failure(let error):
                    print(error)

                }
        }
    }
    
    func getBookmarksDevice(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "setDeviceInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.bookmarksDevice
        
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String,
              let _ = dictionary["CFBundleVersion"] as? String else {return}

        Session.default.request(
            apiUrl,
            method: .post,
            parameters: [
                "appVersion": version,
                "os": "iphone",
                "osVersion" : UIDevice.current.systemVersion,
                "pushId" : UserDefaultsUtils.getPushId(),
                "pushAllowed" : UserDefaultsUtils.isPush()
            ],
            encoding: JSONEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey, "deviceId": UserDefaultsUtils.getDeviceId(), "lang": CommonUtils.getLocaleId()]
        )
        .validate(statusCode: 200..<400)
        .responseJSON {response in
            switch response.result{
            case .success(let obj):
                let json = JSON(obj)
                print(json)
                let code = json["code"]
                if code == 200 {
                    do {
                        //                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        //                            let result = try? JSONDecoder().decode(BaseResult<[Notice]>.self, from: dataJson)
                        //
                        //                            self.notices = result?.data as! [Notice]
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                } else {
                    
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }

}
