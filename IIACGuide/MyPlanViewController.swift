//
//  MyPlanViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/18.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyPlanViewController: BaseViewController {
    
    var type = "dep"
    var date = ""
    
    var flightDetail : FlightDetail?
    
    var compareDate = "200001010000"
    
    var parkingConDatas = [ParkingConData]()
    weak var hostedVC: UIViewController?
    
    var arrCongestionInfos = [ArrCongestionInfo]()
    var tempArrCongestionInfos = [ArrCongestionInfo]()
    
    var entryMoveTimes = [EntryMoveTime]()
    
    weak var arrCongestionHostedVC: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MyPlanViewController.self))
        
        self.initUi()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.refreshList()
    }
    
    private let empty_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let myplan_no_result_msg_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_no_result_msg_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let myplan_no_result_msg_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_no_result_msg_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    
    private let flight_search_title_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = 35 / 2
        view.sizeToFit()
        return view
    }()
    private let flight_search_title : UILabel = {
        let label = UILabel()
        label.text = "flight_search_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let myplan_flight_search : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_flight_search")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let my_plan_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
}
extension MyPlanViewController {
    func initUi(){
        self.view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        
        self.view.addSubview(self.empty_view)
        self.empty_view.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        self.flight_search_title_view.isUserInteractionEnabled = true
        self.flight_search_title_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFlightSearch)))
        self.empty_view.addSubview(self.flight_search_title_view)
        self.flight_search_title_view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset((-CommonUtils.getTopPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getBottomPadding())/2)
            make.width.equalTo(self.view.frame.width * 2 / 3)
            make.height.equalTo(35)
        }
        
        self.flight_search_title_view.addSubview(self.flight_search_title)
        self.flight_search_title.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-(SizeUtils.iconSize + SizeUtils.sideMargin) / 2)
            make.centerY.equalToSuperview()
        }
        self.flight_search_title_view.addSubview(self.myplan_flight_search)
        self.myplan_flight_search.snp.makeConstraints { (make) in
            make.leading.equalTo(self.flight_search_title.snp.trailing).offset(SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.empty_view.addSubview(self.myplan_no_result_msg_2)
        self.myplan_no_result_msg_2.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width * 2 / 3)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.flight_search_title_view.snp.top).offset(-SizeUtils.verticalMargin)
        }
        self.empty_view.addSubview(self.myplan_no_result_msg_1)
        self.myplan_no_result_msg_1.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width * 2 / 3)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.myplan_no_result_msg_2.snp.top).offset(-SizeUtils.verticalMargin)
        }
        
        self.my_plan_tableview.delegate = self
        self.my_plan_tableview.dataSource = self
        self.my_plan_tableview.separatorStyle = .none
        self.my_plan_tableview.register(MyPlanTicketTableViewCell.self, forCellReuseIdentifier: "MyPlanTicketTableViewCell")
        self.my_plan_tableview.register(MyPlanCongestionTableViewCell.self, forCellReuseIdentifier: "MyPlanCongestionTableViewCell")
        self.my_plan_tableview.register(MyPlanWelcomeTableViewCell.self, forCellReuseIdentifier: "MyPlanWelcomeTableViewCell")
        self.my_plan_tableview.register(MyPlanParkingTableViewCell.self, forCellReuseIdentifier: "MyPlanParkingTableViewCell")
        self.my_plan_tableview.register(MyPlanImmigrationTableViewCell.self, forCellReuseIdentifier: "MyPlanImmigrationTableViewCell")
        self.my_plan_tableview.register(MyPlanCheckTableViewCell.self, forCellReuseIdentifier: "MyPlanCheckTableViewCell")
        self.my_plan_tableview.register(MyPlanHallCongestionTableViewCell.self, forCellReuseIdentifier: "MyPlanHallCongestionTableViewCell")
        self.my_plan_tableview.register(MyPlanHallTableViewCell.self, forCellReuseIdentifier: "MyPlanHallTableViewCell")
        self.my_plan_tableview.register(MyPlanArrTableViewCell.self, forCellReuseIdentifier: "MyPlanArrTableViewCell")
        self.my_plan_tableview.register(MyPlanRealTimeTableViewCell.self, forCellReuseIdentifier: "MyPlanRealTimeTableViewCell")
        self.my_plan_tableview.register(MyPlanBaggageTableViewCell.self, forCellReuseIdentifier: "MyPlanBaggageTableViewCell")
        self.my_plan_tableview.register(MyPlanProhibitedTableViewCell.self, forCellReuseIdentifier: "MyPlanProhibitedTableViewCell")
        self.my_plan_tableview.register(MyPlanCustomsTableViewCell.self, forCellReuseIdentifier: "MyPlanCustomsTableViewCell")
        self.my_plan_tableview.register(MyPlanDutyFreeTableViewCell.self, forCellReuseIdentifier: "MyPlanDutyFreeTableViewCell")
        self.my_plan_tableview.register(MyPlanArrHallTableViewCell.self, forCellReuseIdentifier: "MyPlanArrHallTableViewCell")
        self.my_plan_tableview.register(MyPlanBoardingTableViewCell.self, forCellReuseIdentifier: "MyPlanBoardingTableViewCell")
        self.my_plan_tableview.register(MyPlanBackHomeTableViewCell.self, forCellReuseIdentifier: "MyPlanBackHomeTableViewCell")
        self.my_plan_tableview.register(MyPlanEndTableViewCell.self, forCellReuseIdentifier: "MyPlanEndTableViewCell")
        
        
        self.my_plan_tableview.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        
        self.my_plan_tableview.isHidden = true
        self.view.addSubview(self.my_plan_tableview)
        self.my_plan_tableview.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 3) - 5)
        }
        
    }
}
extension MyPlanViewController {
    @objc func tapFlightSearch(){
        self.openFlightInfoSearchWithParam(type: self.type, date: self.date)
    }
    
    func refreshList(){
        self.flightDetail = self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "flightType == %@ AND scheduleDate LIKE '*\(CommonUtils.convertToStringFromStringDate(inputString: self.date, inputFormat: "yyyy-MM-dd", outputFormat: "yyyyMMdd"))*'", self.type)).first
    
        
        if self.flightDetail != nil {
            self.empty_view.isHidden = true
            self.my_plan_tableview.isHidden = false
            self.my_plan_tableview.snp.remakeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 3) - 5)
            }
            
            self.getFlightsDeparturesDetail(fimsId: (self.flightDetail?.fimsFlightId)!)
            self.getParkingCongestion()
            
            var terminalId = "P01"
            if self.flightDetail?.terminalNo == "P03" {
                terminalId = "P03"
            }
            self.getEntryMoveTimeList(terminalId: terminalId)
            
            if self.flightDetail?.terminalNo != "P03" {
                self.getEntryMoveTimeList(terminalId: "P02")
            }
        }else{
            self.empty_view.isHidden = false
            self.my_plan_tableview.isHidden = true
            self.my_plan_tableview.snp.remakeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }
    }
    
    func deleteList(){
        
        self.openTwoButtonPopup(title: "home_bottom_menu_3".localized, contents: "myplan_select_delete_popup_msg".localized, completion: {
            try! self.realm.write {
                self.realm.delete(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "usid == %@", self.flightDetail?.usid as! CVarArg)))
            }
            
            self.deleteBookmark(fimsFlightId: self.flightDetail?.usid ?? "")
            self.refreshList()
        })

    }
    func tapCongestionInfo(){
        self.moveRealTime(subCurrentTap: 3)
    }
    func tapFinance(terminalType: String = "T1", currentTap: Int = 0){
        self.openShopping(paramType: "finance", terminalType: terminalType, currentTap: currentTap)
    }
    func tapOther(terminalType: String = "T1", currentTap: Int = 0){
        self.openShopping(paramType: "other", terminalType: terminalType, currentTap: currentTap)
    }
    func tapShopping(terminalType: String = "T1", currentTap: Int = 0){
        self.openShopping(paramType: "shopping", terminalType: terminalType, currentTap: currentTap)
    }
    func tapFood(terminalType: String = "T1", currentTap: Int = 0){
        self.openShopping(paramType: "food", terminalType: terminalType, currentTap: currentTap)
    }
    func tapRest(terminalType: String = "T1", currentTap: Int = 0){
        self.openShopping(paramType: "rest", terminalType: terminalType, currentTap: currentTap)
    }
    func tapCoupon(isDutyFree:Bool = false){
        self.openCoupon(isDutyFree: isDutyFree)
    }
    
    func tapPublicTransport(terminalType : String = "T1", currentTap: Int = 0){
        self.movePublicTransport(terminalType: terminalType, currentTap: currentTap)
    }
    func tapParking(terminalType : String = "T1", currentTap: Int = 0){
        self.moveParking(terminalType: terminalType, currentTap: currentTap)
    }
    
    func tapAirportTab(currentTab: Int = 0){
        self.openAirportTab(index: currentTab)
    }
    func tabAirportArriveTab(currentTab: Int = 0){
        self.openAirportArriveTab(index: currentTab)
    }
    
    
}
extension MyPlanViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        if indexPath.row == 0 {
            let flightInfoDetailVC = FlightInfoDetailViewController()
            flightInfoDetailVC.type = self.type
            flightInfoDetailVC.fimsFlightId = (self.flightDetail?.fimsFlightId)!
            self.navigationController?.pushViewController(flightInfoDetailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        if self.flightDetail?.scheduleTime != nil{
            self.compareDate = "\(self.flightDetail?.scheduleDate ?? "20000101")\(self.flightDetail?.scheduleTime ?? "0000")"
        }
        if self.flightDetail?.estimateTime != nil{
            self.compareDate = "\(self.flightDetail?.estimateDate ?? "20000101")\(self.flightDetail?.estimateTime ?? "0000")"
        }
        
        let diffMin = CommonUtils.minDiffByString(start: self.compareDate, end: CommonUtils.getTodayDate(format: "yyyyMMddkkmm"), inputFormat: "yyyyMMddkkmm")
        
        if diffMin > 11 * 60 {
            return 1
        }else{
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanTicketTableViewCell")! as! MyPlanTicketTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.viewWidth = self.view.frame.width
            cell.type = self.type
            cell.delegate = self
            cell.flightDetail = self.flightDetail
            
            return cell
        }else if indexPath.row == 1 {
            if self.type == "dep" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanCongestionTableViewCell")! as! MyPlanCongestionTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.compareDate = self.compareDate
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanWelcomeTableViewCell")! as! MyPlanWelcomeTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }
        }else if indexPath.row == 2 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanParkingTableViewCell")! as! MyPlanParkingTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                if self.hostedVC != nil {
                    for view in cell.realTimeInfoParkingView.subviews {
                        view.removeFromSuperview()
                    }
                    hostedVC?.view.frame = CGRect(x: 0, y: 0, width: cell.realTimeInfoParkingView.frame.width, height: cell.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 5))
                    cell.realTimeInfoParkingView.addSubview((self.hostedVC?.view)!)
                    self.hostedVC?.didMove(toParent: self)

                }
                
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanImmigrationTableViewCell")! as! MyPlanImmigrationTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                
                return cell
            }
        }else if indexPath.row == 3 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanCheckTableViewCell")! as! MyPlanCheckTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanHallCongestionTableViewCell")! as! MyPlanHallCongestionTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                if self.arrCongestionHostedVC != nil {
                    for view in cell.realTimeInfoArrConestionView.subviews {
                        view.removeFromSuperview()
                    }
                    arrCongestionHostedVC?.view.frame = CGRect(x: 0, y: 0, width: cell.realTimeInfoArrConestionView.frame.width - (SizeUtils.sideMargin * 2), height: SizeUtils.tableSmallHeight * 5)
                    cell.realTimeInfoArrConestionView.addSubview((self.arrCongestionHostedVC?.view)!)
                    self.arrCongestionHostedVC?.didMove(toParent: self)

                }
                
                return cell
            }
        }else if indexPath.row == 4 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanHallTableViewCell")! as! MyPlanHallTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.counter = self.flightDetail?.counterNoRange ?? ""
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanArrTableViewCell")! as! MyPlanArrTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }
        }else if indexPath.row == 5 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanRealTimeTableViewCell")! as! MyPlanRealTimeTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                let realTimeInfoVC = RealTimeInfoViewController()
                if self.flightDetail?.terminalNo == "P03" {
                    realTimeInfoVC.terminalType = "T2"
                }else{
                    realTimeInfoVC.terminalType = "T1"
                }
                
                realTimeInfoVC.viewWidth = self.view.frame.width - SizeUtils.sideMargin * 4
                
                for view in cell.white_background_view.subviews {
                    view.removeFromSuperview()
                }
                realTimeInfoVC.view.frame = CGRect(x: 0, y: 0, width: cell.white_background_view.frame.width, height: cell.white_background_view.frame.height)
                cell.white_background_view.addSubview((realTimeInfoVC.view)!)
                realTimeInfoVC.didMove(toParent: self)
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanBaggageTableViewCell")! as! MyPlanBaggageTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.carouselNo = self.flightDetail?.carouselNo
                
                return cell
            }
        }else if indexPath.row == 6 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanProhibitedTableViewCell")! as! MyPlanProhibitedTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanCustomsTableViewCell")! as! MyPlanCustomsTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }
        }else if indexPath.row == 7 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanDutyFreeTableViewCell")! as! MyPlanDutyFreeTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.coupons = Array(self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignType == %@", "DutyFree")))
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanArrHallTableViewCell")! as! MyPlanArrHallTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.exitDoorNo = self.flightDetail?.exitDoorNo ?? ""
                
                return cell
            }
        }else if indexPath.row == 8 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanBoardingTableViewCell")! as! MyPlanBoardingTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                if self.flightDetail?.scheduleTime != nil {
                    cell.time = CommonUtils.convertToStringFromStringDate(inputString: self.flightDetail?.scheduleTime, inputFormat: "kkmm", outputFormat: "kk:mm")
                }else if self.flightDetail?.estimateTime != nil {
                    cell.time = CommonUtils.convertToStringFromStringDate(inputString: self.flightDetail?.estimateTime, inputFormat: "kkmm", outputFormat: "kk:mm")
                }
                
                cell.gateNo = self.flightDetail?.gateNo ?? ""
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanBackHomeTableViewCell")! as! MyPlanBackHomeTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }
        }else if indexPath.row == 9 {
            if self.type == "dep" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanEndTableViewCell")! as! MyPlanEndTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanBackHomeTableViewCell")! as! MyPlanBackHomeTableViewCell
                
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.viewWidth = self.view.frame.width
                cell.delegate = self
                cell.terminalId = self.flightDetail?.terminalNo ?? "P01"
                cell.isHidden = true
                
                return cell
            }
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlanTicketTableViewCell")! as! MyPlanTicketTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.viewWidth = self.view.frame.width
            cell.type = self.type
            cell.flightDetail = self.flightDetail
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.width
        }else if indexPath.row == 1 {
            if self.type == "dep" {
                return 375 * 1.15
            }else{
                return 375 * 2 / 5
            }
        }else if indexPath.row == 2 {
            if self.type == "dep" {
                if self.flightDetail?.terminalNo == "P03"{
                    return 375 * 1.1 - SizeUtils.tableHeight * 3
                }else{
                    return 375 * 1.1
                }
                
            }else{
                return 375 * 1.2
            }
        }else if indexPath.row == 3 {
            if self.type == "dep" {
                return 375 * 2 / 3
            }else{
                if self.flightDetail?.terminalNo == "P03"{
                    return 0
                }else {
                    return 375 * 0.55
                }
            }
        }else if indexPath.row == 4 {
            if self.type == "dep" {
                return 375 * 0.9
            }else{
                return 375 * 0.45
            }
        }else if indexPath.row == 5 {
            if self.type == "dep" {
                return 375 * 1.35
            }else{
                return 375 * 0.45
            }
        }else if indexPath.row == 6 {
            if self.type == "dep" {
                return 375 * 0.7 + SizeUtils.navigationHeight
            }else{
                return 375 * 0.4
            }
        }else if indexPath.row == 7 {
            if self.type == "dep" {
                return 375 * 0.85 + SizeUtils.couponeHeight * 3
            }else{
                return 375 * 0.5
            }
        }else if indexPath.row == 8 {
            if self.type == "dep" {
                if self.flightDetail?.terminalNo == "P02"{
                    return 375 * 0.72
                }else{
                    return 375 * 0.75
                }
                
            }else{
                return 375 * 0.55
            }
        }else if indexPath.row == 9 {
            if self.type == "dep" {
                return 375 * 0.4
                
            }else{
                return 0
            }
        }else {
            return self.view.frame.width
        }
        
    }

}
extension MyPlanViewController {
    func getFlightsDeparturesDetail(fimsId : String){
        
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArr")
        
        var apiUrl = ServerUtils.serverUrl + ServerUtils.flightsDeparturesDetail + fimsId
        if(self.type == "arr"){
            apiUrl = ServerUtils.serverUrl + ServerUtils.flightsArrivalsDetail + fimsId
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArrDetail")
        }else{
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightDepDetail")
        }
        
        Session.default.request(
            apiUrl,
            method: .get,
            //            parameters:
            //            [
            //                "fromScheduleDate": CommonUtils.getTodayDate(format: "yyyyMMdd"),
            //                "fromScheduleTime": "0000"
            //            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
        .validate(statusCode: 200..<400)
        .responseJSON {response in
            switch response.result{
            case .success(let obj):
                let json = JSON(obj)
//                print(json)
                let code = json["code"]
                if code == 200 {
                    do {
                        let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        let result = try JSONDecoder().decode(BaseResult<FlightDetail>.self, from: dataJson)
                        
                        self.flightDetail = result.data
                    } catch {
                        print(error)
                    }
                    
                    self.my_plan_tableview.reloadData()
                    
                } else {
                    
                }
                Loading.hide()
            case .failure(let error):
                print(error)
                
                Loading.hide()
            }
        }
    }
    
    func getParkingCongestion(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getParkingCongestionInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.parkingCongestion
        
        var t1_short_1f = 0
        var t1_short_1f_total = 0
        var t1_short_b1 = 0
        var t1_short_b1_total = 0
        var t1_short_b2 = 0
        var t1_short_b2_total = 0
        var t1_long_tower_p1 = 0
        var t1_long_tower_p1_total = 0
        var t1_long_tower_p2 = 0
        var t1_long_tower_p2_total = 0
        var t1_long_p1 = 0
        var t1_long_p1_total = 0
        var t1_long_p2 = 0
        var t1_long_p2_total = 0
        var t1_long_p3 = 0
        var t1_long_p3_total = 0
        
        var t2_short_1f = 0
        var t2_short_1f_total = 0
        var t2_short_2f = 0
        var t2_short_2f_total = 0
        var t2_short_mf = 0
        var t2_short_mf_total = 0
        var t2_short_b1 = 0
        var t2_short_b1_total = 0
        var t2_long = 0
        var t2_long_total = 0
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "terminalId": self.flightDetail?.terminalNo ?? "P01"
            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json))
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[ParkingConData]>.self, from: dataJson)
                            
                            self.parkingConDatas = result?.data as! [ParkingConData]
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        
                        for parkingConData in self.parkingConDatas {
                            
                            for parkingConInfo in parkingConData.infos! {
                                if parkingConData.facilityID == "3GXTPRK1" {
                                    if parkingConInfo.floor == "T1_L4" {
                                        t1_short_1f = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_short_1f_total = parkingConInfo.totalCount ?? 0
                                    }else if parkingConInfo.floor == "T1_L1" {
                                        t1_short_b1 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_short_b1_total = parkingConInfo.totalCount ?? 0
                                    }else if parkingConInfo.floor == "T1_L2" {
                                        t1_short_b2 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_short_b2_total = parkingConInfo.totalCount ?? 0
                                    }else if parkingConInfo.floor == "T1_L2" {
                                        t1_short_b2 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_short_b2_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                                
                                if parkingConData.facilityID == "3GXTPRK8" {
                                    if parkingConInfo.floor == "T1_L1" {
                                        t1_long_tower_p1 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_long_tower_p1_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                                
                                if parkingConData.facilityID == "3GXTPRK7" {
                                    if parkingConInfo.floor == "T1_L1" {
                                        t1_long_tower_p2 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_long_tower_p2_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
   
                                if parkingConData.facilityID == "3GXTPRK6" {
                                    if parkingConInfo.floor == "T1_L1" {
                                        t1_long_p1 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_long_p1_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                                
                                if parkingConData.facilityID == "3GXTPRK5" {
                                    if parkingConInfo.floor == "T1_L1" {
                                        t1_long_p2 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_long_p2_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                                
                                if parkingConData.facilityID == "3GXTPRK9" {
                                    if parkingConInfo.floor == "T1_L1" {
                                        t1_long_p3 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t1_long_p3_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                                
                                if parkingConData.facilityID == "3CTARK11" {
                                    if parkingConInfo.floor == "T2_L3" {
                                        t2_short_1f = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t2_short_1f_total = parkingConInfo.totalCount ?? 0
                                    }else if parkingConInfo.floor == "T2_L4" {
                                        t2_short_2f = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t2_short_2f_total = parkingConInfo.totalCount ?? 0
                                    }else if parkingConInfo.floor == "T2_L2" {
                                        t2_short_mf = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t2_short_mf_total = parkingConInfo.totalCount ?? 0
                                    }else if parkingConInfo.floor == "T2_L1" {
                                        t2_short_b1 = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t2_short_b1_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                                
                                if parkingConData.facilityID == "3CTARK12" {
                                    if parkingConInfo.floor == "T2_L1" {
                                        t2_long = (parkingConInfo.totalCount ?? 0) - (parkingConInfo.carCount ?? 0)
                                        t2_long_total = parkingConInfo.totalCount ?? 0
                                    }
                                }
                            }
                        }
                        
                        if self.flightDetail?.terminalNo == "P03" {
//                            for view in self.realTimeInfoParkingView.subviews {
//                                view.removeFromSuperview()
//                            }
                            let parkingT2VC = ParkingT2ViewController()
                            
                            parkingT2VC.viewWidth = self.view.frame.width - SizeUtils.sideMargin * 4
                            
                            parkingT2VC.t2_short_1f = t2_short_1f
                            parkingT2VC.t2_short_1f_total = t2_short_1f_total
                            parkingT2VC.t2_short_2f = t2_short_2f
                            parkingT2VC.t2_short_2f_total = t2_short_2f_total
                            parkingT2VC.t2_short_mf = t2_short_mf
                            parkingT2VC.t2_short_mf_total = t2_short_mf_total
                            parkingT2VC.t2_short_b1 = t2_short_b1
                            parkingT2VC.t2_short_b1_total = t2_short_b1_total
                            parkingT2VC.t2_long = t2_long
                            parkingT2VC.t2_long_total = t2_long_total
                            
                            self.addChild(parkingT2VC)
//                            parkingT2VC.view.frame = CGRect(x: 0, y: 0, width: self.realTimeInfoParkingView.frame.width, height: self.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 5))
//                            self.realTimeInfoParkingView.addSubview(parkingT2VC.view)
                            self.hostedVC = parkingT2VC
                        }else {
//                            for view in self.realTimeInfoParkingView.subviews {
//                                view.removeFromSuperview()
//                            }
                            let parkingT1VC = ParkingT1ViewController()
                            
                            parkingT1VC.viewWidth = self.view.frame.width - SizeUtils.sideMargin * 4
                            
                            parkingT1VC.t1_short_1f = t1_short_1f
                            parkingT1VC.t1_short_1f_total = t1_short_1f_total
                            parkingT1VC.t1_short_b1 = t1_short_b1
                            parkingT1VC.t1_short_b1_total = t1_short_b1_total
                            parkingT1VC.t1_short_b2 = t1_short_b2
                            parkingT1VC.t1_short_b2_total = t1_short_b2_total
                            parkingT1VC.t1_long_p1 = t1_long_p1
                            parkingT1VC.t1_long_p1_total = t1_long_p1_total
                            parkingT1VC.t1_long_p2 = t1_long_p2
                            parkingT1VC.t1_long_p2_total = t1_long_p2_total
                            parkingT1VC.t1_long_p3 = t1_long_p3
                            parkingT1VC.t1_long_p3_total = t1_long_p3_total
                            parkingT1VC.t1_long_tower_p1 = t1_long_tower_p1
                            parkingT1VC.t1_long_tower_p1_total = t1_long_tower_p1_total
                            parkingT1VC.t1_long_tower_p2 = t1_long_tower_p2
                            parkingT1VC.t1_long_tower_p2_total = t1_long_tower_p2_total
                            
                            self.addChild(parkingT1VC)
//                            parkingT1VC.view.frame = CGRect(x: 0, y: 0, width: self.realTimeInfoParkingView.frame.width, height: self.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 8))
//                            self.realTimeInfoParkingView.addSubview(parkingT1VC.view)
                            self.hostedVC = parkingT1VC
                        }
                        
                        self.my_plan_tableview.reloadData()

                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    
    func getCongestionArrivalsEntryInfos(){
        
        if self.flightDetail?.terminalNo == "P03" {
            return
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getArrCongestionInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.congestionArrivalsEntryInfos + (self.flightDetail?.terminalNo ?? "P01")
        
        Session.default.request(
            apiUrl,
            method: .get,
//            parameters:
//            [
//                "terminalId": terminalId
//            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<[ArrCongestionInfo]>.self, from: dataJson)
                            
                            self.arrCongestionInfos = result?.data as! [ArrCongestionInfo]
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.tempArrCongestionInfos = self.arrCongestionInfos
                        
                        if self.flightDetail?.terminalNo! == "P03" {
                            
                        }else {
                            var iSumKorB5 = 0
                            var iSumForB5 = 0
                            var iSumKorB10 = 0
                            var iSumForB10 = 0
                            var iSumKorC5 = 0
                            var iSumForC5 = 0
                            var iSumKorC10 = 0
                            var iSumForC10 = 0
                            var iSumKorD5 = 0
                            var iSumForD5 = 0
                            var iSumKorD10 = 0
                            var iSumForD10 = 0
                            var iSumKorE5 = 0
                            var iSumForE5 = 0
                            var iSumKorE10 = 0
                            var iSumForE10 = 0
                            
                            for arrCongestionInfo in self.arrCongestionInfos {
                                if let estimatedDateTime = arrCongestionInfo.estimatedDateTime, estimatedDateTime != "" {
                                    let lPlusTime = self.getAreaEntTimePlus(gate: arrCongestionInfo.gate ?? "", lTime: estimatedDateTime)
                                    let diffMin = CommonUtils.minDiffByString(start: CommonUtils.getTodayDate(format: "yyyyMMddkkmm"), end: lPlusTime, inputFormat: "yyyyMMddkkmm")
                                    if diffMin >= 0 && diffMin <= 5 {
                                        if arrCongestionInfo.zone == "B" {
                                            iSumKorB5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForB5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "C" {
                                            iSumKorC5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForC5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "D" {
                                            iSumKorD5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForD5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "E" {
                                            iSumKorE5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForE5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        }
                                    }
                                    
                                    if diffMin >= 0 && diffMin <= 10 {
                                        if arrCongestionInfo.zone == "B" {
                                            iSumKorB10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForB10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "C" {
                                            iSumKorC10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForC10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "D" {
                                            iSumKorD10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForD10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "E" {
                                            iSumKorE10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForE10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        }
                                    }
                                }
                            }
                            
//                            for view in self.tableView.subviews {
//                                view.removeFromSuperview()
//                            }
                            let arrCongestionT1VC = ArrCongestionT1ViewController()
                            arrCongestionT1VC.viewWidth = self.view.frame.width - SizeUtils.sideMargin * 4
                            arrCongestionT1VC.iSumKorB5 = iSumKorB5
                            arrCongestionT1VC.iSumForB5 = iSumForB5
                            arrCongestionT1VC.iSumKorB10 = iSumKorB10
                            arrCongestionT1VC.iSumForB10 = iSumForB10
                            arrCongestionT1VC.iSumKorC5 = iSumKorC5
                            arrCongestionT1VC.iSumForC5 = iSumForC5
                            arrCongestionT1VC.iSumKorC10 = iSumKorC10
                            arrCongestionT1VC.iSumForC10 = iSumForC10
                            arrCongestionT1VC.iSumKorD5 = iSumKorD5
                            arrCongestionT1VC.iSumForD5 = iSumForD5
                            arrCongestionT1VC.iSumKorD10 = iSumKorD10
                            arrCongestionT1VC.iSumForD10 = iSumForD10
                            arrCongestionT1VC.iSumKorE5 = iSumKorE5
                            arrCongestionT1VC.iSumForE5 = iSumForE5
                            arrCongestionT1VC.iSumKorE10 = iSumKorE10
                            arrCongestionT1VC.iSumForE10 = iSumForE10
                            self.addChild(arrCongestionT1VC)
//                            arrCongestionT1VC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - (SizeUtils.sideMargin * 2), height: SizeUtils.tableSmallHeight * 5)
//                            self.tableView.addSubview(arrCongestionT1VC.view)
                            self.arrCongestionHostedVC = arrCongestionT1VC
                            
                        }

                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    func getAreaEntTimePlus(gate: String, lTime: String) -> String{
        var walkTime: Int = 0
        if gate != "" {
            for entryMoveTime in self.entryMoveTimes {
                if "\(entryMoveTime.gate ?? -1)" == gate {
                    walkTime = entryMoveTime.time ?? 0
                }
            }
        }
        if walkTime == 0 {
            if self.flightDetail?.terminalNo != "P03" {
                if gate != "" {
                    if Int(gate) ?? 0 < 100 {
                        walkTime = 981
                    }else{
                        walkTime = 1848
                    }
                }else {
                    walkTime = 1848
                }
            }else{
                walkTime = 955
            }
        }

        return CommonUtils.getDatePlusSec(start: CommonUtils.convertToDateFromStringDate(inputString: lTime, inputFormat: "yyyyMMddkkmm"), sec: walkTime, format: "yyyyMMddkkmm")
    }
    func getStandByPeople(total: Int, judge: Int) -> Int{
        var sum = total - judge
        if sum < 0 {
            sum = 0
        }
        return sum
    }
    
    func getEntryMoveTimeList(terminalId: String){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getEntryMoveTimeInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.congestionEntryMovementTims + terminalId
        
        Session.default.request(
            apiUrl,
            method: .get,
            //            parameters:
            //            [
            //                "terminalId": terminalId
            //            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
                    //                        print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[EntryMoveTime]>.self, from: dataJson)
                            
                            let tempEntryMoveTimes = result?.data as! [EntryMoveTime]
                            if terminalId == "P02" {
                                for tempEntryMoveTime in tempEntryMoveTimes {
                                    self.entryMoveTimes.append(tempEntryMoveTime)
                                }
                                
                            }else{
                                self.entryMoveTimes = tempEntryMoveTimes
                                
                                
                            }
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        if terminalId == "P02" || terminalId == "P03" {
                            self.getCongestionArrivalsEntryInfos()
                        }
                        
                    } else {
                        
                    }
                case .failure(let error):
                    print(error)
                    
                }
        }
    }
    func deleteBookmark(fimsFlightId: String){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "deleteBookmark")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.deleteBookmark + fimsFlightId
        
        Session.default.request(
            apiUrl,
            method: .delete,
//            parameters: [
//                "fimsId": ,
//                "flightType": flightType
//            ],
            encoding: JSONEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey, "deviceId": UserDefaultsUtils.getDeviceId()]
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
