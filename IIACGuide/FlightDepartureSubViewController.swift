//
//  FlightDepartureSubViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class FlightDepartureSubViewController: BaseViewController {
    
    var datas = [FlightDeparture]()
    
    var type = "dep" // dep, arr
    var terminalType = "all" // all, t1, t2
    
    
    var refreshFlag = false
    
    var oneTimeFlag = false
    
    var flightPid = ""
    
    
    var isSearch = false
    
    var fromScheduleDate = ""
    var toScheduleDate = ""
    
    var originAirport = ""
    var airlineIataCode = ""
    var exitDoorNo = ""
    
    var terminalId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightDepartureSubViewController.self))
        initUi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.refreshFlag = true
        DispatchQueue.global(qos: .background).async {
            while(self.refreshFlag){
                DispatchQueue.main.async {
                    
                    self.getFlightsDepartures()
                }
                
                Thread.sleep(forTimeInterval: 60)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.refreshFlag = false
    }
    
    private let refreshView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    
    private let refreshTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "2020.07.30 10:41"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.information, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let refreshButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "popup_btn_update_2_nor"), for: .normal)
        button.setImage(UIImage(named: "popup_btn_update_touch"), for: .highlighted)
        button.addTarget(self, action: #selector(refreshList(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
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
    private let flightTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
}
//UI
extension FlightDepartureSubViewController {
    func initUi(){
        
        self.view.addSubview(self.refreshView)
        self.refreshView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        self.refreshView.addSubview(self.refreshTimeLabel)
        self.refreshTimeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.refreshView.addSubview(self.refreshButton)
        self.refreshButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        
        self.headerView.addSubview(self.shadowView)
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
        
        if(self.type == "arr"){
            self.headerCheckInLabel.text = "flights_list_header_carousel".localized
            self.headerGateLabel.text = "flights_list_header_exit".localized
        }
        
        self.headerView.addSubview(self.headerCheckInLabel)
        self.headerCheckInLabel.snp.makeConstraints { (make) in
            if(self.type == "arr"){
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
        
        if(self.type == "arr"){
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
        
        self.flightTableView.delegate = self
        self.flightTableView.dataSource = self
        self.flightTableView.backgroundColor = .white
        self.flightTableView.separatorStyle = .none
        
        self.flightTableView.register(FlightInfoTableViewCell.self, forCellReuseIdentifier: "FlightInfoTableViewCell")
        self.view.addSubview(self.flightTableView)
        
        self.flightTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.shadowView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            if isSearch {
                make.bottom.equalToSuperview()
            }else{
                make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 6) - 5)
            }
            
        }
        
    }
}
extension FlightDepartureSubViewController {
    @objc func refreshList(_ sender : UIButton){
        self.getFlightsDepartures()
        
    }
}

extension FlightDepartureSubViewController {
    func getFlightsDepartures(){
        
        Loading.show()
        
        
        
        var apiUrl = ServerUtils.serverUrl + ServerUtils.flightsDepartures
        if(self.type == "arr"){
            apiUrl = ServerUtils.serverUrl + ServerUtils.flightsArrivals
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArr")
        }else{
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightDep")
        }
        
        var param = [
            "fromScheduleDate": CommonUtils.getTodayDate(format: "yyyyMMdd"),
            "fromScheduleTime": "0000",
            "toScheduleDate" : CommonUtils.getTodayDate(format: "yyyyMMdd"),
            "toScheduleTime" : "2359"
        ]
        if self.isSearch {
            param = [
                "fromScheduleDate": self.fromScheduleDate,
                "fromScheduleTime": "0000",
                "toScheduleDate" : self.toScheduleDate,
                "toScheduleTime" : "2359",
                "airlineIataCode" : self.airlineIataCode,
                "flightPid" : self.flightPid,
                "destinationAirport" : self.originAirport,
                "terminalId" : self.terminalId
            ]
            if self.originAirport == "" {
                param.removeValue(forKey: "destinationAirport")
            }
            if self.type == "arr" {
                param = [
                    "fromScheduleDate": self.fromScheduleDate,
                    "fromScheduleTime": "0000",
                    "toScheduleDate" : self.toScheduleDate,
                    "toScheduleTime" : "2359",
                    "airlineIataCode" : self.airlineIataCode,
                    "flightPid" : self.flightPid,
                    "originAirport" : self.originAirport,
                    "terminalId" : self.terminalId,
                    "exitDoorNo" : self.exitDoorNo
                ]
                if self.originAirport == "" {
                    param.removeValue(forKey: "originAirport")
                }
                if self.exitDoorNo == "" {
                    param.removeValue(forKey: "exitDoorNo")
                }
            }
            if self.airlineIataCode == "" {
                param.removeValue(forKey: "airlineIataCode")
            }
            if self.flightPid == "" {
                param.removeValue(forKey: "flightPid")
            }
            if self.terminalId == "" {
                param.removeValue(forKey: "terminalId")
            }
            
            
        }
        
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
                            let result = try? JSONDecoder().decode(BaseResult<BaseData<FlightDeparture>>.self, from: dataJson)
                            
                            self.datas = result?.data?.results ?? [FlightDeparture]()
                            
                            var tempDatas = [FlightDeparture]()
                            
                            
                            if self.terminalType != "all" {
                                for data in self.datas {
                                    if(self.terminalType == "t2"){
                                        if data.terminalNo == "P03" {
                                            tempDatas.append(data)
                                        }
                                    }else if (self.terminalType == "t1"){
                                        if data.terminalNo != "P03" {
                                            tempDatas.append(data)
                                        }
                                    }
                                }
                                self.datas = tempDatas
                            }
                            
                            //탑승구로 구분 set Background
                            var gateNo : String = ""
                            var flagGrayBackground = true
                            var row = 0
                            let currentTime = CommonUtils.getTodayDate(format: "kkmm")
                            for data in self.datas {
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
                            self.flightTableView.reloadData()
                            if(!self.oneTimeFlag){
                                self.oneTimeFlag = true
                                
                                
                                let indexPath = IndexPath(row: row, section: 0)
                                do{
                                    if self.datas.count - 1 > row {
                                        self.flightTableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                    }
                                } 
                            }
                            
                            self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd kk:mm")
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

extension FlightDepartureSubViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let flightInfoDetailVC = FlightInfoDetailViewController()
        flightInfoDetailVC.type = self.type
        flightInfoDetailVC.fimsFlightId = self.datas[indexPath.row].fimsFlightId!
        self.navigationController?.pushViewController(flightInfoDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightInfoTableViewCell")! as! FlightInfoTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.type = self.type
        cell.terminalType = self.terminalType
        cell.flightDeparture = self.datas[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

