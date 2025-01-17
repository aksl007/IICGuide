//
//  RealTimeInfoViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RealTimeInfoViewController: BaseViewController {

    var terminalType = "T1" //T1, T2
    
    var depCongestionInfos = [DepCongestionInfo]()
    
    var viewWidth : CGFloat = 0.0
    
    var isMyPlan = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: RealTimeInfoViewController.self))
        if self.viewWidth == 0.0 {
            viewWidth = self.view.frame.width
            self.isMyPlan = false
        }else{
            self.isMyPlan = true
        }
        
        self.initUi()
        self.getCongestionDepartures()
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
    
    private let flights_list : UILabelPadding = {
        let label = UILabelPadding()
        label.text = "flights_list_t1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.sizeToFit()
        return label
    }()
    
    private let dep_congestion_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dep_congestion_t1_01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let tv_t1_dep_gate_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t1_dep_gate_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t1_dep_gate_3 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t1_dep_gate_4 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t1_dep_gate_5 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t1_dep_gate_6 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t1_dep_gate_1_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let tv_t1_dep_gate_2_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let tv_t1_dep_gate_3_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let tv_t1_dep_gate_4_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let tv_t1_dep_gate_5_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let tv_t1_dep_gate_6_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let tv_t2_dep_gate_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_t2_dep_gate_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon05_closed")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let tv_t2_dep_gate_1_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let tv_t2_dep_gate_2_label : UILabel = {
        let label = UILabel()
        label.text = "운영종료"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let tv_gate_total_count : UILabel = {
        let label = UILabel()
        label.text = "dep_congestion_total".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let categoryView : UIView = {
        let view = UIView()
        return view
    }()
    private let smoothView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueSmooth)
        return view
    }()
    private let ordinaryView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenOrdinary)
        return view
    }()
    private let crowdedView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
        return view
    }()
    private let veryCrowdedView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redVeryCrowded)
        return view
    }()
    private let closedView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayClosed)
        return view
    }()
    private let smoothLabel : UILabel = {
        let label = UILabel()
        label.text = "dep_congestion_smooth".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueSmooth)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let ordinaryLabel : UILabel = {
        let label = UILabel()
        label.text = "dep_congestion_ordinary".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenOrdinary)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let crowdedLabel : UILabel = {
        let label = UILabel()
        label.text = "dep_congestion_crowded".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let veryCrowdedLabel : UILabel = {
        let label = UILabel()
        label.text = "dep_congestion_very_crowded".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redVeryCrowded)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let closedLabel : UILabel = {
        let label = UILabel()
        label.text = "dep_congestion_close".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayClosed)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()

}
//Func
extension RealTimeInfoViewController {
    func initUi(){
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            if isMyPlan {
                make.bottom.equalToSuperview()
            }else{
                make.bottom.equalToSuperview().offset(-CommonUtils.getTopPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getBottomPadding())
            }
            
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        if isMyPlan {
            self.refreshView.isHidden = true
        }
        self.contentsView.addSubview(self.refreshView)
        self.refreshView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            if isMyPlan {
                make.height.equalTo(0)
            }else{
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            
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
            self.flights_list.text = "flights_list_t2".localized
        }
        self.contentsView.addSubview(self.flights_list)
        self.flights_list.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            
        }
        
        if self.terminalType == "T2" {
            self.dep_congestion_image.image = UIImage(named: "dep_congestion_t2_01")
        }
        self.contentsView.addSubview(self.dep_congestion_image)
        self.dep_congestion_image.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.viewWidth)
        }
        
        let imageWidth = self.viewWidth / 7
        let imageHeight = self.viewWidth / 10
        let imagePadding: CGFloat = 5.0
        
        self.dep_congestion_image.addSubview(self.tv_t1_dep_gate_1)
        self.tv_t1_dep_gate_1.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(imageWidth * 2 + imageWidth / 2 + imagePadding)
            make.centerY.equalToSuperview().offset(imageHeight - imageHeight / 2)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.dep_congestion_image.addSubview(self.tv_t1_dep_gate_2)
        self.tv_t1_dep_gate_2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(imageWidth + imageWidth / 2 + imagePadding)
            make.centerY.equalToSuperview()
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.dep_congestion_image.addSubview(self.tv_t1_dep_gate_3)
        self.tv_t1_dep_gate_3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(imageWidth / 2 + imagePadding)
            make.centerY.equalToSuperview().offset(-imageHeight / 2)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.dep_congestion_image.addSubview(self.tv_t1_dep_gate_4)
        self.tv_t1_dep_gate_4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-imageWidth / 2 - imagePadding)
            make.centerY.equalToSuperview().offset(-imageHeight / 2)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.dep_congestion_image.addSubview(self.tv_t1_dep_gate_5)
        self.tv_t1_dep_gate_5.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-(imageWidth + imageWidth / 2) - imagePadding)
            make.centerY.equalToSuperview()
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.dep_congestion_image.addSubview(self.tv_t1_dep_gate_6)
        self.tv_t1_dep_gate_6.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-(imageWidth * 2 + imageWidth / 2) - imagePadding)
            make.centerY.equalToSuperview().offset(imageHeight - imageHeight / 2)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        
        self.tv_t1_dep_gate_1.addSubview(self.tv_t1_dep_gate_1_label)
        self.tv_t1_dep_gate_1_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        self.tv_t1_dep_gate_2.addSubview(self.tv_t1_dep_gate_2_label)
        self.tv_t1_dep_gate_2_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        self.tv_t1_dep_gate_3.addSubview(self.tv_t1_dep_gate_3_label)
        self.tv_t1_dep_gate_3_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        self.tv_t1_dep_gate_4.addSubview(self.tv_t1_dep_gate_4_label)
        self.tv_t1_dep_gate_4_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        self.tv_t1_dep_gate_5.addSubview(self.tv_t1_dep_gate_5_label)
        self.tv_t1_dep_gate_5_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        self.tv_t1_dep_gate_6.addSubview(self.tv_t1_dep_gate_6_label)
        self.tv_t1_dep_gate_6_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        
        self.dep_congestion_image.addSubview(self.tv_t2_dep_gate_1)
        self.tv_t2_dep_gate_1.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(imageWidth / 2 + imagePadding)
            make.centerY.equalToSuperview().offset(imageHeight - imageHeight / 2)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.dep_congestion_image.addSubview(self.tv_t2_dep_gate_2)
        self.tv_t2_dep_gate_2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-imageWidth / 2 - imagePadding)
            make.centerY.equalToSuperview().offset(imageHeight - imageHeight / 2)
            make.width.equalTo(imageWidth)
            make.height.equalTo(imageHeight)
        }
        self.tv_t2_dep_gate_1.addSubview(self.tv_t2_dep_gate_1_label)
        self.tv_t2_dep_gate_1_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        self.tv_t2_dep_gate_2.addSubview(self.tv_t2_dep_gate_2_label)
        self.tv_t2_dep_gate_2_label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
        
        if self.terminalType == "T1" {
            self.tv_t2_dep_gate_1.isHidden = true
            self.tv_t2_dep_gate_2.isHidden = true
        }else{
            self.tv_t1_dep_gate_1.isHidden = true
            self.tv_t1_dep_gate_2.isHidden = true
            self.tv_t1_dep_gate_3.isHidden = true
            self.tv_t1_dep_gate_4.isHidden = true
            self.tv_t1_dep_gate_5.isHidden = true
            self.tv_t1_dep_gate_6.isHidden = true
        }
        
        self.contentsView.addSubview(self.tv_gate_total_count)
        self.tv_gate_total_count.snp.makeConstraints { (make) in
            make.top.equalTo(self.dep_congestion_image.snp.bottom).offset(-(self.viewWidth/6))
            make.centerX.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.categoryView)
        self.categoryView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_gate_total_count.snp_bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview().offset(25)
            make.width.equalTo(self.viewWidth * 2 / 3)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        self.categoryView.addSubview(self.smoothView)
        self.smoothView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(15)
        }
        self.categoryView.addSubview(self.smoothLabel)
        self.smoothLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.smoothView.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.categoryView.addSubview(self.crowdedView)
        self.crowdedView.snp.makeConstraints { (make) in
            make.top.equalTo(self.smoothView.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview()
            make.size.equalTo(15)
        }
        self.categoryView.addSubview(self.crowdedLabel)
        self.crowdedLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.crowdedView)
            make.leading.equalTo(self.crowdedView.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.categoryView.addSubview(self.closedView)
        self.closedView.snp.makeConstraints { (make) in
            make.top.equalTo(self.crowdedView.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview()
            make.size.equalTo(15)
        }
        self.categoryView.addSubview(self.closedLabel)
        self.closedLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.closedView)
            make.leading.equalTo(self.closedView.snp.trailing).offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview()
        }
        
        self.categoryView.addSubview(self.ordinaryView)
        self.ordinaryView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.categoryView.snp.centerX)
            make.size.equalTo(15)
        }
        self.categoryView.addSubview(self.ordinaryLabel)
        self.ordinaryLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.ordinaryView.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.categoryView.addSubview(self.veryCrowdedView)
        self.veryCrowdedView.snp.makeConstraints { (make) in
            make.top.equalTo(self.ordinaryView.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalTo(self.categoryView.snp.centerX)
            make.size.equalTo(15)
        }
        self.categoryView.addSubview(self.veryCrowdedLabel)
        self.veryCrowdedLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.veryCrowdedView)
            make.leading.equalTo(self.veryCrowdedView.snp.trailing).offset(SizeUtils.contentsMargin)
        }
    }
}
//Button
extension RealTimeInfoViewController {
    @objc func refreshList(_ sender : UIButton){
        
        self.getCongestionDepartures()
    }
}
//Api
extension RealTimeInfoViewController {
    func getCongestionDepartures(){
         Loading.show()
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getDepCongestionInfo")
        
         let apiUrl = ServerUtils.serverUrl + ServerUtils.congestionDepartures + terminalId
         
         Session.default.request(
             apiUrl,
             method: .get,
//             parameters:
//             [
//                 "terminalId": terminalId
//             ],
             encoding: URLEncoding.default,
             headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
         )
             .validate(statusCode: 200..<400)
             .responseJSON {response in
                 switch response.result{
                 case .success(let obj):
                     let json = JSON(obj)
//                     print(json)
                     let code = json["code"]
                     if code == 200 {
                         do {
                             let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                             let result = try? JSONDecoder().decode(BaseResult<[DepCongestionInfo]>.self, from: dataJson)

                             self.depCongestionInfos = result?.data as! [DepCongestionInfo]
                         } catch {
                             print(error.localizedDescription)
                         }
                        
                        self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd HH:mm")
                        
                        var total: Int = 0
                        
                        if self.terminalType == "T2" {
                            for depCongestionInfo in self.depCongestionInfos {
                                if depCongestionInfo.zone == "1" {
                                    self.setDepBgText(imageView: self.tv_t2_dep_gate_1, label: self.tv_t2_dep_gate_1_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }else if depCongestionInfo.zone == "2" {
                                    self.setDepBgText(imageView: self.tv_t2_dep_gate_2, label: self.tv_t2_dep_gate_2_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }
                            }
                        }else{
                            for depCongestionInfo in self.depCongestionInfos {
                                if depCongestionInfo.zone == "1" {
                                    self.setDepBgText(imageView: self.tv_t1_dep_gate_1, label: self.tv_t1_dep_gate_1_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }else if depCongestionInfo.zone == "2" {
                                    self.setDepBgText(imageView: self.tv_t1_dep_gate_2, label: self.tv_t1_dep_gate_2_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }else if depCongestionInfo.zone == "3" {
                                    self.setDepBgText(imageView: self.tv_t1_dep_gate_3, label: self.tv_t1_dep_gate_3_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }else if depCongestionInfo.zone == "4" {
                                    self.setDepBgText(imageView: self.tv_t1_dep_gate_4, label: self.tv_t1_dep_gate_4_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }else if depCongestionInfo.zone == "5" {
                                    self.setDepBgText(imageView: self.tv_t1_dep_gate_5, label: self.tv_t1_dep_gate_5_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }else if depCongestionInfo.zone == "6" {
                                    self.setDepBgText(imageView: self.tv_t1_dep_gate_6, label: self.tv_t1_dep_gate_6_label, level: depCongestionInfo.level, count: depCongestionInfo.passengerCount)
                                    total += depCongestionInfo.passengerCount ?? 0
                                }
                            }
                            
                        }
                        let attributeString =  NSMutableAttributedString(string: "\("dep_congestion_total".localized) \(total) \("dep_congestion_unit".localized)")

                        attributeString.addAttribute(NSAttributedString.Key.foregroundColor,
                                                     value: ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText),
                                                     range: NSMakeRange(attributeString.length - 3, 2))

                        self.tv_gate_total_count.attributedText = attributeString
                        
                     } else {
                         
                     }
                     Loading.hide()
                 case .failure(let error):
                     print(error)
                     
                     Loading.hide()
                 }
         }
     }
    
    func setDepBgText(imageView: UIImageView, label: UILabel, level: String?, count: Int?){
        var labelText: String = "\(count ?? 0)"
        
        labelText += "dep_congestion_unit".localized
        
        if level == "0" {
            imageView.image = UIImage(named: "icon01_smooth")
        }else if level == "1" {
            imageView.image = UIImage(named: "icon02_ordinary")
        }else if level == "2" {
            imageView.image = UIImage(named: "icon03_crowded")
        }else if level == "3" {
            imageView.image = UIImage(named: "icon04_very_crowded")
        }else{
            labelText = "dep_congestion_close".localized
        }
    
        label.text = labelText
    }
}
