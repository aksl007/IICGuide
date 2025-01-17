//
//  AirportArrive2ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportArrive2ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportArrive2ViewController.self))
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
    private let arrival_quarantine_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let arrival_quarantine_section_desc_1_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_quarantine_section_desc_1_1_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let arrival_quarantine_section_desc_1_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_quarantine_section_desc_1_2_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_quarantine_section_desc_1_2_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_2_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let arrival_quarantine_section_desc_1_3 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_quarantine_section_desc_1_3_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_quarantine_section_desc_1_3_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_desc_1_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let arrival_quarantine_section_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let arrival_quarantine_section_link_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_quarantine_section_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let arrival_quarantine_section_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

}
extension AirportArrive2ViewController{
    func initUi(){
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 2) - CommonUtils.getTopPadding())
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.arrival_quarantine_section_title_1)
        self.arrival_quarantine_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_1)
        self.arrival_quarantine_section_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_1_1)
        self.arrival_quarantine_section_desc_1_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_2)
        self.arrival_quarantine_section_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_1_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_2_1)
        self.arrival_quarantine_section_desc_1_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_2_2)
        self.arrival_quarantine_section_desc_1_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_3)
        self.arrival_quarantine_section_desc_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_2_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_3_1)
        self.arrival_quarantine_section_desc_1_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_quarantine_section_desc_1_3_2)
        self.arrival_quarantine_section_desc_1_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.arrival_quarantine_section_link_1.isUserInteractionEnabled = true
        self.arrival_quarantine_section_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapArrive2(_:))))
        
        self.contentsView.addSubview(self.arrival_quarantine_section_link_1_start_line_view)
        self.arrival_quarantine_section_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_desc_1_3_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.arrival_quarantine_section_link_1)
        self.arrival_quarantine_section_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.arrival_quarantine_section_link_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.arrival_quarantine_section_link_1_line_view)
        self.arrival_quarantine_section_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_quarantine_section_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
    }
}
extension AirportArrive2ViewController {
    @objc func tapArrive2(_ sender:UITapGestureRecognizer){
        if let url = URL(string: "tel://\("arrival_quarantine_section_link_call_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
