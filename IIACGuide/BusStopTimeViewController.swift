//
//  BusStopTimeViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BusStopTimeViewController: BaseViewController {
    
    var type = "bus" //bus, arex
    
    var busId = ""
    var terminalType = "T1"
    var platform = ""
    var busName = ""
    
    var busTimeTable : BusTimeTable?
    var shuttleStop : ShuttleStop?
    
    var busTimetableRows = [BusTimetableRow]()
    
    var rowIndex = -1
    var colIndex = -1
    var predictTimeText1 = ""
    var predictTimeText2 = ""
    
    var isTodayInWeekend = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BusStopTimeViewController.self))
        self.initUi()
        self.refreshBusStop()
        
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
    
    private let predictTime1 : UILabel = {
        let label = UILabel()
        label.text = "30분 후 출발 (18:30)"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let predictTime2 : UILabel = {
        let label = UILabel()
        label.text = "60분 후 출발 (19:00)"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private var shuttle_bus_time_hour : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_time_hour".localized
        return label
    }()
    private var shuttle_bus_time_etc : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_time_etc".localized
        return label
    }()
    private var shuttle_bus_time_min : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_time_min".localized
        return label
    }()
    
    private let busStopTimeView: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    
//    "shuttle_bus_predic_time" = "분 후 출발";
    
}
extension BusStopTimeViewController {
    func initUi(){
        
        self.setNavigationItemTitle(title: "bus_detail_link_2".localized)
        if self.type == "arex" {
            self.setNavigationItemTitle(title: "arex_link_2".localized)
        }else if self.type == "shuttle" || self.type == "staff_shuttle" {
            self.setNavigationItemTitle(title: "slide_staff_sub_menu_1".localized)
        }
        
        self.busNo.text = self.busName
        if self.type == "arex" {
            if self.terminalType == "T1" {
                self.busNo.text = "arex_time_title_t1".localized
            }else {
                self.busNo.text = "arex_time_title_t2".localized
            }
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "actionbar_reload"), style:.plain, target: self, action: #selector(refreshBusStop))
        
        if self.type == "arex" {
            self.icon_bus_title.image = UIImage(named: "icon_arex_title")
        }
        self.view.addSubview(self.icon_bus_title)
        self.icon_bus_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        if self.type == "arex" {
            self.busNo.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        }
        
        self.view.addSubview(self.busNo)
        self.busNo.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.icon_bus_title)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.view.addSubview(self.predictTime1)
        self.predictTime1.snp.makeConstraints { (make) in
            make.top.equalTo(self.busNo.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.view.addSubview(self.predictTime2)
        self.predictTime2.snp.makeConstraints { (make) in
            make.top.equalTo(self.predictTime1.snp.bottom)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
            make.height.equalTo(0)
        }
        
        self.shuttle_bus_time_hour = self.makeHeaderCell(label: self.shuttle_bus_time_hour)
        self.shuttle_bus_time_etc = self.makeHeaderCell(label: self.shuttle_bus_time_etc)
        self.shuttle_bus_time_min = self.makeHeaderCell(label: self.shuttle_bus_time_min)
        
        self.view.addSubview(self.shuttle_bus_time_hour)
        self.shuttle_bus_time_hour.snp.makeConstraints { (make) in
            make.top.equalTo(self.predictTime2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.shuttle_bus_time_etc)
        self.shuttle_bus_time_etc.snp.makeConstraints { (make) in
            make.top.equalTo(self.predictTime2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalTo(self.shuttle_bus_time_hour.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.shuttle_bus_time_min)
        self.shuttle_bus_time_min.snp.makeConstraints { (make) in
            make.top.equalTo(self.predictTime2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalTo(self.shuttle_bus_time_etc.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 4 / 6)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        
        self.busStopTimeView.delegate = self
        self.busStopTimeView.dataSource = self
        self.busStopTimeView.separatorStyle = .none
        self.busStopTimeView.register(BusStopTimeTableViewCell.self, forCellReuseIdentifier: "BusStopTimeTableViewCell")
        
        self.view.addSubview(self.busStopTimeView)
        self.busStopTimeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_time_hour.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    
    func makeHeaderCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
    
    func setTableData(){
        let currentHour = CommonUtils.getTodayDate(format: "kk")
        
        let currentTime = CommonUtils.getTodayDate(format: "kkmm")
        
        let calendar = Calendar.current
        self.isTodayInWeekend = calendar.isDateInWeekend(Date())
        
        if self.busTimeTable?.timeTable != nil && (self.busTimeTable?.timeTable?.count)! > 0 {
            self.busTimetableRows = [BusTimetableRow]()
            var min = ""
            var min2 = ""
            var row1 = [String]()
            var row2 = [String]()
            self.rowIndex = -1
            self.colIndex = -1
            var i = 0
            for tempTimeTable in (self.busTimeTable?.timeTable)! {
                
                min = tempTimeTable.firstMins?.replacingOccurrences(of: "/", with: ", ") as! String
                min2 = tempTimeTable.secondMins?.replacingOccurrences(of: "/", with: ", ") as! String
                row1 = min.components(separatedBy: ", ")
                row2 = min2.components(separatedBy: ", ")
                if currentHour <= tempTimeTable.hour! {
                    if self.rowIndex == -1 {
                        self.rowIndex = i
                        
                        if !self.isTodayInWeekend {
                            //주중
                            var j = 0
                            for row in row1 {
                                if currentTime <= "\(tempTimeTable.hour!)\(row)" {
                                    if self.colIndex == -1 {
                                        self.colIndex = j
                                        self.predictTimeText1 = "\(tempTimeTable.hour!)\(row)"
                                        
                                    }
                                }
                                
                                j += 1
                            }
                        }else{
                            //주말
                            var j = 0
                            for row in row2 {
                                if currentTime <= "\(tempTimeTable.hour!)\(row)" {
                                    if self.colIndex == -1 {
                                        self.colIndex = j
                                        self.predictTimeText1 = "\(tempTimeTable.hour!)\(row)"
                                    }
                                    
                                }
                                
                                j += 1
                            }
                        }
                    }
                    
                }
                if self.predictTimeText1 == "" {
                    self.rowIndex = -1
                }
                self.busTimetableRows.append(BusTimetableRow(hour: tempTimeTable.hour, minRow1: min, minRow2: min2, row1: row1, row2: row2, same: min == min2))
                i += 1
            }
            
            
        }
        
        
        if self.predictTimeText1 == "" {
            self.predictTime1.snp.remakeConstraints { (make) in
                make.top.equalTo(self.busNo.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
                make.height.equalTo(0)
            }
        }
        
        self.predictTime1.text = "\(CommonUtils.minDiffByString(start: currentTime, end: self.predictTimeText1, inputFormat: "kkmm"))\("shuttle_bus_predic_time".localized) (\(CommonUtils.convertToStringFromStringDate(inputString: self.predictTimeText1, inputFormat: "kkmm", outputFormat: "kk:mm")))"
        
        
        self.busStopTimeView.reloadData()
    }
    
    func setAREXTableData(){
        let currentHour = CommonUtils.getTodayDate(format: "kk")
        let currentTime = CommonUtils.getTodayDate(format: "kkmm")
        
        let calendar = Calendar.current
        
        if self.busTimeTable?.timeTable != nil && (self.busTimeTable?.timeTable?.count)! > 0 {
            self.busTimetableRows = [BusTimetableRow]()
            var min = ""
            var min2 = ""
            var row1 = [String]()
            var row2 = [String]()
            self.rowIndex = -1
            self.colIndex = -1
            var i = 0
            for tempTimeTable in (self.busTimeTable?.timeTable)! {
                
                min = tempTimeTable.firstMins?.replacingOccurrences(of: "/", with: ", ") as! String
                min2 = tempTimeTable.secondMins?.replacingOccurrences(of: "/", with: ", ") as! String
                row1 = min.components(separatedBy: ", ")
                row2 = min2.components(separatedBy: ", ")
                if currentHour <= tempTimeTable.hour! {
                    if self.rowIndex == -1 {
                        self.rowIndex = i
                        
                        var k = 0
                        for row in row2 {
                            if row != "" {
                                if currentTime <= "\(tempTimeTable.hour!)\(row)" {
                                    if self.colIndex == -1 {
                                        self.colIndex = k
                                        self.predictTimeText1 = "\(tempTimeTable.hour!)\(row)"
                                    }
                                    
                                }
                            }
                            
                            k += 1
                        }
                        
                        
                        var j = 0
                        for row in row1 {
                            if row != "" {
                                if currentTime <= "\(tempTimeTable.hour!)\(row)" && "\(tempTimeTable.hour!)\(row)" < self.predictTimeText1 {
                                    self.isTodayInWeekend = false
                                    self.colIndex = j
                                    self.predictTimeText1 = "\(tempTimeTable.hour!)\(row)"
                                    
                                }
                            }
                            
                            
                            j += 1
                        }
                    }
                }
                if self.predictTimeText1 == "" {
                    self.rowIndex = -1
                }
                self.busTimetableRows.append(BusTimetableRow(hour: tempTimeTable.hour, minRow1: min, minRow2: min2, row1: row1, row2: row2, same: min == min2))
                i += 1
            }
            
            
        }
        
        
        if self.predictTimeText1 == "" {
            self.predictTime1.snp.remakeConstraints { (make) in
                make.top.equalTo(self.busNo.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
                make.height.equalTo(0)
            }
        }
        
        if self.isTodayInWeekend {
            self.predictTime1.text = "\("arex_time_note_2".localized) : \(CommonUtils.minDiffByString(start: currentTime, end: self.predictTimeText1, inputFormat: "kkmm"))\("shuttle_bus_predic_time".localized) (\(CommonUtils.convertToStringFromStringDate(inputString: self.predictTimeText1, inputFormat: "kkmm", outputFormat: "kk:mm")))"
        }else{
            self.predictTime1.text = "\("arex_time_note_1".localized) : \(CommonUtils.minDiffByString(start: currentTime, end: self.predictTimeText1, inputFormat: "kkmm"))\("shuttle_bus_predic_time".localized) (\(CommonUtils.convertToStringFromStringDate(inputString: self.predictTimeText1, inputFormat: "kkmm", outputFormat: "kk:mm")))"
        }
        
        
        
        self.busStopTimeView.reloadData()
    }
}
extension BusStopTimeViewController {
    @objc func refreshBusStop(){
        
        if self.type == "arex" {
            self.getTransportationTrainsTimeTable()
        }else if self.type == "staff_shuttle" {
            self.setStaffShuttle()
        }else {
            //bus
            if self.busId == "00002011" ||
                self.busId == "00000013" ||
                self.busId == "00000020" ||
                self.busId == "00004001" ||
                self.busId == "00000017" {
             
                self.getTransportationShuttleBusesStops()
            }else {
                self.getTransportationBusesTimeTable()
            }
            
            if self.busId == "00002" ||
                self.busId == "00000" ||
                self.busId == "00001" ||
                self.busId == "00004" {
                
                self.getTransportationShuttleBusesStops()
            }
        }
    }
}
extension BusStopTimeViewController {
    
    func setStaffShuttle(){
        self.busNo.text = CommonUtils.getLocaleString(locale: self.shuttleStop?.name)
        
        var tempTimeTables = [TimeTableData]()
        
        for i in 0..<25 {
            
            var hour = String(i)
            if Int(hour)! < 10 {
                hour = "0\(hour)"
            }
            
            var weekdayMins = ""
            var weekendMins = ""
            
            
            for weekdayTime in (self.shuttleStop?.weekdayTimes)! {
                let time: String = weekdayTime.time!
                let dIdx: String.Index = time.index(time.startIndex, offsetBy: 1)
                let mIdx: String.Index = time.index(time.startIndex, offsetBy: 2)
                let hResult = String(time[...dIdx])
                var mResult = String(time[mIdx...])
                
                if Int(mResult)! < 10 {
                    mResult = "0\(mResult)"
                }
                
                if hour == hResult {
                    if weekdayMins == "" {
                        weekdayMins += mResult
                    }else{
                        weekdayMins += ", " + mResult
                    }
                    
                }
            }
            
            for weekdayTime in (self.shuttleStop?.weekendTimes)! {
                let time: String = weekdayTime.time!
                let dIdx: String.Index = time.index(time.startIndex, offsetBy: 1)
                let mIdx: String.Index = time.index(time.startIndex, offsetBy: 2)
                let hResult = String(time[...dIdx])
                var mResult = String(time[mIdx...])
                
                if Int(mResult)! < 10 {
                    mResult = "0\(mResult)"
                }
                
                if hour == hResult {
                    if weekendMins == "" {
                        weekendMins += mResult
                    }else{
                        weekendMins += ", " + mResult
                    }
                    
                }
            }
            
            if weekendMins == "" && weekdayMins == "" {
                
            }else{
                tempTimeTables.append(TimeTableData(secondMinsDescription: "", seq: i, firstMinsDescription: "", firstMins: weekdayMins, hour: hour, secondMins: weekendMins))
            }
        }
        
        self.busTimeTable = BusTimeTable(routeName: nil, timeTable: tempTimeTables)
        
        self.setTableData()
    }
    
    func getTransportationBusesTimeTable(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getBusTimeTableInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationBusesTimeTable + terminalId + "/" + busId
        
        Session.default.request(
            apiUrl,
            method: .get,
            //            parameters:
            //            [
            //                "terminalId": terminalId,
            //                "busUsid": busId
            //            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<BusTimeTable>.self, from: dataJson)
                            
                            self.busTimeTable = result?.data as! BusTimeTable
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.setTableData()
                        
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    
    func getTransportationShuttleBusesStops(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getShuttleBusStopTimeInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationShuttleBusesStops + busId
        //        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationShuttleBusesStops + "00002011"
        
        
        Session.default.request(
            apiUrl,
            method: .get,
            //            parameters:
            //            [
            //                "terminalId": terminalId,
            //                "busUsid": busId
            //            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<ShuttleStop>.self, from: dataJson)
                            
                            self.shuttleStop = result?.data as! ShuttleStop
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.busNo.text = CommonUtils.getLocaleString(locale: self.shuttleStop?.name)
                        
                        var tempTimeTables = [TimeTableData]()
                        
                        for i in 0..<25 {
                            
                            var hour = String(i)
                            if Int(hour)! < 10 {
                                hour = "0\(hour)"
                            }
                            
                            var weekdayMins = ""
                            var weekendMins = ""
                            
                            
                            for weekdayTime in (self.shuttleStop?.weekdayTimes)! {
                                let time: String = weekdayTime.time!
                                let dIdx: String.Index = time.index(time.startIndex, offsetBy: 1)
                                let mIdx: String.Index = time.index(time.startIndex, offsetBy: 2)
                                let hResult = String(time[...dIdx])
                                var mResult = String(time[mIdx...])
                                
                                if Int(mResult)! < 10 {
                                    mResult = "0\(mResult)"
                                }
                                
                                if hour == hResult {
                                    if weekdayMins == "" {
                                        weekdayMins += mResult
                                    }else{
                                        weekdayMins += ", " + mResult
                                    }
                                    
                                }
                            }
                            
                            for weekdayTime in (self.shuttleStop?.weekendTimes)! {
                                let time: String = weekdayTime.time!
                                let dIdx: String.Index = time.index(time.startIndex, offsetBy: 1)
                                let mIdx: String.Index = time.index(time.startIndex, offsetBy: 2)
                                let hResult = String(time[...dIdx])
                                var mResult = String(time[mIdx...])
                                
                                if Int(mResult)! < 10 {
                                    mResult = "0\(mResult)"
                                }
                                
                                if hour == hResult {
                                    if weekendMins == "" {
                                        weekendMins += mResult
                                    }else{
                                        weekendMins += ", " + mResult
                                    }
                                    
                                }
                            }
                            
                            if weekendMins == "" && weekdayMins == "" {
                                
                            }else{
                                tempTimeTables.append(TimeTableData(secondMinsDescription: "", seq: i, firstMinsDescription: "", firstMins: weekdayMins, hour: hour, secondMins: weekendMins))
                            }
                        }
                        
                        self.busTimeTable = BusTimeTable(routeName: nil, timeTable: tempTimeTables)
                        
                        self.setTableData()
                        
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    func getTransportationTrainsTimeTable(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getArexTimeInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationTrainsTimeTable + terminalId + "/" + CommonUtils.getTodayDate(format: "yyyyMMdd")
        
        Session.default.request(
            apiUrl,
            method: .get,
            //            parameters:
            //            [
            //                "terminalId": terminalId,
            //                "busUsid": busId
            //            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<BusTimeTable>.self, from: dataJson)
                            
                            self.busTimeTable = result?.data as! BusTimeTable
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.setAREXTableData()
                        
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
extension BusStopTimeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.busTimeTable?.timeTable?.count ?? 0
        return self.busTimetableRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusStopTimeTableViewCell")! as! BusStopTimeTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.type = self.type
        cell.isTodayInWeekend = self.isTodayInWeekend
        if self.rowIndex == -1{
            cell.rowIndex = 0
        }else{
            cell.rowIndex = self.rowIndex
        }
        
        if self.colIndex == -1{
            cell.colIndex = 0
        }else{
            cell.colIndex = self.colIndex
        }
        
        cell.indexRow = indexPath.row
        cell.viewWidth = (self.view.frame.width - SizeUtils.sideMargin * 2) / 6
        cell.busTimetableRow = self.busTimetableRows[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeUtils.tableHeight * 2
    }

}
