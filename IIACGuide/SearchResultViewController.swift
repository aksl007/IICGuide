//
//  SearchResultViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/25.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchResultViewController: BaseViewController {
    
    var keyword = ""
    
    var code = ""
    var searchTitle = ""
    
    var flightDatas = [FlightDeparture]()
    var facilities = [Facility]()
    var coupons = [Coupon]()
    var busDatas = [BusData]()
    var searchSlides = [SearchSlide]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: SearchResultViewController.self))
        self.initUi()
        self.tv_search_result_title.text = searchTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.code == "10" || self.code == "20" {
            
            self.tv_search_result_title.text = "\(searchTitle) \(CommonUtils.getTodayDate(format: "(yyyy-MM-dd)"))"
            
            self.headerView.isHidden = false
            self.headerView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.tv_search_result_title.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            
            self.getSearchDepartures()
        }else{
            self.headerView.isHidden = true
            self.headerView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.tv_search_result_title.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
            
            if self.code == "50" || self.code == "60" || self.code == "70" || self.code == "80" || self.code == "110" || self.code == "120"
                || self.code == "130" || self.code == "140" || self.code == "150" || self.code == "160" || self.code == "170" || self.code == "180"
                || self.code == "320" || self.code == "330" {
                
                
                if self.code == "50" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "103", keyword: keyword)
                }else if self.code == "60" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "103", keyword: keyword)
                }else if self.code == "70" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "102", keyword: keyword)
                }else if self.code == "80" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "102", keyword: keyword)
                }else if self.code == "110" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "110", keyword: keyword)
                }else if self.code == "120" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "110", keyword: keyword)
                }else if self.code == "130" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "111", keyword: keyword)
                }else if self.code == "140" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "111", keyword: keyword)
                }else if self.code == "150" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "104", keyword: keyword)
                }else if self.code == "160" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "107", keyword: keyword)
                }else if self.code == "170" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "107", keyword: keyword)
                }else if self.code == "180" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "104", keyword: keyword)
                }else if self.code == "320" {
                    self.facilities = self.findFacility(isT1: true, bigCategory: "112", keyword: keyword)
                }else if self.code == "330" {
                    self.facilities = self.findFacility(isT1: false, bigCategory: "112", keyword: keyword)
                }
                
                self.common_tableView.reloadData()
                
            }else if self.code == "90" || self.code == "91" {
                if self.code == "90" {
                    self.coupons = self.findCoupon(isGeneral: true, keyword: self.keyword)
                }else{
                    self.coupons = self.findCoupon(isGeneral: false, keyword: self.keyword)
                }
                self.common_tableView.reloadData()
                
            }else if self.code == "190" {
                self.getTransportationBuses()
            }else if self.code == "250" || self.code == "300" || self.code == "310" || self.code == "340" || self.code == "380" || self.code == "410" || self.code == "420" {
                self.getSearchSlides()
            }

        }
    }
    
    
    private let tv_search_result_title : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    
    private let headerView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        return view
    }()
    
    private let shadowView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let headerTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    private let headerNewLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_new".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    
    private let headerCheckInLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_checkin".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    private let headerGateLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_gate".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    
    private let headerFlightLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_flight".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    private let headerStatusLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_status".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    
    private let headerDestLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_dest".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    private let headerViaLabel : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_via".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.thin)
        label.sizeToFit()
        return label
    }()
    private let common_tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
}
extension SearchResultViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "search_result_title".localized)
        
        self.view.addSubview(self.tv_search_result_title)
        self.tv_search_result_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.left.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_search_result_title.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        
        self.view.addSubview(self.shadowView)
        self.shadowView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.headerView.addSubview(self.headerTimeLabel)
        self.headerTimeLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(view.frame.width * 5.5 / 100)
            make.centerY.equalToSuperview().dividedBy(1.5)
        }
        
        self.headerView.addSubview(self.headerNewLabel)
        self.headerNewLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(view.frame.width * 5.5 / 100)
            make.top.equalTo(self.headerTimeLabel.snp.bottom)
        }
        
        if(self.code == "20"){
            self.headerCheckInLabel.text = "flights_list_header_carousel".localized
            self.headerGateLabel.text = "flights_list_header_exit".localized
        }
        
        self.headerView.addSubview(self.headerCheckInLabel)
        self.headerCheckInLabel.snp.makeConstraints { (make) in
            if(self.code == "20"){
                make.trailing.equalToSuperview().offset(-view.frame.width * 3.6 / 100)
            }else{
                make.trailing.equalToSuperview().offset(-view.frame.width * 7 / 100)
            }
            make.centerY.equalToSuperview().dividedBy(1.5)
        }
        
        self.headerView.addSubview(self.headerGateLabel)
        self.headerGateLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-view.frame.width * 7 / 100)
            make.top.equalTo(self.headerCheckInLabel.snp.bottom)
        }
        
        self.headerView.addSubview(self.headerFlightLabel)
        self.headerFlightLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(0.58)
            make.centerY.equalToSuperview().dividedBy(1.5)
        }
        
        self.headerView.addSubview(self.headerStatusLabel)
        self.headerStatusLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(0.58)
            make.top.equalTo(self.headerFlightLabel.snp.bottom)
        }
        
        if(self.code == "20"){
            self.headerDestLabel.text = "flights_list_header_origin".localized
        }
        self.headerView.addSubview(self.headerDestLabel)
        self.headerDestLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(1.175)
            make.centerY.equalToSuperview().dividedBy(1.5)
        }
        
        self.headerView.addSubview(self.headerViaLabel)
        self.headerViaLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(1.175)
            make.top.equalTo(self.headerFlightLabel.snp.bottom)
        }
        
        self.common_tableView.delegate = self
        self.common_tableView.dataSource = self
        self.common_tableView.backgroundColor = .white
        self.common_tableView.separatorStyle = .none
        
        self.common_tableView.register(FlightInfoTableViewCell.self, forCellReuseIdentifier: "FlightInfoTableViewCell")
        self.common_tableView.register(FacilityTableViewCell.self, forCellReuseIdentifier: "FacilityTableViewCell")
        self.common_tableView.register(CouponTableViewCell.self, forCellReuseIdentifier: "CouponTableViewCell")
        self.common_tableView.register(BusDetailTableViewCell.self, forCellReuseIdentifier: "BusDetailTableViewCell")
        self.common_tableView.register(SearchSlideTableViewCell.self, forCellReuseIdentifier: "SearchSlideTableViewCell")
        
        
        self.view.addSubview(self.common_tableView)
        
        self.common_tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.shadowView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
}

extension SearchResultViewController {
    
    func findCoupon(isGeneral: Bool, keyword: String) -> [Coupon] {
        if isGeneral {
            
            return Array(self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignType == 'General'")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*'")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
            
        }else{
            return Array(self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignType == 'DutyFree'")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*'")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }
    }
    
    func findFacility(isT1: Bool, bigCategory: String, keyword: String) -> [Facility] {
        if isT1 {
            return Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID != 'P03' AND bigCategory == '\(bigCategory)' AND delete == false")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*' OR desc.ko LIKE '*\(keyword)*' OR desc.en LIKE '*\(keyword)*' OR desc.ja LIKE '*\(keyword)*' OR desc.zh LIKE '*\(keyword)*' OR keyword LIKE '*\(keyword)*'")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }else{
            return Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID == 'P03' AND bigCategory == '\(bigCategory)' AND delete == false")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*' OR desc.ko LIKE '*\(keyword)*' OR desc.en LIKE '*\(keyword)*' OR desc.ja LIKE '*\(keyword)*' OR desc.zh LIKE '*\(keyword)*' OR keyword LIKE '*\(keyword)*'")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }
    }
    
    
    func getSearchSlides(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getSearchSlide")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.searchSlides
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "keyword": self.keyword
            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
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
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[SearchSlide]>.self, from: dataJson)

                            let tempSearchSlides = result?.data as! [SearchSlide]
                        
                            self.searchSlides.removeAll()
                            for tempSearchSlide in tempSearchSlides {
                                if self.code == "300" && tempSearchSlide.pageId == "DeparturePage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }else if self.code == "310" && tempSearchSlide.pageId == "EntrancePage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }else if self.code == "410" && tempSearchSlide.pageId == "TrafficPage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }else if self.code == "420" && tempSearchSlide.pageId == "ParkingPage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }else if self.code == "250" && tempSearchSlide.pageId == "TransportAbbreviationInformationPage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }else if self.code == "380" && tempSearchSlide.pageId == "TransferPage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }else if self.code == "340" && tempSearchSlide.pageId == "MovingTerminalsPage" {
                                    self.searchSlides.append(tempSearchSlide)
                                }
                            }
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        
                        
                        self.common_tableView.reloadData()
                        
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    
    func getTransportationBuses(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getSearchBus")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.searchBuses
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "keyword": self.keyword
            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
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
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[BusData]>.self, from: dataJson)
                            
                            self.busDatas = result?.data as! [BusData]
                                
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.common_tableView.reloadData()
                        
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    
    func getSearchDepartures(){
        
        Loading.show()
        var apiUrl = ServerUtils.serverUrl + ServerUtils.searchDepartures
        if(self.code == "20"){
            apiUrl = ServerUtils.serverUrl + ServerUtils.searchArrivals
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getSearchArrFlight")
        }else{
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getSearchDepFlight")
        }
        
        let param = [
            "keyword": self.keyword
        ]
        
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
                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[FlightDeparture]>.self, from: dataJson)
                            
                            self.flightDatas = result?.data ?? [FlightDeparture]()

                            
                            //탑승구로 구분 set Background
                            var gateNo : String = ""
                            var flagGrayBackground = true
                            var row = 0
                            let currentTime = CommonUtils.getTodayDate(format: "kkmm")
                            for data in self.flightDatas {
                                if gateNo != data.gateNo {
                                    flagGrayBackground = !flagGrayBackground
                                }
                                data.setGrayBackground(grayBackground: flagGrayBackground)
                                gateNo = data.gateNo ?? ""
                                if currentTime < data.scheduleTime! {
                                    
                                }else{
                                    row += 1
                                }
                            }
                            self.common_tableView.reloadData()

                        } catch {
                            print(error.localizedDescription)
                        }
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
}
extension SearchResultViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        if self.code == "10" || self.code == "20" {
            let flightInfoDetailVC = FlightInfoDetailViewController()
            if self.code == "10" {
                flightInfoDetailVC.type = "dep"
            }else{
                flightInfoDetailVC.type = "arr"
            }

            flightInfoDetailVC.fimsFlightId = self.flightDatas[indexPath.row].fimsFlightId!
            self.navigationController?.pushViewController(flightInfoDetailVC, animated: true)
        }else if self.code == "50" || self.code == "60" || self.code == "70" || self.code == "80" || self.code == "110" || self.code == "120"
                    || self.code == "130" || self.code == "140" || self.code == "150" || self.code == "160" || self.code == "170" || self.code == "180"
                    || self.code == "320" || self.code == "330" {
            
            let facilityDetailVC = FacilityDetailViewController()
            
            var paramType = "shopping"
            if self.code == "50" || self.code == "60" {
                paramType = "shopping"
            }else if self.code == "70" || self.code == "80" {
                paramType = "food"
            }else if self.code == "110" || self.code == "120" {
                paramType = "rest"
            }else if self.code == "130" || self.code == "140" {
                paramType = "medical"
            }else if self.code == "160" || self.code == "170" {
                paramType = "other"
            }else if self.code == "150" {
                paramType = "finance"
            }else if self.code == "320" || self.code == "330" {
                paramType = "immigration"
            }
            
            facilityDetailVC.paramType = paramType
            facilityDetailVC.facility = self.facilities[indexPath.row]
            self.navigationController?.pushViewController(facilityDetailVC, animated: true)
        }else if self.code == "90" || self.code == "91" {
            let couponDetailVC = CouponDetailViewController()
            couponDetailVC.coupon = self.coupons[indexPath.row]
            self.navigationController?.pushViewController(couponDetailVC, animated: true)
        }else if self.code == "190" {
            let busRouteDetailVC = BusRouteDetailViewController()
            if self.busDatas[indexPath.row].terminalID == "P03"{
                busRouteDetailVC.terminalType = "T2"
            }else{
                busRouteDetailVC.terminalType = "T1"
            }
            
            busRouteDetailVC.busId = self.busDatas[indexPath.row].busID ?? ""
            busRouteDetailVC.platform = self.busDatas[indexPath.row].region ?? "S"
            self.navigationController?.pushViewController(busRouteDetailVC, animated: true)
        }else if self.code == "250" || self.code == "300" || self.code == "310" || self.code == "340" || self.code == "380" || self.code == "410" || self.code == "420" {
            
            let pageId = searchSlides[indexPath.row].pageId
            var slideId = Int(searchSlides[indexPath.row].slideId?.replacingOccurrences(of: "slide", with: "") ?? "") ?? 0
            let terminalId = searchSlides[indexPath.row].terminalId
            
            var terminalType = "T1"
            if terminalId == "P03" {
                terminalType = "T2"
            }
            
            if pageId == "DeparturePage" {
                self.openAirportTab(index: slideId)
            }else if pageId == "EntrancePage" {
                if slideId > 3 { // 입국장 혼잡도 예외 처리
                    slideId -= 1
                }
                self.openAirportArriveTab(index: slideId)
            }else if pageId == "TransferPage" {
                self.openAirportTransferTab(index: slideId)
            }else if pageId == "TransportAbbreviationInformationPage" {
                self.moveAirportDisabledWithParam(terminalType: terminalType, currentTap: slideId)
            }else if pageId == "MovingTerminalsPage" {
                self.openMovingTerminalWithParam(terminalType: terminalType)
            }else if pageId == "TrafficPage" {
                
                if(slideId > 1) { // KTX 예외 처리
                    slideId -= 1
                }
                
                if terminalType == "T1" {
                    if slideId == 3 {
                        slideId = 4
                    }else if slideId == 4 {
                        slideId = 3
                    }
                }else{
                    if slideId == 4 {
                        slideId = 3
                    }
                }
                
                self.movePublicTransport(terminalType: terminalType, currentTap: slideId)
            }else if pageId == "ParkingPage" {
                self.moveParking(terminalType: terminalType, currentTap: slideId)
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.code == "10" || self.code == "20" {
            return flightDatas.count
        }else if self.code == "50" || self.code == "60" || self.code == "70" || self.code == "80" || self.code == "110" || self.code == "120"
                    || self.code == "130" || self.code == "140" || self.code == "150" || self.code == "160" || self.code == "170" || self.code == "180"
                    || self.code == "320" || self.code == "330" {
            
            return self.facilities.count
        }else if self.code == "90" || self.code == "91" {
            return self.coupons.count
        }else if self.code == "190" {
            return self.busDatas.count
        }else if self.code == "250" || self.code == "300" || self.code == "310" || self.code == "340" || self.code == "380" || self.code == "410" || self.code == "420" {
            return self.searchSlides.count
        }else{
            return flightDatas.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.code == "10" || self.code == "20" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FlightInfoTableViewCell")! as! FlightInfoTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if self.code == "10" {
                cell.type = "dep"
            }else{
                cell.type = "arr"
            }
            
            cell.flightDeparture = self.flightDatas[indexPath.row]
            
            return cell
        }else if self.code == "50" || self.code == "60" || self.code == "70" || self.code == "80" || self.code == "110" || self.code == "120"
                    || self.code == "130" || self.code == "140" || self.code == "150" || self.code == "160" || self.code == "170" || self.code == "180"
                    || self.code == "320" || self.code == "330" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityTableViewCell")! as! FacilityTableViewCell
     
            let tempString: String = self.facilities[indexPath.row].usid ?? ""
            let coupon = Array(self.realm.objects(CampaignTarget.self).filter(NSPredicate(format: "targetID == %@", tempString)))

            if coupon.count > 0 {
                cell.isCoupon = true
            }else{
                cell.isCoupon = false
            }
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.viewWidth = self.view.frame.width
            cell.facility = self.facilities[indexPath.row]
            
            return cell
        }else if self.code == "90" || self.code == "91" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CouponTableViewCell")! as! CouponTableViewCell
            
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.viewWidth = self.view.frame.width
            cell.coupon = self.coupons[indexPath.row]
            
            return cell
        }else if self.code == "190" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusDetailTableViewCell")! as! BusDetailTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.isSearch = true
            cell.busData = self.busDatas[indexPath.row]
            
            return cell
        }else if self.code == "250" || self.code == "300" || self.code == "310" || self.code == "340" || self.code == "380" || self.code == "410" || self.code == "420" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchSlideTableViewCell")! as! SearchSlideTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.title = self.searchTitle
            cell.searchSlide = self.searchSlides[indexPath.row]
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FlightInfoTableViewCell")! as! FlightInfoTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if self.code == "10" {
                cell.type = "dep"
            }else{
                cell.type = "arr"
            }
            
            cell.flightDeparture = self.flightDatas[indexPath.row]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.code == "10" || self.code == "20" {
            return 50
        }else if self.code == "50" || self.code == "60" || self.code == "70" || self.code == "80" || self.code == "110" || self.code == "120"
                    || self.code == "130" || self.code == "140" || self.code == "150" || self.code == "160" || self.code == "170" || self.code == "180"
                    || self.code == "320" || self.code == "330" {
            
            return 60 + SizeUtils.sideMargin * 2
        }else if self.code == "90" || self.code == "91" {
            return 60 + SizeUtils.sideMargin * 2
        }else if self.code == "190" {
            return 60
        }else if self.code == "250" || self.code == "300" || self.code == "310" || self.code == "340" || self.code == "380" || self.code == "410" || self.code == "420" {
            return 60
        }else {
            return 50
        }
        
    }
    
}

