//
//  PassengerCongestionSubViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/01.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PassengerCongestionSubViewController: BaseViewController {
    
    var terminalType = "T1" // T1, T2
    var type = "dep" // dep, arr
    
    var arrayDate = [String]()
    var passengerInfos = [PassengerInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PassengerCongestionSubViewController.self))
        self.initUi()
        self.getPassenger()
    }
    
    private let topLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let passenger_title : UILabel = {
        let label = UILabel()
        label.text = "passenger_title".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let flightSearchDateBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        view.sizeToFit()
        return view
    }()
    private let flightSearchDate : UILabel = {
        let label = UILabel()
        label.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd (E)")
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightSearchDateSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let headerView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var passenger_t1_1_table_header_1: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_1_table_header_1".localized
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_2: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_1_table_header_2".localized
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_3: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_1_table_header_3".localized
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_4: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_1_table_header_4".localized
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_5: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_1_table_header_5".localized
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_6: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_1_table_header_6".localized
        label.sizeToFit()
        return label
    }()
    
    private let resultTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
  
}
extension PassengerCongestionSubViewController {
    func initUi(){
        
        self.view.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.view.addSubview(self.passenger_title)
        self.passenger_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.flightSearchDateBorderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightSearchDate)))
        self.view.addSubview(self.flightSearchDateBorderView)
        self.flightSearchDateBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.passenger_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchDateBorderView.addSubview(self.flightSearchDate)
        self.flightSearchDate.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchDateBorderView.addSubview(self.flightSearchDateSearchImage)
        self.flightSearchDateSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.passenger_t1_1_table_header_1 = self.makeHeaderCell(label: self.passenger_t1_1_table_header_1)
        self.passenger_t1_1_table_header_2 = self.makeHeaderCell(label: self.passenger_t1_1_table_header_2)
        self.passenger_t1_1_table_header_3 = self.makeHeaderCell(label: self.passenger_t1_1_table_header_3)
        self.passenger_t1_1_table_header_4 = self.makeHeaderCell(label: self.passenger_t1_1_table_header_4)
        self.passenger_t1_1_table_header_5 = self.makeHeaderCell(label: self.passenger_t1_1_table_header_5)
        self.passenger_t1_1_table_header_6 = self.makeHeaderCell(label: self.passenger_t1_1_table_header_6)
        
        
        if self.type == "arr" {
            self.passenger_t1_1_table_header_2.text = "passenger_t1_2_table_header_2".localized
            self.passenger_t1_1_table_header_3.text = "passenger_t1_2_table_header_3".localized
            self.passenger_t1_1_table_header_4.text = "passenger_t1_2_table_header_4".localized
            self.passenger_t1_1_table_header_5.text = "passenger_t1_2_table_header_5".localized
        }else{
            self.passenger_t1_1_table_header_2.text = "passenger_t1_1_table_header_2".localized
            self.passenger_t1_1_table_header_3.text = "passenger_t1_1_table_header_3".localized
            self.passenger_t1_1_table_header_4.text = "passenger_t1_1_table_header_4".localized
            self.passenger_t1_1_table_header_5.text = "passenger_t1_1_table_header_5".localized
        }
        
        if self.terminalType == "T2" {
            if self.type == "arr" {
                self.passenger_t1_1_table_header_2.text = "passenger_t2_2_table_header_2".localized
                self.passenger_t1_1_table_header_3.text = "passenger_t2_2_table_header_3".localized
            }else{
                self.passenger_t1_1_table_header_2.text = "passenger_t2_1_table_header_2".localized
                self.passenger_t1_1_table_header_3.text = "passenger_t2_1_table_header_3".localized
            }
        }
        
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDateBorderView.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.headerView.addSubview(self.passenger_t1_1_table_header_1)
        self.passenger_t1_1_table_header_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            if self.terminalType == "T2" {
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            }else{
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            }
            
            make.height.equalTo(SizeUtils.tableBigHeight)
            make.bottom.equalToSuperview()
        }
        self.headerView.addSubview(self.passenger_t1_1_table_header_2)
        self.passenger_t1_1_table_header_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.passenger_t1_1_table_header_1.snp.trailing)
            if self.terminalType == "T2" {
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            }else{
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            }
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.passenger_t1_1_table_header_3)
        self.passenger_t1_1_table_header_3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.passenger_t1_1_table_header_2.snp.trailing)
            if self.terminalType == "T2" {
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            }else{
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            }
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.passenger_t1_1_table_header_4)
        self.passenger_t1_1_table_header_4.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.passenger_t1_1_table_header_3.snp.trailing)
            if self.terminalType == "T2" {
                make.width.equalTo(0)
            }else{
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            }
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.passenger_t1_1_table_header_5)
        self.passenger_t1_1_table_header_5.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.passenger_t1_1_table_header_4.snp.trailing)
            if self.terminalType == "T2" {
                make.width.equalTo(0)
            }else{
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            }
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.passenger_t1_1_table_header_6)
        self.passenger_t1_1_table_header_6.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.passenger_t1_1_table_header_5.snp.trailing)
            if self.terminalType == "T2" {
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            }else{
                make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 6)
            }
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        self.resultTableView.backgroundColor = .white
        self.resultTableView.separatorStyle = .none
        
        self.resultTableView.register(PassengerCongestionTableViewCell.self, forCellReuseIdentifier: "PassengerCongestionTableViewCell")
        self.resultTableView.register(PassengerCongestionFooterTableViewCell.self, forCellReuseIdentifier: "PassengerCongestionFooterTableViewCell")
        
        self.view.addSubview(self.resultTableView)
        
        self.resultTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.headerView.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 8) - 10)
            
        }
    }
    
    func openListPopup(type : String, arrayString : [String], popupTitle : String){
        let popupVC = PopupListViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.passengerCongestionSub = self
        popupVC.type = type
        popupVC.arrayString = arrayString
        popupVC.popupTitle = popupTitle
        self.present(popupVC, animated: false, completion: nil)
    }
    
    func setString(type:String, row:Int){
        if type == CodeUtils.DATE {
            self.flightSearchDate.text = arrayDate[row]
            
            self.getPassenger()
        }
    }
    
    func makeHeaderCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }
}
extension PassengerCongestionSubViewController {
    @objc func clickFlightSearchDate(){
        print("clickFlightSearchDate")
        if self.arrayDate.count > 0 {
            self.arrayDate.removeAll()
        }
        for i in -7 ..< 2 {
            self.arrayDate.append(CommonUtils.getWantedDate(format: "yyyy.MM.dd (E)", sub: i))
        }
        
        self.openListPopup(type: CodeUtils.DATE, arrayString: arrayDate, popupTitle: "flight_search_date".localized)
        
    }
}
extension PassengerCongestionSubViewController {
    //    passenger
    func getPassenger(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        var departures = "departures"
        if type == "arr" {
            departures = "arrivals"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getPassengerInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.passenger + terminalId + "/" + departures
            
            Session.default.request(
                apiUrl,
                method: .get,
                parameters:
                [
                    "date": CommonUtils.convertToStringFromStringDate(inputString: self.flightSearchDate.text, inputFormat: "yyyy.MM.dd (E)", outputFormat: "yyyyMMdd")
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
                                let result = try? JSONDecoder().decode(BaseResult<[PassengerInfo]>.self, from: dataJson)
                                
                                self.passengerInfos = result?.data as! [PassengerInfo]
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                            var total0:Int = 0
                            var total1:Int = 0
                            var total2:Int = 0
                            var total3:Int = 0
                            var total4:Int = 0
                            
                            for passengerInfo in self.passengerInfos {
                                if self.terminalType == "T1" {
                                    if self.type == "dep" {
                                        total0 += passengerInfo.section12Passengers ?? 0
                                        total1 += passengerInfo.section3Passengers ?? 0
                                        total2 += passengerInfo.section4Passengers ?? 0
                                        total3 += passengerInfo.section56Passengers ?? 0
                                        total4 += passengerInfo.totalPassengers ?? 0
                                        
                                    }else {
                                        
                                        total0 += passengerInfo.eastSectionPassengers ?? 0
                                        total1 += passengerInfo.westSectionPassengers ?? 0
                                        total2 += passengerInfo.cSectionPassengers ?? 0
                                        total3 += passengerInfo.dSectionPassengers ?? 0
                                        total4 += passengerInfo.totalPassengers ?? 0
                                    }
                                }else {
                                    if self.type == "dep" {
                                        total0 += passengerInfo.section1Passengers ?? 0
                                        total1 += passengerInfo.section2Passengers ?? 0
                                        total4 += passengerInfo.totalPassengers ?? 0
                                    }else {
                                        total0 += passengerInfo.eastSectionPassengers ?? 0
                                        total1 += passengerInfo.westSectionPassengers ?? 0
                                        total4 += passengerInfo.totalPassengers ?? 0
                                    }
                                }
                            }
                            let tempPassengerInfo = PassengerInfo()
                            if self.terminalType == "T1" {
                                if self.type == "dep" {
                                
                                    tempPassengerInfo.section12Passengers = total0
                                    tempPassengerInfo.section3Passengers = total1
                                    tempPassengerInfo.section4Passengers = total2
                                    tempPassengerInfo.section56Passengers = total3
                                    tempPassengerInfo.totalPassengers = total4
                                    
                                }else {
                                    tempPassengerInfo.eastSectionPassengers = total0
                                    tempPassengerInfo.westSectionPassengers = total1
                                    tempPassengerInfo.cSectionPassengers = total2
                                    tempPassengerInfo.dSectionPassengers = total3
                                    tempPassengerInfo.totalPassengers = total4
                                }
                            }else {
                                if self.type == "dep" {
                                    tempPassengerInfo.section1Passengers = total0
                                    tempPassengerInfo.section2Passengers = total1
                                    tempPassengerInfo.totalPassengers = total4
                                }else {
                                    tempPassengerInfo.eastSectionPassengers = total0
                                    tempPassengerInfo.westSectionPassengers = total1
                                    tempPassengerInfo.totalPassengers = total4
                                }
                            }
                            self.passengerInfos.append(tempPassengerInfo)
                            self.resultTableView.reloadData()
                            
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
extension PassengerCongestionSubViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.type == "arr" {
            return self.passengerInfos.count
        }else {
            if self.passengerInfos.count != 0 {
                return self.passengerInfos.count + 1
            }else{
                return 0
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.type == "dep" && indexPath.row == self.passengerInfos.count {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PassengerCongestionFooterTableViewCell")! as! PassengerCongestionFooterTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.terminalType = self.terminalType
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PassengerCongestionTableViewCell")! as! PassengerCongestionTableViewCell
            
            
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cell.width = self.view.frame.width
            cell.type = self.type
            cell.terminalType = self.terminalType
            cell.row = indexPath.row
            
            if (indexPath.row - 1) > 0 {
                cell.beforeTotal = self.passengerInfos[indexPath.row - 1].totalPassengers ?? 0
            }
            if (indexPath.row + 1) < self.passengerInfos.count {
                cell.afterTotal = self.passengerInfos[indexPath.row + 1].totalPassengers ?? 0
            }
            
            cell.passengerInfo = self.passengerInfos[indexPath.row]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.type == "dep" && indexPath.row == self.passengerInfos.count {
            return 230
        }else{
            return SizeUtils.tableBigHeight
        }
        
    }
}

