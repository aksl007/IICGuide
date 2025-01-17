//
//  BeaconBasePopupViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class BeaconBasePopupViewController: UIViewController {
    
    var zoneCd = "ZZZ"
    var terminalId = "P01"
    var fimsid = ""
    var flightPid = ""
    var checkin = ""
    var gate = ""
    var carousel = ""
    var schd = ""
    var schddttm = ""
    var estimate = ""
    var zzzFlightPid = ""
    
    var preFlightName = ""
    var preDepartureTime = ""
    var preEstimate = ""
    var preTitle = ""
    
    var completion: (() -> Swift.Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BeaconBasePopupViewController.self))
        self.initUi()
    }
    
    public let contentsView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let icon_beacon01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_beacon01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    
    //zdc start
    public let zdc_view : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    
    private var zdc_title_view : UILabel = {
        let label = UILabel()
        label.text = "beacon_welcome_t1".localized
        return label
    }()
    
    public let zdc_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let zdc_content_view : UILabel = {
        let label = UILabel()
        label.text = "beacon_welcome_zdc_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let ll_popup_beacon_checkin_info : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let tv_popup_beacon_checkin : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_counter".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let tv_popup_beacon_checkin_info_view : UIView = {
           let view = UIView()
           view.sizeToFit()
           return view
       }()
    private var tv_popup_beacon_checkin_info : UILabel = {
        let label = UILabel()
        label.text = "A01-C17"
        return label
    }()
    
    private let myplan_passenger_locate : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_passenger_locate")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    //zdc end
    
    //zzz start
    public let ll_popup_beacon_dep_zzz : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    private var tv_popup_beacon_zzz_title : UILabel = {
        let label = UILabel()
        label.text = "beacon_zzz_t1".localized
        return label
    }()
    private let poup_beacon_air_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poup_beacon_air_1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let beacon_zzz_flight : UILabel = {
        let label = UILabel()
        label.text = "beacon_zzz_flight".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_popup_beacon_flight_pid : UILabel = {
        let label = UILabel()
        label.text = "OZ202"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_popup_beacon_zzz_desc : UILabel = {
        let label = UILabel()
        label.text = "beacon_zzz_t1_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let zzz_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let beacon_zzz_bus_stop : UILabel = {
        let label = UILabel()
        label.text = "beacon_zzz_bus_stop".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let zzz_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let popup_beacon_bus_stop : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "popup_beacon_bus_stop")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_popup_beacon_bus_stop : UILabel = {
        let label = UILabel()
        label.text = "beacon_zzz_bus_stop_t1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    //zzz end
    
    //zzz start
    public let ll_popup_beacon_dep_zdd : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    private var tv_popup_beacon_zdd_title : UILabel = {
        let label = UILabel()
        label.text = "beacon_zdd_title".localized
        return label
    }()
    private let tv_popup_beacon_zdd_desc : UILabel = {
        let label = UILabel()
        label.text = "beacon_zdd_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let zdd_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    public let zdd_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tv_popup_beacon_time : UILabel = {
        let label = UILabel()
        label.text = "2020/10/07 14:30".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let beacon_zdd_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "beacon_zdd_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    //zzz end
    
    //zab start
    private let tv_popup_beacon_zab_desc : UILabel = {
        let label = UILabel()
        label.text = "beacon_zab_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let beacon_zab_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "beacon_zab_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let zab_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    //zab end
    
    //zat start
    public let ll_popup_beacon_dep_zat : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    private var tv_popup_beacon_zat_title : UILabel = {
        let label = UILabel()
        label.text = "beacon_zat_title".localized
        return label
    }()
    private let tv_popup_beacon_zat_desc : UILabel = {
        let label = UILabel()
        label.text = "beacon_zat_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let popup_beacon_zat_bg : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "popup_beacon_zat_bg")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    //zat end
    
    //push start
    public let ll_popup_beacon_dep_push : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    private var tv_popup_pre_information_title : UILabel = {
        let label = UILabel()
        label.text = "pre_information_push_title_1".localized
        return label
    }()
    private var tv_popup_pre_information_flight_name : UILabel = {
        let label = UILabel()
        label.text = "인천공항".localized
        return label
    }()
    private let icon_push_clock : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_push_clock")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_popup_pre_information_date : UILabel = {
        let label = UILabel()
        label.text = "2020/10/10"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_popup_pre_information_time : UILabel = {
        let label = UILabel()
        label.text = "10:10"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let push_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tv_popup_pre_information_terminal : UILabel = {
         let label = UILabel()
         label.text = "터미널"
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
         label.textAlignment = .center
         label.numberOfLines = 0
         label.sizeToFit()
         return label
     }()
    
    public let push_1_cicle_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
        view.layer.cornerRadius = SizeUtils.iconSizeVerySmall / 2
        view.sizeToFit()
        return view
    }()
    
    private let tv_popup_pre_information_congestion : UILabel = {
        let label = UILabel()
        label.text = "pre_information_push_prohibit".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.bold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let pre_information_push_prohibit_1 : UILabel = {
        let label = UILabel()
        label.text = "pre_information_push_prohibit_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.bold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_popup_pre_information_desc : UILabel = {
        let label = UILabel()
        label.text = "pre_information_push_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    //push end
    
    private let popupConfirmButton : UIButton = {
        let button = UIButton()
        button.setTitle("common_confirm".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText).cgColor
        
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let popupCloseButton : UIButton = {
        let button = UIButton()
        button.setTitle("common_close".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground).cgColor
        
        return button
    }()
}
extension BeaconBasePopupViewController {
    func initUi(){
        self.view.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.black, alphaValue: 0.5)
        //        self.view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(closeThisPage)))
        self.view.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.height.lessThanOrEqualTo(self.view.frame.height * 7 / 10)
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.popupMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.popupMargin)
        }
        
        self.view.addSubview(self.icon_beacon01)
        self.icon_beacon01.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentsView.snp.top)
            make.centerX.equalTo(self.contentsView)
            make.size.equalTo(SizeUtils.iconSizeBeacon)
        }
        
        if zoneCd == "ZDC" || zoneCd == "ZAB" {
            
            if self.terminalId != "P01" {
                self.zdc_title_view.text = "beacon_welcome_t2".localized
            }
            
            self.contentsView.addSubview(self.zdc_view)
            self.zdc_view.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            self.zdc_title_view = self.makeTitle(label: self.zdc_title_view)
            self.zdc_view.addSubview(self.zdc_title_view)
            self.zdc_title_view.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.iconSizeBeacon / 2 + SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
            }
            
            self.zdc_view.addSubview(self.zdc_end_line_view)
            self.zdc_end_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.zdc_title_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            
            if self.zoneCd == "ZDC" && self.fimsid == "" {
                self.ll_popup_beacon_checkin_info.isHidden = true
            }
            self.zdc_view.addSubview(self.ll_popup_beacon_checkin_info)
            self.ll_popup_beacon_checkin_info.snp.makeConstraints { (make) in
                make.top.equalTo(self.zdc_end_line_view.snp.bottom)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                if self.zoneCd == "ZDC" && self.fimsid  == "" {
                    make.height.equalTo(0)
                }
            }
            
            if self.zoneCd == "ZDC" && self.fimsid != "" {
                self.tv_popup_beacon_checkin_info.text = self.checkin
            }else{
                self.tv_popup_beacon_checkin_info.text = self.carousel
                self.tv_popup_beacon_checkin.text = "beacon_zab_carousel".localized
            }
            
            self.ll_popup_beacon_checkin_info.addSubview(self.tv_popup_beacon_checkin)
            self.tv_popup_beacon_checkin.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.ll_popup_beacon_checkin_info.addSubview(self.tv_popup_beacon_checkin_info_view)
            self.tv_popup_beacon_checkin_info_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_checkin.snp.bottom).offset(SizeUtils.contentsMargin)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            
            self.tv_popup_beacon_checkin_info = self.makeTitle(label: self.tv_popup_beacon_checkin_info)
            self.tv_popup_beacon_checkin_info.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
            self.tv_popup_beacon_checkin_info_view.addSubview(self.tv_popup_beacon_checkin_info)
            self.tv_popup_beacon_checkin_info.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            
            self.tv_popup_beacon_checkin_info_view.addSubview(self.myplan_passenger_locate)
            self.myplan_passenger_locate.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.tv_popup_beacon_checkin_info)
                make.leading.equalTo(self.tv_popup_beacon_checkin_info.snp.trailing)
                make.trailing.equalToSuperview()
                if zoneCd == "ZAB" {
                    make.size.equalTo(0)
                }else{
                    make.size.equalTo(SizeUtils.iconSizeSmall)
                }
                
            }
            
            if zoneCd == "ZAB" {
                
                self.zdc_view.addSubview(self.tv_popup_beacon_zab_desc)
                self.tv_popup_beacon_zab_desc.snp.makeConstraints { (make) in
                    make.top.equalTo(self.ll_popup_beacon_checkin_info.snp.bottom).offset(SizeUtils.verticalMargin)
                    make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                    
                }
                self.zdc_view.addSubview(self.zab_1_line_view)
                self.zab_1_line_view.snp.makeConstraints { (make) in
                    make.top.equalTo(self.tv_popup_beacon_zab_desc.snp.bottom).offset(SizeUtils.verticalMargin)
                    make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                    make.height.equalTo(1)
                }
                self.zdc_view.addSubview(self.beacon_zab_desc_2)
                self.beacon_zab_desc_2.snp.makeConstraints { (make) in
                    make.top.equalTo(self.zab_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
                    make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                 
                    make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
                }
            }else{
                
                if self.fimsid == "" {
                    self.zdc_content_view.attributedText = "<span style='font-size: \(SizeUtils.title)px; text-align: center;'>\(String(format: "beacon_welcome_zdc_desc".localized, "<span style='color:#4468AF;'>\("slide_main_menu_my_plan".localized)</span>" as! CVarArg))</span>".htmlToAttributedString
                    self.zdc_content_view.textAlignment = .center
                }else{
                    self.zdc_content_view.text = "beacon_checkin_zdc_desc".localized
                }
                
                self.zdc_view.addSubview(self.zdc_content_view)
                self.zdc_content_view.snp.makeConstraints { (make) in
                    make.top.equalTo(self.ll_popup_beacon_checkin_info.snp.bottom).offset(SizeUtils.verticalMargin)
                    make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                    
                    make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
                }
            }
            
            
        }else if zoneCd == "ZZZ" {
            
            if terminalId != "P01"{
                self.tv_popup_beacon_zzz_title.text = "beacon_zzz_t2".localized
                self.tv_popup_beacon_zzz_desc.attributedText = "<span style='font-size: \(SizeUtils.titleSmall)px;color:#383B3E;line-height:25px;'>\(String(format: "beacon_zzz_t2_desc".localized, "<span style='color:#4468AF;'>\("beacon_change_color_t2".localized)</span>" as! CVarArg))</span>".htmlToAttributedString
                
                self.tv_popup_beacon_bus_stop.text = "beacon_zzz_bus_stop_t2".localized
                
            }else {
                self.tv_popup_beacon_zzz_desc.attributedText = "<span style='font-size: \(SizeUtils.titleSmall)px;color:#383B3E;line-height:25px;'>\(String(format: "beacon_zzz_t1_desc".localized, "<span style='color:#4468AF;'>\("beacon_change_color_t1".localized)</span>" as! CVarArg))</span>".htmlToAttributedString
            }
            
            self.contentsView.addSubview(self.ll_popup_beacon_dep_zzz)
            self.ll_popup_beacon_dep_zzz.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            self.tv_popup_beacon_zzz_title = self.makeTitle(label: self.tv_popup_beacon_zzz_title)
            self.ll_popup_beacon_dep_zzz.addSubview(self.tv_popup_beacon_zzz_title)
            self.tv_popup_beacon_zzz_title.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.iconSizeBeacon / 2 + SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
            }
            
            self.ll_popup_beacon_dep_zzz.addSubview(self.beacon_zzz_flight)
            self.beacon_zzz_flight.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_zzz_title.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
            }
            self.ll_popup_beacon_dep_zzz.addSubview(self.poup_beacon_air_1)
            self.poup_beacon_air_1.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.beacon_zzz_flight)
                make.trailing.equalTo(self.beacon_zzz_flight.snp.leading).offset(-SizeUtils.contentsMargin)
                make.size.equalTo(SizeUtils.iconSize)
            }
            
            self.tv_popup_beacon_flight_pid.text = self.zzzFlightPid
            self.ll_popup_beacon_dep_zzz.addSubview(self.tv_popup_beacon_flight_pid)
            self.tv_popup_beacon_flight_pid.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.beacon_zzz_flight)
                make.leading.equalTo(self.beacon_zzz_flight.snp.trailing).offset(SizeUtils.contentsMargin)
            }
            
            
            self.tv_popup_beacon_zzz_desc.textAlignment = .center
            self.ll_popup_beacon_dep_zzz.addSubview(self.tv_popup_beacon_zzz_desc)
            self.tv_popup_beacon_zzz_desc.snp.makeConstraints { (make) in
                make.top.equalTo(self.beacon_zzz_flight.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.ll_popup_beacon_dep_zzz.addSubview(self.zzz_1_line_view)
            self.zzz_1_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_zzz_desc.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            self.ll_popup_beacon_dep_zzz.addSubview(self.beacon_zzz_bus_stop)
            self.beacon_zzz_bus_stop.snp.makeConstraints { (make) in
                make.top.equalTo(self.zzz_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)

            }
            self.ll_popup_beacon_dep_zzz.addSubview(self.popup_beacon_bus_stop)
            self.popup_beacon_bus_stop.snp.makeConstraints { (make) in
                make.top.equalTo(self.beacon_zzz_bus_stop.snp.bottom).offset(SizeUtils.contentsMargin)
                make.centerX.equalTo(self.beacon_zzz_bus_stop)
                make.size.equalTo(SizeUtils.iconSizeVeryBig)
                
            }
            
            self.ll_popup_beacon_dep_zzz.addSubview(self.zzz_2_line_view)
            self.zzz_2_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.popup_beacon_bus_stop.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
                
                make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            }
            self.ll_popup_beacon_dep_zzz.addSubview(self.tv_popup_beacon_bus_stop)
            self.tv_popup_beacon_bus_stop.snp.makeConstraints { (make) in
                make.top.equalTo(self.zzz_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalTo(self.popup_beacon_bus_stop.snp.trailing).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.bottom.equalTo(self.zzz_2_line_view.snp.top).offset(-SizeUtils.verticalMargin)
            }
            
        }else if zoneCd == "ZDD" {
            
            self.icon_beacon01.image = UIImage(named: "icon_beacon02")
            
            self.contentsView.addSubview(self.ll_popup_beacon_dep_zdd)
            self.ll_popup_beacon_dep_zdd.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            self.tv_popup_beacon_zdd_title.attributedText = "<span style='font-size: \(SizeUtils.beaconTitle)px; text-align: center;font-weight: bold;'>\(String(format: "beacon_zdd_title".localized, "<span style='color:#469197;'>\("beacon_zdd_change_color_text".localized)</span>" as! CVarArg))</span>".htmlToAttributedString
            self.tv_popup_beacon_zdd_title.textAlignment = .center
            self.ll_popup_beacon_dep_zdd.addSubview(self.tv_popup_beacon_zdd_title)
            self.tv_popup_beacon_zdd_title.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.iconSizeBeacon / 2 + SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.ll_popup_beacon_dep_zdd.addSubview(self.tv_popup_beacon_zdd_desc)
            self.tv_popup_beacon_zdd_desc.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_zdd_title.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.ll_popup_beacon_dep_zdd.addSubview(self.zdd_1_line_view)
            self.zdd_1_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_zdd_desc.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            
            self.ll_popup_beacon_dep_zdd.addSubview(self.tv_popup_beacon_checkin_info_view)
            self.tv_popup_beacon_checkin_info_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.zdd_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
            }
            
            
            self.tv_popup_beacon_checkin_info = self.makeTitle(label: self.tv_popup_beacon_checkin_info)
            self.tv_popup_beacon_checkin_info.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
            
            self.tv_popup_beacon_checkin_info.text = "\(gate) Gate"
            self.tv_popup_beacon_checkin_info_view.addSubview(self.tv_popup_beacon_checkin_info)
            self.tv_popup_beacon_checkin_info.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            self.tv_popup_beacon_checkin_info_view.addSubview(self.myplan_passenger_locate)
            self.myplan_passenger_locate.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.tv_popup_beacon_checkin_info)
                make.leading.equalTo(self.tv_popup_beacon_checkin_info.snp.trailing)
                make.trailing.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            
            if estimate != "" {
                self.tv_popup_beacon_time.text = CommonUtils.convertToStringFromStringDate(inputString: estimate.replacingOccurrences(of: "T", with: ""), inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy/MM/dd kk:mm")
            }else{
                self.tv_popup_beacon_time.text = CommonUtils.convertToStringFromStringDate(inputString: schddttm.replacingOccurrences(of: "T", with: ""), inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy/MM/dd kk:mm")
            }
            
            self.ll_popup_beacon_dep_zdd.addSubview(self.tv_popup_beacon_time)
            self.tv_popup_beacon_time.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_checkin_info_view.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)

            }
            
            self.ll_popup_beacon_dep_zdd.addSubview(self.zdd_2_line_view)
            self.zdd_2_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_time.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            
            self.ll_popup_beacon_dep_zdd.addSubview(self.beacon_zdd_desc_2)
            self.beacon_zdd_desc_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.zdd_2_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
                
                make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            }
            
            
            
        }else if zoneCd == "ZAT" {
            
            self.contentsView.addSubview(self.ll_popup_beacon_dep_zat)
            self.ll_popup_beacon_dep_zat.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            self.ll_popup_beacon_dep_zat.addSubview(self.popup_beacon_zat_bg)
            self.popup_beacon_zat_bg.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.iconSizeBeacon / 2 + SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
            }
            
            self.tv_popup_beacon_zat_title = self.makeTitle(label: self.tv_popup_beacon_zat_title)
            self.ll_popup_beacon_dep_zat.addSubview(self.tv_popup_beacon_zat_title)
            self.tv_popup_beacon_zat_title.snp.makeConstraints { (make) in
                make.top.equalTo(self.popup_beacon_zat_bg.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
            }
            self.ll_popup_beacon_dep_zat.addSubview(self.tv_popup_beacon_zat_desc)
            self.tv_popup_beacon_zat_desc.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_beacon_zat_title.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
                make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
                
            }
            
        }else if zoneCd == "PUSH" {
                
            self.contentsView.addSubview(self.ll_popup_beacon_dep_push)
            self.ll_popup_beacon_dep_push.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            self.tv_popup_pre_information_title = self.makeTitle(label: self.tv_popup_pre_information_title)
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_title)
            self.tv_popup_pre_information_title.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.iconSizeBeacon / 2 + SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.tv_popup_pre_information_flight_name = self.makeTitle(label: self.tv_popup_pre_information_flight_name)
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_flight_name)
            
            let terminal = preTitle.split(separator: ",")[0]
            self.tv_popup_pre_information_flight_name.text = "\(terminal) \(preFlightName)"
            self.tv_popup_pre_information_flight_name.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_pre_information_title.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.ll_popup_beacon_dep_push.addSubview(self.icon_push_clock)
            self.icon_push_clock.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_pre_information_flight_name.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            if preEstimate != "" {
                self.tv_popup_pre_information_date.text = CommonUtils.convertToStringFromStringDate(inputString: preEstimate, inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy-MM-dd")
            }else{
                self.tv_popup_pre_information_date.text = CommonUtils.convertToStringFromStringDate(inputString: preDepartureTime, inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy-MM-dd")
            }
            
            if preEstimate != "" {
                self.tv_popup_pre_information_time.text = CommonUtils.convertToStringFromStringDate(inputString: preEstimate, inputFormat: "yyyyMMddkkmm", outputFormat: "kk:mm")
            }else{
                self.tv_popup_pre_information_time.text = CommonUtils.convertToStringFromStringDate(inputString: preDepartureTime, inputFormat: "yyyyMMddkkmm", outputFormat: "kk:mm")
            }
            
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_date)
            self.tv_popup_pre_information_date.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.icon_push_clock)
                make.trailing.equalTo(self.icon_push_clock.snp.leading).offset(-SizeUtils.contentsMargin)
            }
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_time)
            self.tv_popup_pre_information_time.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.icon_push_clock)
                make.leading.equalTo(self.icon_push_clock.snp.trailing).offset(SizeUtils.contentsMargin)
            }
        
            self.ll_popup_beacon_dep_push.addSubview(self.push_1_line_view)
            self.push_1_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.icon_push_clock.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_terminal)
            self.tv_popup_pre_information_terminal.snp.makeConstraints { (make) in
                make.top.equalTo(self.push_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.ll_popup_beacon_dep_push.addSubview(self.push_1_cicle_view)
            self.push_1_cicle_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_pre_information_terminal.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_congestion)
            self.tv_popup_pre_information_congestion.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_pre_information_terminal.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalTo(self.push_1_cicle_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.ll_popup_beacon_dep_push.addSubview(self.pre_information_push_prohibit_1)
            self.pre_information_push_prohibit_1.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_popup_pre_information_congestion.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalTo(self.push_1_cicle_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.ll_popup_beacon_dep_push.addSubview(self.tv_popup_pre_information_desc)
            self.tv_popup_pre_information_desc.snp.makeConstraints { (make) in
                make.top.equalTo(self.pre_information_push_prohibit_1.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
                make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
            }
            
        }
        
        
        self.popupCloseButton.addTarget(self, action: #selector(closeThisPage), for: .touchUpInside)
        self.contentsView.addSubview(self.popupCloseButton)
        self.popupCloseButton.snp.makeConstraints { (make) in
            if zoneCd == "ZDC" || zoneCd == "ZAB" {
                make.top.equalTo(self.zdc_view.snp.bottom)
            }else if zoneCd == "ZZZ" {
                make.top.equalTo(self.ll_popup_beacon_dep_zzz.snp.bottom)
            }else if zoneCd == "ZDD" {
                make.top.equalTo(self.ll_popup_beacon_dep_zdd.snp.bottom)
            }else if zoneCd == "ZAT" {
                make.top.equalTo(self.ll_popup_beacon_dep_zat.snp.bottom)
            }else if zoneCd == "PUSH" {
                make.top.equalTo(self.ll_popup_beacon_dep_push.snp.bottom)
            }else{
                make.top.equalToSuperview()
            }

            make.leading.bottom.equalToSuperview()
            make.trailing.equalTo(self.contentsView.snp.centerX)
            make.height.equalTo(SizeUtils.buttonHeight)
            
            make.bottom.equalToSuperview()
        }
        
        if zoneCd == "ZDC" {
            self.popupConfirmButton.setTitle("beacon_button_myplan".localized, for: .normal)
            if self.fimsid == "" {
                self.popupConfirmButton.setTitle("flight_detail_register_schedule".localized, for: .normal)
            }
        }else if zoneCd == "ZZZ" {
            self.popupConfirmButton.setTitle("beacon_button_move_terminal".localized, for: .normal)
        }else if zoneCd == "ZDD" {
            self.popupConfirmButton.setTitle("beacon_button_myplan".localized, for: .normal)
        }else if zoneCd == "ZAB" {
            self.popupConfirmButton.setTitle("beacon_button_myplan".localized, for: .normal)
        }else if zoneCd == "ZAT" {
            self.popupConfirmButton.setTitle("beacon_button_traffic".localized, for: .normal)
        }else if zoneCd == "PUSH" {
            self.popupConfirmButton.setTitle("prohibited_item".localized, for: .normal)
        }
        self.popupConfirmButton.addTarget(self, action: #selector(closePopupWithCompletion), for: .touchUpInside)
        self.contentsView.addSubview(self.popupConfirmButton)
        self.popupConfirmButton.snp.makeConstraints { (make) in
            if zoneCd == "ZDC" || zoneCd == "ZAB" {
                make.top.equalTo(self.zdc_view.snp.bottom)
            }else if zoneCd == "ZZZ" {
                make.top.equalTo(self.ll_popup_beacon_dep_zzz.snp.bottom)
            }else if zoneCd == "ZDD" {
                make.top.equalTo(self.ll_popup_beacon_dep_zdd.snp.bottom)
            }else if zoneCd == "ZAT" {
                make.top.equalTo(self.ll_popup_beacon_dep_zat.snp.bottom)
            }else if zoneCd == "PUSH" {
                make.top.equalTo(self.ll_popup_beacon_dep_push.snp.bottom)
            }else{
                make.top.equalToSuperview()
            }
            make.trailing.bottom.equalToSuperview()
            make.leading.equalTo(self.contentsView.snp.centerX)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
    }
    
    func makeTitle(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.beaconTitle, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
}
extension BeaconBasePopupViewController {
    @objc func closePopupWithCompletion(){
        self.dismiss(animated: false, completion: self.completion)
    }
    @objc func closeThisPage(){
        self.dismiss(animated: false, completion: nil)
    }
}
