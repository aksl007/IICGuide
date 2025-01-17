//
//  AirportDisabledTransportViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledTransportViewController: BaseViewController {
    
    var terminalType = "T1"

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledTransportViewController.self))
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
    
    private let disabled_transport_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "disabled_transport_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transport01_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transport01_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let disabled_transport_section_desc_1_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "disabled_transport_section_desc_1_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_transport_section_desc_1_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "disabled_transport_section_desc_1_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_transport_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "disabled_transport_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let transport01_img02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transport01_img02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let disabled_transport_section_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_transport_section_link_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_transport_section_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_transport_section_link_1_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_transport_section_link_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_transport_section_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_transport_section_link_2_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let disabled_transport_section_link_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_transport_section_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let disabled_transport_section_link_3_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

}
extension AirportDisabledTransportViewController {
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
        
        self.contentsView.addSubview(self.disabled_transport_section_title_1)
        self.disabled_transport_section_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        
        self.transport01_img01.tag = 0
        self.transport01_img01.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickTransportImage(_:))))
        self.transport01_img01.isUserInteractionEnabled = true
        self.transport01_img02.tag = 1
        self.transport01_img02.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickTransportImage(_:))))
        self.transport01_img02.isUserInteractionEnabled = true
        
        if self.terminalType == "T2" {
            self.transport01_img01.image = UIImage(named: "transport01_img03")
        }
        self.contentsView.addSubview(self.transport01_img01)
        self.transport01_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.6)
        }
        
        self.contentsView.addSubview(self.disabled_transport_section_desc_1_1)
        self.disabled_transport_section_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transport01_img01.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_transport_section_desc_1_2)
        self.disabled_transport_section_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_desc_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.disabled_transport_section_title_2)
        self.disabled_transport_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_desc_1_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        if self.terminalType == "T2" {
            self.transport01_img02.image = UIImage(named: "transport01_img04")
        }
        self.contentsView.addSubview(self.transport01_img02)
        self.transport01_img02.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_title_2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.7)
        }
        
        self.contentsView.addSubview(self.disabled_transport_section_link_1_start_line_view)
        self.disabled_transport_section_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.transport01_img02.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_transport_section_link_1.tag = 0
        self.disabled_transport_section_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickTransport(_:))))
        self.disabled_transport_section_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_transport_section_link_1)
        self.disabled_transport_section_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_transport_section_link_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_transport_section_link_1_end_line_view)
        self.disabled_transport_section_link_1_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_transport_section_link_2.tag = 1
        self.disabled_transport_section_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickTransport(_:))))
        self.disabled_transport_section_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_transport_section_link_2)
        self.disabled_transport_section_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_link_1_end_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_transport_section_link_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_transport_section_link_2_end_line_view)
        self.disabled_transport_section_link_2_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.disabled_transport_section_link_3.tag = 2
        self.disabled_transport_section_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickTransport(_:))))
        self.disabled_transport_section_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.disabled_transport_section_link_3)
        self.disabled_transport_section_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_link_2_end_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.disabled_transport_section_link_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.disabled_transport_section_link_3_end_line_view)
        self.disabled_transport_section_link_3_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_transport_section_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension AirportDisabledTransportViewController {
    @objc func clickTransport(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("disabled_transport_section_link_call_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("disabled_transport_section_link_call_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("disabled_transport_section_link_call_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    @objc func clickTransportImage(_ sender: UITapGestureRecognizer){
        let imageZoomVC = ImageZoomViewController()
        imageZoomVC.paramTitle = "slide_airport_guide_sub_menu_4".localized
        imageZoomVC.image = (sender.view as! UIImageView).image
        self.navigationController?.pushViewController(imageZoomVC, animated: true)
    }
}
