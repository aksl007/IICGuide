//
//  AirportDisabledElectricCartViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledElectricCartViewController: BaseViewController {
    
    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledElectricCartViewController.self))
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
    
    private let disabled_electric_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "disabled_electric_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transport02_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transport02_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let disabled_electric_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "disabled_electric_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_electric_section_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_electric_section_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_electric_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "disabled_electric_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_electric_section_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_electric_section_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
}
extension AirportDisabledElectricCartViewController {
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
        
        self.contentsView.addSubview(self.disabled_electric_section_title_1)
        self.disabled_electric_section_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        
        self.transport02_img01.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickElectricCartImage(_:))))
        self.transport02_img01.isUserInteractionEnabled = true
        
        self.contentsView.addSubview(self.transport02_img01)
        self.transport02_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_electric_section_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width)
        }
        
        self.contentsView.addSubview(self.disabled_electric_section_title_2)
        self.disabled_electric_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transport02_img01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_electric_section_desc_2)
        self.disabled_electric_section_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_electric_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_electric_section_title_3)
        self.disabled_electric_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_electric_section_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_electric_section_desc_3)
        self.disabled_electric_section_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_electric_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension AirportDisabledElectricCartViewController {
    @objc func clickElectricCartImage(_ sender: UITapGestureRecognizer){
        let imageZoomVC = ImageZoomViewController()
        imageZoomVC.paramTitle = "slide_airport_guide_sub_menu_4".localized
        imageZoomVC.image = (sender.view as! UIImageView).image
        self.navigationController?.pushViewController(imageZoomVC, animated: true)
    }
}
