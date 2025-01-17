//
//  MyPlanTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/18.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyPlanTabViewController: BaseViewController {

    var viewPager:WormTabStrip = WormTabStrip()
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    var flightDetails = [FlightDetail]()
    
    var datas = [FlightDeparture]()
    var dataArrs = [FlightDeparture]()
    
    var dataHash: [String:FlightDeparture] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MyPlanTabViewController.self))
        
        NotificationCenter.default.addObserver(self, selector: #selector(myPlanTabArr), name: NSNotification.Name("myPlanTabArr"),object: nil)
        
        self.initUi()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !UserDefaultsUtils.isMyPlanPassenger() {
            
            
            if !UserDefaultsUtils.getMyPlanListType() {
                self.icon_myplan_list.isSelected = false
                self.toggleList(self.icon_myplan_list)
            }else {
                self.setData()
            }
        }
    }

    private let refreshView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
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
    private let icon_myplan_list : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_myplan_list"), for: .normal)
        button.setImage(UIImage(named: "icon_myplan_card"), for: .selected)
        button.addTarget(self, action: #selector(toggleList(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    
    private let myplan_employee_tab_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    
    private let myplan_employee_departure : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "myplan_employee_departure"), for: .selected)
        button.setImage(UIImage(named: "myplan_employee_disable"), for: .normal)
        button.addTarget(self, action: #selector(toggleTabDep(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let myplan_employee_arrival : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "myplan_employee_arrival"), for: .selected)
        button.setImage(UIImage(named: "myplan_employee_disable"), for: .normal)
        button.addTarget(self, action: #selector(toggleTabArr(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let air4 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air4")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.black, alphaValue: 0.2).cgColor
        imageView.layer.cornerRadius = 25 / 2
        imageView.sizeToFit()
        return imageView
    }()
    private let air5 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air5")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.black, alphaValue: 0.2).cgColor
        imageView.layer.cornerRadius = 25 / 2
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flights_departure_info_title : UILabel = {
        let label = UILabel()
        label.text = "flights_departure_info_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let flights_arrival_info_title : UILabel = {
        let label = UILabel()
        label.text = "flights_arrival_info_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
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
        label.text = "myplan_employee_list_header_time".localized
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
    
    private let flightTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let delete_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let myplan_select_delete : UIButton = {
        let button = UIButton()
        button.setTitle("myplan_select_delete".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayButtonBackground).cgColor

        
        return button
    }()
    private let myplan_all_delete : UIButton = {
        let button = UIButton()
        button.setTitle("myplan_all_delete".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor

        return button
    }()
}
//UI
extension MyPlanTabViewController {
    
    func initUi(){
        setNavigationItems()
        
        if UserDefaultsUtils.isMyPlanPassenger() {
            //viewPager
            setUpTabs()
            let frame =  CGRect(x: 0, y: 1, width: self.view.frame.size.width, height: self.view.frame.size.height-(self.tabBarController?.tabBar.frame.height)! - ((self.navigationController?.navigationBar.frame.height)! + CommonUtils.getTopPadding()) - 1)
            viewPager = WormTabStrip(frame: frame)
            self.view.addSubview(viewPager)
            viewPager.delegate = self
            viewPager.eyStyle.wormStyel = .bubble
            viewPager.eyStyle.kHeightOfWorm = (self.navigationController?.navigationBar.frame.height)!
            viewPager.eyStyle.kHeightOfDivider = 0
            viewPager.eyStyle.kPaddingOfIndicator = 40
            viewPager.eyStyle.isWormEnable = false
            viewPager.eyStyle.spacingBetweenTabs = 0
            viewPager.eyStyle.tabItemSelectedColor = .white
            viewPager.eyStyle.topScrollViewBackgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
            viewPager.eyStyle.tabItemDefaultFont = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
            viewPager.eyStyle.tabItemSelectedFont = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
            viewPager.eyStyle.tabItemDefaultColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.white, alphaValue: 0.25)
            viewPager.eyStyle.WormColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
            
            viewPager.currentTabIndex = 0
            viewPager.buildUI()
            
            let divideView = UIView()
            divideView.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.white, alphaValue: 0.25)
            viewPager.addSubview(divideView)
            divideView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.navigationHeight * 15 / 50)
                make.centerX.equalToSuperview()
                make.width.equalTo(1)
                make.height.equalTo(20)
            }
        }else{
            
            self.view.addSubview(self.refreshView)
            self.refreshView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            self.refreshView.addSubview(self.refreshTimeLabel)
            self.refreshTimeLabel.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
            
            self.icon_myplan_list.isSelected = false
            self.refreshView.addSubview(self.icon_myplan_list)
            self.icon_myplan_list.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(SizeUtils.iconSizeSmall)
                make.width.equalTo(SizeUtils.iconSizeSmall * 160 / 55)
            }
            self.refreshView.addSubview(self.refreshButton)
            self.refreshButton.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalTo(self.icon_myplan_list.snp.leading).offset(-SizeUtils.contentsMargin)
                make.size.equalTo(SizeUtils.iconSize)
                
            }
            self.view.addSubview(self.myplan_employee_tab_view)
            self.myplan_employee_tab_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.refreshView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            
            self.myplan_employee_departure.isSelected = true
            self.myplan_employee_tab_view.addSubview(self.myplan_employee_departure)
            self.myplan_employee_departure.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.myplan_employee_arrival.isSelected = false
            self.myplan_employee_tab_view.addSubview(self.myplan_employee_arrival)
            self.myplan_employee_arrival.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin + 3)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.leading.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.myplan_employee_departure.addSubview(self.air4)
            self.air4.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(5)
                make.centerX.equalToSuperview().offset(-20)
                make.size.equalTo(25)
            }
            self.myplan_employee_departure.addSubview(self.flights_departure_info_title)
            self.flights_departure_info_title.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.air4)
                make.centerX.equalToSuperview().offset(20)
            }
            
            self.myplan_employee_arrival.addSubview(self.air5)
            self.air5.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(5)
                make.centerX.equalToSuperview().offset(-20)
                make.size.equalTo(25)
            }
            self.myplan_employee_arrival.addSubview(self.flights_arrival_info_title)
            self.flights_arrival_info_title.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.air5)
                make.centerX.equalToSuperview().offset(20)
            }
            
            self.view.addSubview(self.headerView)
            self.headerView.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_employee_tab_view.snp.bottom)
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
                make.centerY.equalToSuperview()
            }
            
            self.headerView.addSubview(self.headerCheckInLabel)
            self.headerCheckInLabel.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-view.frame.width * 7 / 100)
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
            
            self.view.addSubview(self.empty_view)
            self.empty_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.shadowView.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            }
            
            self.flight_search_title_view.isUserInteractionEnabled = true
            self.flight_search_title_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFlightSearch)))
            self.empty_view.addSubview(self.flight_search_title_view)
            self.flight_search_title_view.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
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
            
            self.flightTableView.delegate = self
            self.flightTableView.dataSource = self
            self.flightTableView.separatorStyle = .none

            self.flightTableView.register(FlightInfoTableViewCell.self, forCellReuseIdentifier: "FlightInfoTableViewCell")
            self.flightTableView.register(FlightCardTableViewCell.self, forCellReuseIdentifier: "FlightCardTableViewCell")
            
            self.view.addSubview(self.flightTableView)
            self.flightTableView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(self.shadowView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()

            }
            
            self.delete_view.isHidden = true
            self.tabBarController?.view.addSubview(self.delete_view)
            self.delete_view.snp.makeConstraints { (make) -> Void in
                make.height.equalTo(0)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            
            self.myplan_select_delete.addTarget(self, action: #selector(deleteSelected), for: .touchUpInside)
            self.myplan_select_delete.isUserInteractionEnabled = true
            self.delete_view.addSubview(self.myplan_select_delete)
            self.myplan_select_delete.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalTo(self.delete_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.myplan_all_delete.addTarget(self, action: #selector(deleteAll), for: .touchUpInside)
            self.myplan_all_delete.isUserInteractionEnabled = true
            self.delete_view.addSubview(self.myplan_all_delete)
            self.myplan_all_delete.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview()
                make.leading.equalTo(self.delete_view.snp.centerX)
                make.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
        }
        
    }
    
    func setData(){
        
        if self.icon_myplan_list.isSelected {
            //card
            self.flightDetails = Array(self.realm.objects(FlightDetail.self))
            
        }else{
            //list
            if self.myplan_employee_departure.isSelected {
                self.flightDetails = Array(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "flightType == 'dep'")))
            }else{
                self.flightDetails = Array(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "flightType == 'arr'")))
            }
        }
        
        
        if self.flightDetails.count == 0 {
            self.empty_view.isHidden = false
            self.flightTableView.isHidden = true
            
            self.empty_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.shadowView.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            }
            self.flightTableView.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(self.shadowView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.empty_view.isHidden = true
            self.flightTableView.isHidden = false
            
            self.empty_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.shadowView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
            self.flightTableView.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(self.shadowView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            var usid = ""
            
            var i = 0
            for flightDetail in self.flightDetails {
                if i == 0 {
                    usid += "\(flightDetail.usid ?? "")"
                }else{
                    usid += ",\(flightDetail.usid ?? "")"
                }
                
                i += 1
            }
            
            
            self.getFlightsDepartures(usid: usid)
        }
        
    }
    
    func setNavigationItems(){
        
        self.setNavigationItemTitle(title: "home_bottom_menu_3".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonSearchFlight()
        
        if !UserDefaultsUtils.isMyPlanPassenger() {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "myplan_passenger_del"), style:.plain, target: self, action: #selector(changeToDeleteMode))
        }
    }
    
}

//button
extension MyPlanTabViewController {
    
    @objc func myPlanTabArr(){
        
        
        if !UserDefaultsUtils.isMyPlanPassenger() {
            
            self.myplan_employee_arrival.isSelected = true
            self.myplan_employee_departure.isSelected = false
            self.myplan_employee_departure.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin + 3)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.myplan_employee_arrival.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.leading.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.headerCheckInLabel.text = "flights_list_header_carousel".localized
            self.headerGateLabel.text = "flights_list_header_exit".localized
            
            self.headerCheckInLabel.snp.remakeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-view.frame.width * 3.6 / 100)
                make.centerY.equalToSuperview().dividedBy(1.5)
            }
            
            self.headerDestLabel.text = "flights_list_header_origin".localized
            self.hideDeleteView()
            self.setData()
        }else {
            viewPager.selectTabAt(index: 1)
        }
    }
    
    @objc func toggleList(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        
        
        if sender.isSelected {
            
            self.headerView.isHidden = true
            self.headerView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.myplan_employee_tab_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
            
            self.myplan_employee_tab_view.isHidden = true
            self.myplan_employee_tab_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.refreshView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
            self.flightTableView.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        }else{
            self.headerView.isHidden = false
            self.headerView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.myplan_employee_tab_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            
            self.myplan_employee_tab_view.isHidden = false
            self.myplan_employee_tab_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.refreshView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            self.flightTableView.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        }
        
        UserDefaultsUtils.setMyPlanListType(!sender.isSelected)
        
        self.hideDeleteView()
        
        self.setData()
    }
    
    @objc func deleteSelected(){
        self.openTwoButtonPopup(title: "home_bottom_menu_3".localized, contents: "myplan_select_delete_popup_msg".localized, completion: {
            var usids = ""
            var i = 0
            for data in self.datas {
                if data.isCheckDelete {
                    if i == 0 {
                        usids += "'\(data.usid ?? "")'"
                        i += 1
                    }else{
                        usids += ",'\(data.usid ?? "")'"
                        i += 1
                    }
                }
            }
            
            if usids == "" {
                return
            }
            
            try! self.realm.write {
                self.realm.delete(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "usid in {\(usids)}")))
            }
            
            for data in self.datas {
                if data.isCheckDelete {
                    self.deleteBookmark(fimsFlightId: data.usid ?? "")
                }
            }
            
            self.hideDeleteView()
            
            self.setData()
            
        })
        
    }
    @objc func deleteAll(){
        
        self.openTwoButtonPopup(title: "home_bottom_menu_3".localized, contents: "myplan_all_delete_popup_msg".localized, completion: {
            if self.icon_myplan_list.isSelected {
                try! self.realm.write {
                    
                    let result = self.realm.objects(FlightDetail.self)
                    self.realm.delete(result)
                    
                    for temp in Array(result){
                        self.deleteBookmark(fimsFlightId: temp.usid ?? "")
                    }
                }
                
            }else{
                if self.myplan_employee_departure.isSelected {
                    try! self.realm.write {
                        
                        
                        let result = self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "flightType == 'dep'"))
                        self.realm.delete(result)
                        
                        for temp in Array(result){
                            self.deleteBookmark(fimsFlightId: temp.usid ?? "")
                        }
                    }
                }else{
                    try! self.realm.write {
                        
                        let result = self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "flightType == 'arr'"))
                        self.realm.delete(result)
                        
                        for temp in Array(result){
                            self.deleteBookmark(fimsFlightId: temp.usid ?? "")
                        }
                    }
                }
            }
            
            self.hideDeleteView()
            
            self.setData()
            
        })
        
    }
    
    @objc func changeToDeleteMode(){
        if self.delete_view.isHidden {
            self.delete_view.isHidden = false
            self.delete_view.snp.remakeConstraints { (make) -> Void in
                make.height.equalTo(SizeUtils.tabHeight + CommonUtils.getBottomPadding())
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            self.flightTableView.reloadData()
        }else{
            self.hideDeleteView()
            
            self.flightTableView.reloadData()
        }
        
    }
    
    func hideDeleteView(){
        self.delete_view.isHidden = true
        self.delete_view.snp.remakeConstraints { (make) -> Void in
            make.height.equalTo(0)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func tapFlightSearch(){
        
        if self.myplan_employee_departure.isSelected {
            self.openFlightInfoSearchWithParam(type: "dep", date: "")
        }else{
            self.openFlightInfoSearchWithParam(type: "arr", date: "")
        }
        
    }
    
    @objc func refreshList(_ sender:UIButton){
        self.setData()
    }
    
    @objc func toggleTabDep(_ sender:UIButton){
        
        if sender.isSelected {
            return
        }
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.myplan_employee_departure.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            self.myplan_employee_arrival.isSelected = false
            self.myplan_employee_arrival.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin + 3)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.leading.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.headerCheckInLabel.text = "flights_list_header_checkin".localized
            self.headerGateLabel.text = "flights_list_header_gate".localized
            
            self.headerCheckInLabel.snp.remakeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-view.frame.width * 7 / 100)
                make.centerY.equalToSuperview().dividedBy(1.5)
            }
            
            self.headerDestLabel.text = "flights_list_header_dest".localized
            
        }else{
            self.myplan_employee_departure.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin + 3)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            self.myplan_employee_arrival.isSelected = false
            self.myplan_employee_arrival.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.leading.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }

            
            self.headerCheckInLabel.text = "flights_list_header_carousel".localized
            self.headerGateLabel.text = "flights_list_header_exit".localized
            
            self.headerCheckInLabel.snp.remakeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-view.frame.width * 3.6 / 100)
                make.centerY.equalToSuperview().dividedBy(1.5)
            }
            
            self.headerDestLabel.text = "flights_list_header_origin".localized

        }
        self.hideDeleteView()
        self.setData()
        
    }
    @objc func toggleTabArr(_ sender:UIButton){
        
        if sender.isSelected {
            return
        }
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.myplan_employee_departure.isSelected = false
            self.myplan_employee_departure.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin + 3)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.myplan_employee_arrival.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.leading.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.headerCheckInLabel.text = "flights_list_header_carousel".localized
            self.headerGateLabel.text = "flights_list_header_exit".localized
            
            self.headerCheckInLabel.snp.remakeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-view.frame.width * 3.6 / 100)
                make.centerY.equalToSuperview().dividedBy(1.5)
            }
            
            self.headerDestLabel.text = "flights_list_header_origin".localized
        }else{
            self.myplan_employee_departure.isSelected = true
            self.myplan_employee_departure.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }
            
            self.myplan_employee_arrival.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin + 3)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.leading.equalTo(self.myplan_employee_tab_view.snp.centerX)
                make.bottom.equalToSuperview()
            }

            self.headerCheckInLabel.text = "flights_list_header_checkin".localized
            self.headerGateLabel.text = "flights_list_header_gate".localized
            
            self.headerCheckInLabel.snp.remakeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-view.frame.width * 7 / 100)
                make.centerY.equalToSuperview().dividedBy(1.5)
            }
            
            self.headerDestLabel.text = "flights_list_header_dest".localized
        }
        self.hideDeleteView()
        self.setData()
    }
}
extension MyPlanTabViewController : UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")

        if self.delete_view.isHidden {
            let flightInfoDetailVC = FlightInfoDetailViewController()
            if self.myplan_employee_departure.isSelected {
                flightInfoDetailVC.type = "dep"
            }else{
                flightInfoDetailVC.type = "arr"
            }
            flightInfoDetailVC.fimsFlightId = self.datas[indexPath.row].fimsFlightId ?? ""
            self.navigationController?.pushViewController(flightInfoDetailVC, animated: true)
        }else {
            self.datas[indexPath.row].isCheckDelete = !self.datas[indexPath.row].isCheckDelete
            
            self.flightTableView.reloadData()
            
            var count = 0
            for data in self.datas {
                if data.isCheckDelete {
                    count += 1
                }
            }
            
            if count == 0 {
                self.myplan_select_delete.isSelected = false
            }else{
                self.myplan_select_delete.isSelected = true
            }
        }
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.icon_myplan_list.isSelected {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCardTableViewCell")! as! FlightCardTableViewCell

            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cell.viewWidth = self.view.frame.width
            cell.type = self.datas[indexPath.row].flightType
            cell.isMyPlan = true
            cell.isDeleteMode = !self.delete_view.isHidden
            cell.flightDeparture = self.datas[indexPath.row]

            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FlightInfoTableViewCell")! as! FlightInfoTableViewCell

            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            if self.myplan_employee_departure.isSelected {
                cell.type = "dep"
            }else{
                cell.type = "arr"
            }
            cell.isMyPlan = true
            cell.isDeleteMode = !self.delete_view.isHidden
            cell.flightDeparture = self.datas[indexPath.row]

            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if self.icon_myplan_list.isSelected {
            return 150
        }else{
            return 50
        }
        
    }

}
extension MyPlanTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let myPlanSubTabDepVC = MyPlanSubTabViewController()
        myPlanSubTabDepVC.type = "dep"
        tabs.append(myPlanSubTabDepVC)
        tabTitles.append("flights_departure_info_title".localized)
        
        let myPlanSubTabArrVC = MyPlanSubTabViewController()
        myPlanSubTabArrVC.type = "arr"
        tabs.append(myPlanSubTabArrVC)
        tabTitles.append("flights_arrival_info_title".localized)
    }
    
    func wtsNumberOfTabs() -> Int {
        return numberOfTabs
    }
    
    func wtsViewOfTab(index: Int) -> UIView {
        return tabs[index].view
    }
    
    func wtsTitleForTab(index: Int) -> String {
        return tabTitles[index]
    }
    
    func wtsDidSelectTab(index: Int) {
        print("selected index:\(index)")
    }
    
    func wtsReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
    func wtsReachedRightEdge(panParam: UIPanGestureRecognizer) {
    
    }
    
}
extension MyPlanTabViewController {
    func getFlightsDepartures(usid: String){
        
        Loading.show()
        
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArr")
        
        var apiUrl = ServerUtils.serverUrl + ServerUtils.flightsDepartures
        if !self.myplan_employee_departure.isSelected {
            apiUrl = ServerUtils.serverUrl + ServerUtils.flightsArrivals
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArr")
        }else{
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightDep")
        }
        
        let param = [
            "fimsIds": usid
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
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[FlightDeparture]>.self, from: dataJson)
                            
                            self.datas = result?.data ?? [FlightDeparture]()
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.dataHash = [:]
                        if self.icon_myplan_list.isSelected {
                            
                            for temp in self.datas {
                                self.dataHash["\(temp.usid ?? "")"] = temp
                            }
                            
                            self.getFlightsArrivals(usid: usid)
                        }else{
                            var tempFlightDepartures = [FlightDeparture]()
                            
                            for flightDeparture in self.datas {
                                if flightDeparture.generalRemarkCode != "DEP" && flightDeparture.generalRemarkCode != "ARR" {
                                    tempFlightDepartures.append(flightDeparture)
                                }
                            }
                            for flightDeparture in self.datas {
                                if flightDeparture.generalRemarkCode == "DEP" || flightDeparture.generalRemarkCode == "ARR" {
                                    tempFlightDepartures.append(flightDeparture)
                                }
                            }
                            
                            self.datas = tempFlightDepartures
                            
                            self.flightTableView.reloadData()
                            
                            self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd HH:mm")
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
    
    func getFlightsArrivals(usid: String){
        
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArr")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.flightsArrivals
        
        let param = [
            "fimsIds": usid
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
                            
                            self.dataArrs = result?.data ?? [FlightDeparture]()
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        for temp in self.dataArrs {
                            self.dataHash["\(temp.usid ?? "")"] = temp
                        }
                        
                        self.datas.removeAll()
                        
                        
                        for flightDetail in self.flightDetails {
                            
                            do{
                                let tempDep = self.dataHash["\(flightDetail.usid ?? "")"]!
                                
                                tempDep.flightType = flightDetail.flightType ?? "dep"
                                self.datas.append(tempDep)
                            }catch {
                                print("not exist hash data")
                            }
                            
                        }
                        
                        
                        var tempFlightDepartures = [FlightDeparture]()
                        
                        for flightDeparture in self.datas {
                            if flightDeparture.generalRemarkCode != "DEP" && flightDeparture.generalRemarkCode != "ARR" {
                                tempFlightDepartures.append(flightDeparture)
                            }
                        }
                        for flightDeparture in self.datas {
                            if flightDeparture.generalRemarkCode == "DEP" || flightDeparture.generalRemarkCode == "ARR" {
                                tempFlightDepartures.append(flightDeparture)
                            }
                        }
                        
                        self.datas = tempFlightDepartures
                        
                        self.flightTableView.reloadData()
                        
                        self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd HH:mm")
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
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
