//
//  FlightSeasonViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/09/30.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FlightSeasonViewController: BaseViewController {
    
    var type = "dep"
    var arrayAriports = [FlightAirport]()
    var arrayAriportsString = [String]()
    
    var flightSeasons = [FlightSeason]()
    
    var iPos = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightSeasonViewController.self))
        self.initUi()
        self.getFlightsAirports()
    }

    private let flightSearchDestinationBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let flightSearchDestination : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "flight_search_destination_content".localized
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.isUserInteractionEnabled = false
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    private let flightSearchDestinationSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flight_season_header_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var flight_season_airline : UILabel = {
        let label = UILabel()
        label.text = "flight_season_airline".localized
        return label
    }()
    private var flight_season_time : UILabel = {
        let label = UILabel()
        label.text = "flight_season_time".localized
        return label
    }()
    private var flight_season_mon : UILabel = {
        let label = UILabel()
        label.text = "flight_season_mon".localized
        return label
    }()
    private var flight_season_tue : UILabel = {
        let label = UILabel()
        label.text = "flight_season_tue".localized
        return label
    }()
    private var flight_season_wed : UILabel = {
        let label = UILabel()
        label.text = "flight_season_wed".localized
        return label
    }()
    private var flight_season_thu : UILabel = {
        let label = UILabel()
        label.text = "flight_season_thu".localized
        return label
    }()
    private var flight_season_fri : UILabel = {
        let label = UILabel()
        label.text = "flight_season_fri".localized
        return label
    }()
    private var flight_season_sat : UILabel = {
        let label = UILabel()
        label.text = "flight_season_sat".localized
        return label
    }()
    private var flight_season_sun : UILabel = {
        let label = UILabel()
        label.text = "flight_season_sun".localized
        return label
    }()
    private var flight_season_period : UILabel = {
        let label = UILabel()
        label.text = "flight_season_period".localized
        return label
    }()

    private let season_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()

}
extension FlightSeasonViewController{
    func initUi(){
        
        
        self.flightSearchDestinationBorderView.isUserInteractionEnabled = true
        self.flightSearchDestinationBorderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightAirports)))
        self.view.addSubview(self.flightSearchDestinationBorderView)
        self.flightSearchDestinationBorderView.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchDestinationBorderView.addSubview(self.flightSearchDestination)
        self.flightSearchDestination.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchDestinationBorderView.addSubview(self.flightSearchDestinationSearchImage)
        self.flightSearchDestinationSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.flight_season_airline = self.makeHeaderCell(label: self.flight_season_airline)
        self.flight_season_time = self.makeHeaderCell(label: self.flight_season_time)
        self.flight_season_mon = self.makeHeaderCell(label: self.flight_season_mon)
        self.flight_season_tue = self.makeHeaderCell(label: self.flight_season_tue)
        self.flight_season_wed = self.makeHeaderCell(label: self.flight_season_wed)
        self.flight_season_thu = self.makeHeaderCell(label: self.flight_season_thu)
        self.flight_season_fri = self.makeHeaderCell(label: self.flight_season_fri)
        self.flight_season_sat = self.makeHeaderCell(label: self.flight_season_sat)
        self.flight_season_sun = self.makeHeaderCell(label: self.flight_season_sun)
        self.flight_season_period = self.makeHeaderCell(label: self.flight_season_period)
        
        self.view.addSubview(self.flight_season_header_view)
        self.flight_season_header_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDestinationBorderView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        let cellWidth = (self.view.frame.width - SizeUtils.sideMargin * 2) / 14
        self.flight_season_header_view.addSubview(self.flight_season_airline)
        self.flight_season_airline.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth * 2)
            make.bottom.equalToSuperview()
        }
        self.flight_season_header_view.addSubview(self.flight_season_time)
        self.flight_season_time.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_airline.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth * 1.5)
        }
        self.flight_season_header_view.addSubview(self.flight_season_mon)
        self.flight_season_mon.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_time.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_tue)
        self.flight_season_tue.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_mon.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_wed)
        self.flight_season_wed.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_tue.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_thu)
        self.flight_season_thu.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_wed.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_fri)
        self.flight_season_fri.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_thu.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_sat)
        self.flight_season_sat.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_fri.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_sun)
        self.flight_season_sun.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_sat.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth)
        }
        self.flight_season_header_view.addSubview(self.flight_season_period)
        self.flight_season_period.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.flight_season_sun.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo(cellWidth * 3.5)
        }
        
        self.season_tableview.delegate = self
        self.season_tableview.dataSource = self
        self.season_tableview.separatorStyle = .none
        self.season_tableview.register(FlightSeasonTableViewCell.self, forCellReuseIdentifier: "FlightSeasonTableViewCell")
        
        self.view.addSubview(self.season_tableview)
        self.season_tableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.flight_season_header_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
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
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }
}
extension FlightSeasonViewController {
    @objc func clickFlightAirports(){
        print("clickFlightAirports")
        
        var popupTitle = "flight_search_destination_content".localized
        if self.type == "arr" {
            popupTitle = "flight_search_origin_content".localized
        }
        self.openListPopup(arrayString: self.arrayAriportsString, popupTitle: popupTitle)
    }
}
extension FlightSeasonViewController {
    func getFlightsAirports(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightSearchAirport")
        let apiUrl = ServerUtils.serverUrl + ServerUtils.flightsAirports
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "scheduleDate": CommonUtils.getTodayDate(format: "yyyyMMdd")
            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<[FlightAirport]>.self, from: dataJson)
                            
                            self.arrayAriports = result?.data as! [FlightAirport]
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        var i = 0
                        for arrayAriport in self.arrayAriports {
                            if self.iPos == -1 && arrayAriport.iataCode == "NRT" {
                                self.iPos = i
                                self.flightSearchDestination.text = CommonUtils.getLocaleString(locale: arrayAriport.name)
                            }
                            self.arrayAriportsString.append(CommonUtils.getLocaleString(locale: arrayAriport.name))
                            
                            i += 1
                        }
                        
                        self.getFlightDepSeason()
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    func openListPopup(arrayString : [String], popupTitle : String){
        let popupVC = PopupListViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.delegate = self
        popupVC.tag = self.iPos
        popupVC.type = "flightSeason"
        popupVC.arrayString = arrayString
        popupVC.popupTitle = popupTitle
        self.present(popupVC, animated: false, completion: nil)
    }
    func getFlightDepSeason(){
        Loading.show()
        var apiUrl = ServerUtils.serverUrl + ServerUtils.getFlightDepSeason
        var param = [
                "flightDate": CommonUtils.getTodayDate(format: "yyyyMMdd"),
                "destinationAirportCode": arrayAriports[iPos].iataCode ?? ""
        ]
        if self.type == "arr"{
            
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArrSeason")
            apiUrl = ServerUtils.serverUrl + ServerUtils.getFlightArrSeason
            param = [
                    "flightDate": CommonUtils.getTodayDate(format: "yyyyMMdd"),
                    "originAirportCode": arrayAriports[iPos].iataCode ?? ""
            ]
        }else{
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightDepSeason")
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
                            let result = try? JSONDecoder().decode(BaseResult<[FlightSeason]>.self, from: dataJson)

                            self.flightSeasons = result?.data as! [FlightSeason]
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.season_tableview.reloadData()
                        
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
extension FlightSeasonViewController : PoupListDelegate{
    func setResult(tag: Int, row: Int) {
        self.iPos = row
        self.flightSearchDestination.text = CommonUtils.getLocaleString(locale: arrayAriports[row].name)
        
        self.getFlightDepSeason()
    }
}
extension FlightSeasonViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flightSeasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightSeasonTableViewCell")! as! FlightSeasonTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.cellWidth = (self.view.frame.width - SizeUtils.sideMargin * 2) / 14
        cell.flightSeason = self.flightSeasons[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeUtils.tableBigHeight * 2
        
    }

}

