//
//  AirportDisabledEmergencyViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledEmergencyViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledEmergencyViewController.self))
        self.initUi()
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let top_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let disabled_emergency_section_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_emergency_section_link_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_emergency_section_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_emergency_section_link_1_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_emergency_section_link_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_emergency_section_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_emergency_section_link_2_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_emergency_section_link_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_emergency_section_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_emergency_section_link_3_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_emergency_section_link_4 : UILabel = {
        let label = UILabel()
        label.text = "disabled_emergency_section_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_emergency_section_link_4_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
}
extension AirportDisabledEmergencyViewController{
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
        self.contentsView.addSubview(self.top_line_view)
        self.top_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.disabled_emergency_section_link_1_start_line_view)
        self.disabled_emergency_section_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_emergency_section_link_1.tag = 0
        self.disabled_emergency_section_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickEmergency(_:))))
        self.disabled_emergency_section_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_emergency_section_link_1)
        self.disabled_emergency_section_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_emergency_section_link_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_emergency_section_link_1_end_line_view)
        self.disabled_emergency_section_link_1_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_emergency_section_link_2.tag = 1
        self.disabled_emergency_section_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickEmergency(_:))))
        self.disabled_emergency_section_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_emergency_section_link_2)
        self.disabled_emergency_section_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_1_end_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_emergency_section_link_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_emergency_section_link_2_end_line_view)
        self.disabled_emergency_section_link_2_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_emergency_section_link_3.tag = 2
        self.disabled_emergency_section_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickEmergency(_:))))
        self.disabled_emergency_section_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_emergency_section_link_3)
        self.disabled_emergency_section_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_2_end_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_emergency_section_link_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_emergency_section_link_3_end_line_view)
        self.disabled_emergency_section_link_3_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_emergency_section_link_4.tag = 3
        self.disabled_emergency_section_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickEmergency(_:))))
        self.disabled_emergency_section_link_4.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_emergency_section_link_4)
        self.disabled_emergency_section_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_3_end_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_emergency_section_link_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_emergency_section_link_4_end_line_view)
        self.disabled_emergency_section_link_4_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_emergency_section_link_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension AirportDisabledEmergencyViewController{
    @objc func clickEmergency(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("disabled_emergency_section_link_call_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("disabled_emergency_section_link_call_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("disabled_emergency_section_link_call_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("disabled_emergency_section_link_call_4".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
