//
//  BusRouteStopViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BusRouteStopViewController: BaseViewController {
    
    var busId = ""
    var terminalType = "T1"
    var platform = ""
    var busName = ""
    
    var busRouteStops = [BusRouteStop]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BusRouteStopViewController.self))
        self.initUi()
        self.getTransportationBusesRouteStops()
    }
    
    private let icon_bus_title : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_bus_title")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let busNo : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let platform_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let gray_line_1 : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let busStopView: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    
}
extension BusRouteStopViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "bus_detail_link_1".localized)
        
        self.view.addSubview(self.icon_bus_title)
        self.icon_bus_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.view.addSubview(self.busNo)
        self.busNo.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.icon_bus_title)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.view.addSubview(self.platform_label)
        self.platform_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.busNo.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.view.addSubview(self.gray_line_1)
        self.gray_line_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.platform_label.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.busStopView.delegate = self
        self.busStopView.dataSource = self
        self.busStopView.separatorStyle = .none
        self.busStopView.register(BusRouteStopTableViewCell.self, forCellReuseIdentifier: "BusRouteStopTableViewCell")
        
        self.view.addSubview(self.busStopView)
        self.busStopView.snp.makeConstraints { (make) in
            make.top.equalTo(self.gray_line_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
}
extension BusRouteStopViewController {
    func getTransportationBusesRouteStops(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getBusRouteStopInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationBusesRouteStops
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "terminalId": terminalId,
                "busUsid": busId
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
                            let result = try? JSONDecoder().decode(BaseResult<[BusRouteStop]>.self, from: dataJson)
                            
                            self.busRouteStops = result?.data ?? [BusRouteStop]()
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.busNo.text = self.busName
                        
                        if self.platform == "S" {
                            self.platform_label.text = "bus_link_1".localized
                        }else if self.platform == "G" {
                            self.platform_label.text = "bus_link_2".localized
                        }else if self.platform == "I" {
                            self.platform_label.text = "bus_link_3".localized
                        }else if self.platform == "N" {
                            self.platform_label.text = "bus_link_4".localized
                        }else if self.platform == "C" {
                            self.platform_label.text = "bus_link_5".localized
                        }else {
                            self.platform_label.text = ""
                        }
                        
                        self.busStopView.reloadData()
                        
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
extension BusRouteStopViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.busRouteStops.count)
        return self.busRouteStops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusRouteStopTableViewCell")! as! BusRouteStopTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.busRouteStop = self.busRouteStops[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeUtils.iconSize
    }

}
