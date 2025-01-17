//
//  SettingViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/25.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class SettingViewController: BaseViewController {
    
//    var locationManager : CLLocationManager!
//    let minors : [CLBeaconMinorValue] = [1420, 3531, 1822, 4709, 3346, 3991, 3010, 2570, 4938, 1870, 4709]

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: SettingViewController.self))
        
        self.initUi()
        
        self.setVersion()
        self.setLang()
        self.setWeatherDisplay()
        
        if UserDefaultsUtils.isMyPlanPassenger() {
            self.setPassenger()
        }else{
            self.setEmployee()
            UserDefaultsUtils.setBeacon(false)
        }
        
        self.tb_push.isOn = UserDefaultsUtils.isPush()
        self.tb_beacon.isOn = UserDefaultsUtils.isBeacon()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func setWeatherDisplay(){
        if UserDefaultsUtils.isWeatherDisplaySetting() {
            self.tv_select_weather.text = "setting_weather_fahrenheit_temp".localized
        }else{
            self.tv_select_weather.text = "setting_weather_celsius_temp".localized
        }
    }
    
    func setVersion(){
        self.tv_version_info.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    func setLang(){
        let locale = UserDefaultsUtils.getLocaleSetting()
        
        if locale == "ko" {
            self.tv_select_lang.text = "setting_lang_ko".localized
            iv_select_lang.image = UIImage(named: "icon_country01")
        }else if locale == "en" {
            self.tv_select_lang.text = "setting_lang_en".localized
            iv_select_lang.image = UIImage(named: "icon_country02")
        }else if locale == "zh" {
            self.tv_select_lang.text = "setting_lang_zh".localized
            iv_select_lang.image = UIImage(named: "icon_country03")
        }else if locale == "ja" {
            self.tv_select_lang.text = "setting_lang_ja".localized
            iv_select_lang.image = UIImage(named: "icon_country04")
        }else {
            self.tv_select_lang.text = "setting_lang_ko".localized
            iv_select_lang.image = UIImage(named: "icon_country01")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let setting_general_title_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    private let setting_general_title : UILabel = {
        let label = UILabel()
        label.text = "setting_general_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let setting_lang_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let setting_lang : UILabel = {
        let label = UILabel()
        label.text = "setting_lang".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let setting_lang_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let iv_select_lang : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_country01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_select_lang : UILabel = {
        let label = UILabel()
        label.text = "setting_lang_ko".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    
    private let setting_weather_display_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let setting_weather_display : UILabel = {
        let label = UILabel()
        label.text = "setting_weather_display".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let setting_weather_display_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tv_select_weather : UILabel = {
        let label = UILabel()
        label.text = "setting_weather_celsius_temp".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let setting_version_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let setting_version : UILabel = {
        let label = UILabel()
        label.text = "setting_version".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let setting_version_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tv_version_info : UILabel = {
        let label = UILabel()
        label.text = "1.0.0".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let setting_myplan_title_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    private let setting_myplan_title : UILabel = {
        let label = UILabel()
        label.text = "setting_myplan_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let setting_alter_type_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let setting_alter_type : UILabel = {
        let label = UILabel()
        label.text = "setting_alter_type".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let setting_alter_type_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let setting_alter_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "setting_alter_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let ll_setting_passenger : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let tv_setting_passenger : UILabel = {
        let label = UILabel()
        label.text = "setting_passenger".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let v_setting_passenger : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        view.sizeToFit()
        return view
    }()
    
    private let ll_setting_employee : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let tv_setting_employee : UILabel = {
        let label = UILabel()
        label.text = "setting_employee".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let v_setting_employee : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        view.sizeToFit()
        return view
    }()
    
    
    private let setting_flight_schedule_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let setting_flight_schedule : UILabel = {
        let label = UILabel()
        label.text = "setting_flight_schedule".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let setting_flight_schedule_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tb_push : UISwitch = {
        let view = UISwitch()
        view.onTintColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        view.sizeToFit()
        return view
    }()
    
    private let setting_beacon_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let setting_beacon : UILabel = {
        let label = UILabel()
        label.text = "setting_beacon".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let setting_beacon_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tb_beacon : UISwitch = {
        let view = UISwitch()
        view.onTintColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        view.sizeToFit()
        return view
    }()
    
//    "setting_general_title" = "일반설정";
//    "setting_myplan_title" = "내일정 설정";
//    "setting_alter_desc_1" = "※ 하루 1편의 항공편 등록만 가능합니다.";
//    "setting_alter_desc_2" = "※ 하루 다수의 항공편 등록이 가능합니다.";
}
extension SettingViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "slide_main_menu_setting".localized)
        
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.setting_general_title_view)
        self.setting_general_title_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()

        }
        
        self.setting_general_title_view.addSubview(self.setting_general_title)
        self.setting_general_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
            
        }
        
        
        self.setting_lang_view.isUserInteractionEnabled = true
        self.setting_weather_display_view.isUserInteractionEnabled = true
        
        self.setting_lang_view.tag = 0
        self.setting_weather_display_view.tag = 1
        
        self.setting_lang_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLangAndWeather(_:))))
        self.setting_weather_display_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLangAndWeather(_:))))
        
        
        self.contentsView.addSubview(self.setting_lang_view)
        self.setting_lang_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_general_title_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        self.setting_lang_view.addSubview(self.setting_lang)
        self.setting_lang.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.setting_lang_view.addSubview(self.setting_lang_line_view)
        self.setting_lang_line_view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.setting_lang_view.addSubview(self.tv_select_lang)
        self.tv_select_lang.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        self.setting_lang_view.addSubview(self.iv_select_lang)
        self.iv_select_lang.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.tv_select_lang.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.setting_weather_display_view)
        self.setting_weather_display_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_lang_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        self.setting_weather_display_view.addSubview(self.setting_weather_display)
        self.setting_weather_display.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.setting_weather_display_view.addSubview(self.setting_weather_display_line_view)
        self.setting_weather_display_line_view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.setting_weather_display_view.addSubview(self.tv_select_weather)
        self.tv_select_weather.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.setting_version_view)
        self.setting_version_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_weather_display_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        self.setting_version_view.addSubview(self.setting_version)
        self.setting_version.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.setting_version_view.addSubview(self.setting_version_line_view)
        self.setting_version_line_view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.setting_version_view.addSubview(self.tv_version_info)
        self.tv_version_info.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.setting_myplan_title_view)
        self.setting_myplan_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_version_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.setting_myplan_title_view.addSubview(self.setting_myplan_title)
        self.setting_myplan_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.setting_alter_type_view)
        self.setting_alter_type_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_myplan_title_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        self.setting_alter_type_view.addSubview(self.setting_alter_type)
        self.setting_alter_type.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.setting_alter_type_view.addSubview(self.setting_alter_type_line_view)
        self.setting_alter_type_line_view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.setting_alter_type_view.addSubview(self.setting_alter_desc_1)
        self.setting_alter_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_alter_type.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-3)
        }
        
        
        self.ll_setting_passenger.isUserInteractionEnabled = true
        self.ll_setting_employee.isUserInteractionEnabled = true
        
        self.ll_setting_passenger.tag = 0
        self.ll_setting_employee.tag = 1
        
        self.ll_setting_passenger.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAppType(_:))))
        self.ll_setting_employee.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAppType(_:))))
        
        
        self.setting_alter_type_view.addSubview(self.ll_setting_employee)
        self.ll_setting_employee.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(self.setting_alter_type)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
        }
        
        self.ll_setting_employee.addSubview(self.tv_setting_employee)
        self.tv_setting_employee.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        self.ll_setting_employee.addSubview(self.v_setting_employee)
        self.v_setting_employee.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_setting_employee.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.setting_alter_type_view.addSubview(self.ll_setting_passenger)
        self.ll_setting_passenger.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.ll_setting_employee.snp.leading)
            make.centerY.equalTo(self.setting_alter_type)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
        }
        
        self.ll_setting_passenger.addSubview(self.tv_setting_passenger)
        self.tv_setting_passenger.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        self.ll_setting_passenger.addSubview(self.v_setting_passenger)
        self.v_setting_passenger.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_setting_passenger.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        
        self.contentsView.addSubview(self.setting_flight_schedule_view)
        self.setting_flight_schedule_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_alter_type_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        self.setting_flight_schedule_view.addSubview(self.setting_flight_schedule)
        self.setting_flight_schedule.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.setting_flight_schedule_view.addSubview(self.setting_flight_schedule_line_view)
        self.setting_flight_schedule_line_view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.tb_push.addTarget(self, action: #selector(switchPush(_:)), for: .valueChanged)
        self.setting_flight_schedule_view.addSubview(self.tb_push)
        self.tb_push.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.setting_beacon_view)
        self.setting_beacon_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.setting_flight_schedule_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
                        
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        self.setting_beacon_view.addSubview(self.setting_beacon)
        self.setting_beacon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.setting_beacon_view.addSubview(self.setting_beacon_line_view)
        self.setting_beacon_line_view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.tb_beacon.addTarget(self, action: #selector(switchBeacon(_:)), for: .valueChanged)
        self.setting_beacon_view.addSubview(self.tb_beacon)
        self.tb_beacon.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
    }
}
extension SettingViewController {
    @objc func tapLangAndWeather(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //언어 설정
            
            let popupVC = PopupListViewController()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.modalTransitionStyle = .crossDissolve
            
            popupVC.delegate = self
            popupVC.arrayString = ["setting_lang_ko".localized, "setting_lang_en".localized, "setting_lang_zh".localized, "setting_lang_ja".localized]
            popupVC.popupTitle = "setting_lang".localized
            var arrayImages = [UIImage]()
            arrayImages.append(UIImage(named: "icon_country01")!)
            arrayImages.append(UIImage(named: "icon_country02")!)
            arrayImages.append(UIImage(named: "icon_country03")!)
            arrayImages.append(UIImage(named: "icon_country04")!)
            popupVC.arrayImage = arrayImages
            popupVC.tag = 0
            self.present(popupVC, animated: false, completion: nil)
            

        }else if sender.view?.tag == 1 {
            //기온 표시 방법
            
            let popupVC = PopupListViewController()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.modalTransitionStyle = .crossDissolve
            
            popupVC.delegate = self
            popupVC.arrayString = ["setting_weather_celsius_temp".localized, "setting_weather_fahrenheit_temp".localized]
            popupVC.popupTitle = "setting_weather_display".localized
            popupVC.tag = 1
            self.present(popupVC, animated: false, completion: nil)
        }
    }
    @objc func tapAppType(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //고객용
            self.setPassenger()
            UserDefaultsUtils.setMyPlanPassenger(true)
            self.deleteMyPlanDB()
            self.setPassenger(yn: "Y")
            self.replaceRoot()
            
        }else if sender.view?.tag == 1 {
            //직원용
            self.setEmployee()
            UserDefaultsUtils.setMyPlanPassenger(false)
            self.deleteMyPlanDB()
            self.setPassenger(yn: "N")
            self.replaceRoot()
        }
    }
    
    func deleteMyPlanDB(){
        try! self.realm.write {
            let result = self.realm.objects(FlightDetail.self)
            self.realm.delete(result)
            
            for temp in Array(result) {
                self.deleteBookmark(fimsFlightId: temp.usid ?? "")
            }
            
        }
    }
    
    func setPassenger(){
        self.tv_setting_passenger.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        self.tv_setting_passenger.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        self.tv_setting_employee.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        self.tv_setting_employee.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        self.v_setting_passenger.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        self.v_setting_employee.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        
        self.setting_alter_desc_1.text = "setting_alter_desc_1".localized
        
        self.setting_beacon_view.isHidden = false
        
        
    }
    
    func setEmployee(){
        self.tv_setting_employee.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        self.tv_setting_employee.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        self.tv_setting_passenger.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        self.tv_setting_passenger.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        self.v_setting_passenger.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        self.v_setting_employee.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        
        self.setting_alter_desc_1.text = "setting_alter_desc_2".localized
        
        self.setting_beacon_view.isHidden = true
    }
    
    @objc func switchPush(_ sender:UISwitch){
        
        if sender.isOn {
            UserDefaultsUtils.setPush(sender.isOn)
        }else{
            UserDefaultsUtils.setPush(sender.isOn)
            UserDefaultsUtils.setBeacon(sender.isOn)
            self.tb_beacon.isOn = sender.isOn
        }
        
        self.getBookmarksDevice()
    }
    
    @objc func switchBeacon(_ sender:UISwitch){
        UserDefaultsUtils.setBeacon(sender.isOn)
        
        if sender.isOn {

            let userInfo: [AnyHashable: Any] = ["isBeacon": true]
             
            NotificationCenter.default.post(name: NSNotification.Name("beaconNotification"), object: nil, userInfo: userInfo)
//            locationManager = CLLocationManager.init()              // locationManager 초기화.
//
//            locationManager.delegate = self                         // 델리게이트 넣어줌.
//            locationManager.requestAlwaysAuthorization()            // 위치 권한 받아옴.
//            locationManager.startUpdatingLocation()                 // 위치 업데이트 시작
//            locationManager.allowsBackgroundLocationUpdates = true  // 백그라운드에서도 위치를 체크할 것인지에 대한 여부. 필요없으면 false로 처리하자.
//            locationManager.pausesLocationUpdatesAutomatically = false  // 이걸 써줘야 백그라운드에서 멈추지 않고 돈다
            
//            self.startScanning()
        }else{
            let userInfo: [AnyHashable: Any] = ["isBeacon": false]
             
            NotificationCenter.default.post(name: NSNotification.Name("beaconNotification"), object: nil, userInfo: userInfo)
//            self.stopScanning()
//            locationManager.stopUpdatingLocation()
            
        }
    }

}
extension SettingViewController : PoupListDelegate {
    func setResult(tag: Int, row: Int) {
        if tag == 0 {
            if row == 0 {
                UserDefaultsUtils.setLocaleSetting("ko")
            }else if row == 1 {
                UserDefaultsUtils.setLocaleSetting("en")
            }else if row == 2 {
                UserDefaultsUtils.setLocaleSetting("zh")
            }else if row == 3 {
                UserDefaultsUtils.setLocaleSetting("ja")
            }
            
            self.getBookmarksDevice()
            
            self.setLang()
            
            self.replaceRoot()
        }else if tag == 1 {
            if row == 0 {
                UserDefaultsUtils.setWeatherDisplaySetting(false)
            }else {
                UserDefaultsUtils.setWeatherDisplaySetting(true)
            }
            self.setWeatherDisplay()
        }
    }
    func replaceRoot(){
        
        UIApplication.shared.keyWindow?.rootViewController = TabBarController()
    }
    
}
extension SettingViewController {
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
    
    func setPassenger(yn: String){
        
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "setPassenger")
        
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.setPassenger
        
        Session.default.request(
            apiUrl,
            method: .post,
            parameters: [
                "yn": yn
            ],
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
