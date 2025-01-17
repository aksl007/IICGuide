//
//  ParkingInfoViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ParkingInfoViewController: BaseViewController {
    
    var terminalType = "T1" //T1, T2
    
    var parkingConDatas = [ParkingConData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingInfoViewController.self))
        initUi()
        self.getParkingCongestion()
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
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
    
    private let parkingFreeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "parking_map_t1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private let realTimeInfoParkingTitle : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_title".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let realTimeInfoParkingView : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 1
        view.sizeToFit()
        return view
    }()
    
    private let parkingReserveButton : UIButton = {
        let button = UIButton()
        button.setTitle("real_time_info_parking_link_2".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let real_time_info_parking_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "real_time_info_parking_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let real_time_info_parking_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "real_time_info_parking_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let real_time_info_parking_sub_title_3 : UILabel = {
        let label = UILabel()
        
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let parkingInfoDetailLineView1 : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let parkingInfoDetailLabel : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let parkingInfoDetailLineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
}
//UI
extension ParkingInfoViewController {
    func initUi(){
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getTopPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getBottomPadding())
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.refreshView)
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

        if self.terminalType == "T2" {
            self.parkingFreeImage.image = UIImage(named: "parking_map_t2")
        }
        self.contentsView.addSubview(self.parkingFreeImage)
        self.parkingFreeImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width)
            
        }
        
        self.contentsView.addSubview(self.realTimeInfoParkingTitle)
        self.realTimeInfoParkingTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.parkingFreeImage.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.realTimeInfoParkingView)
        self.realTimeInfoParkingView.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTitle.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if self.terminalType == "T2" {
                make.height.equalTo(SizeUtils.tableHeaderHeight + (SizeUtils.tableHeight * 5))
            }else {
                make.height.equalTo(SizeUtils.tableHeaderHeight + (SizeUtils.tableHeight * 8))
            }
        }
        
        if self.terminalType == "T2" {
            let parkingT2VC = ParkingT2ViewController()
            self.addChild(parkingT2VC)
            parkingT2VC.view.frame = CGRect(x: 0, y: 0, width: self.realTimeInfoParkingView.frame.width, height: self.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 5))
            self.realTimeInfoParkingView.addSubview(parkingT2VC.view)
        }else {
            let parkingT1VC = ParkingT1ViewController()
            self.addChild(parkingT1VC)
            parkingT1VC.view.frame = CGRect(x: 0, y: 0, width: self.realTimeInfoParkingView.frame.width, height: self.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 8))
            self.realTimeInfoParkingView.addSubview(parkingT1VC.view)
        }

        
        self.parkingReserveButton.addTarget(self, action: #selector(moveParkingReserve), for: .touchUpInside)
        
        if !CommonUtils.isKorean() {
            self.parkingReserveButton.isHidden = true
        }
        self.contentsView.addSubview(self.parkingReserveButton)
        self.parkingReserveButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingView.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            if CommonUtils.isKorean() {
                make.height.equalTo(SizeUtils.buttonHeight)
            }else{
                make.height.equalTo(0)
            }
            
            
        }
        
        self.contentsView.addSubview(self.real_time_info_parking_sub_title_1)
        self.real_time_info_parking_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.parkingReserveButton.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.real_time_info_parking_sub_title_2)
        self.real_time_info_parking_sub_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.real_time_info_parking_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        var mutString = NSAttributedString(
            string: "real_time_info_parking_sub_title_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        if self.terminalType == "T2" {
            mutString = NSAttributedString(
                string: "real_time_info_parking_t2_sub_title_3".localized.getDescription,
                attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
            )
        }
        self.real_time_info_parking_sub_title_3.attributedText = mutString
        self.contentsView.addSubview(self.real_time_info_parking_sub_title_3)
        self.real_time_info_parking_sub_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.real_time_info_parking_sub_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
        }
        
        self.contentsView.addSubview(self.parkingInfoDetailLineView1)
        self.parkingInfoDetailLineView1.snp.makeConstraints { (make) in
            make.top.equalTo(self.real_time_info_parking_sub_title_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.parkingInfoDetailLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveParkingFeeInfo)))
        self.parkingInfoDetailLabel.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.parkingInfoDetailLabel)
        self.parkingInfoDetailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.parkingInfoDetailLineView1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.parkingInfoDetailLabel.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.parkingInfoDetailLineView2)
        self.parkingInfoDetailLineView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.parkingInfoDetailLabel.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding - CommonUtils.getBottomPadding())
        }
    }
}
extension ParkingInfoViewController {
    @objc func refreshList(_ sender : UIButton){
        
        self.getParkingCongestion()
    }
    @objc func moveParkingReserve(_ sender : UIButton){
        sender.preventRepeatedPresses()
        
        self.openWebView(title: "home_drag_menu_4".localized, url: ServerUtils.URL_PARKING_RESERVE)
    }
    @objc func moveParkingFeeInfo(){
        
        let parkingFeeInfoVC = ParkingFeeViewController()
        self.navigationController?.pushViewController(parkingFeeInfoVC, animated: true)
    }
    
}
extension ParkingInfoViewController {
    func getParkingCongestion(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getParkingCongestionInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.parkingCongestion
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
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
                "terminalId": terminalId
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
                            let result = try? JSONDecoder().decode(BaseResult<[ParkingConData]>.self, from: dataJson)
                            
                            self.parkingConDatas = result?.data as! [ParkingConData]
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd HH:mm")
                        
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
                        
                        if self.terminalType == "T2" {
                            for view in self.realTimeInfoParkingView.subviews {
                                view.removeFromSuperview()
                            }
                            let parkingT2VC = ParkingT2ViewController()
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
                            parkingT2VC.view.frame = CGRect(x: 0, y: 0, width: self.realTimeInfoParkingView.frame.width, height: self.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 5))
                            self.realTimeInfoParkingView.addSubview(parkingT2VC.view)
                        }else {
                            for view in self.realTimeInfoParkingView.subviews {
                                view.removeFromSuperview()
                            }
                            let parkingT1VC = ParkingT1ViewController()
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
                            parkingT1VC.view.frame = CGRect(x: 0, y: 0, width: self.realTimeInfoParkingView.frame.width, height: self.realTimeInfoParkingView.frame.height + (SizeUtils.tableHeight * 8))
                            self.realTimeInfoParkingView.addSubview(parkingT1VC.view)
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
