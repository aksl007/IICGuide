//
//  AirportDisabledAmenitiesViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledAmenitiesViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledAmenitiesViewController.self))
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
    
    
    private let terminal_t1_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let disabled_amenities_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_title_4: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_title_5: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_5".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_5 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_title_6: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_6".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_6 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_amenities_section_title_7: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_7".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_7 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_7".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_amenities_section_title_8: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_8".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_8 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_8".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_amenities_section_title_9: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_9".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_9_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "disabled_amenities_section_desc_9_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_9_1_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_9_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_9_1_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_9_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_amenities_section_title_10: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_10".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_10 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_10".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_amenities_section_title_11: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_11".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_11 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_11".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let disabled_amenities_section_title_12: UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_title_12".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let disabled_amenities_section_desc_12 : UILabel = {
        let label = UILabel()
        label.text = "disabled_amenities_section_desc_12".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
 
}
extension AirportDisabledAmenitiesViewController{
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
        
        
        if self.terminalType == "T2" {
            self.terminal_t1_view.isHidden = true
        }
        self.contentsView.addSubview(self.terminal_t1_view)
        self.terminal_t1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.trailing.equalToSuperview()
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }
        }
        
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_title_1)
        self.disabled_amenities_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_desc_1)
        self.disabled_amenities_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_title_2)
        self.disabled_amenities_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_desc_2)
        self.disabled_amenities_section_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_title_3)
        self.disabled_amenities_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_desc_3)
        self.disabled_amenities_section_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_title_4)
        self.disabled_amenities_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_desc_4)
        self.disabled_amenities_section_desc_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_title_5)
        self.disabled_amenities_section_title_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_desc_5)
        self.disabled_amenities_section_desc_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_title_6)
        self.disabled_amenities_section_title_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_5.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.terminal_t1_view.addSubview(self.disabled_amenities_section_desc_6)
        self.disabled_amenities_section_desc_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_6.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.disabled_amenities_section_title_7)
        self.disabled_amenities_section_title_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.terminal_t1_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_7)
        self.disabled_amenities_section_desc_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_7.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_title_8)
        self.disabled_amenities_section_title_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_7.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_8)
        self.disabled_amenities_section_desc_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_8.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.disabled_amenities_section_title_9)
        self.disabled_amenities_section_title_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_8.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_9_1)
        self.disabled_amenities_section_desc_9_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_9.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        if self.terminalType == "T2" {
            self.disabled_amenities_section_desc_9_1_1.text = "disabled_amenities_t2_section_desc_9_1_1".localized
            self.disabled_amenities_section_desc_9_1_2.text = "disabled_amenities_t2_section_desc_9_1_2".localized
        }
        
        self.contentsView.addSubview(self.disabled_amenities_section_desc_9_1_1)
        self.disabled_amenities_section_desc_9_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_9_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_9_1_2)
        self.disabled_amenities_section_desc_9_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_9_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }

        if terminalType == "T2" {
            self.disabled_amenities_section_title_10.isHidden = true
            self.disabled_amenities_section_desc_10.isHidden = true
        }
        
        self.contentsView.addSubview(self.disabled_amenities_section_title_10)
        self.disabled_amenities_section_title_10.snp.makeConstraints { (make) in
            
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            if terminalType == "T2" {
                make.height.equalTo(0)
                make.top.equalTo(self.disabled_amenities_section_desc_9_1_2.snp.bottom)
            }else{
                make.top.equalTo(self.disabled_amenities_section_desc_9_1_2.snp.bottom).offset(SizeUtils.verticalMargin)
            }
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_10)
        self.disabled_amenities_section_desc_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_10.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if terminalType == "T2" {
                make.height.equalTo(0)
            }
        }
        self.contentsView.addSubview(self.disabled_amenities_section_title_11)
        self.disabled_amenities_section_title_11.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_10.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_11)
        self.disabled_amenities_section_desc_11.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_11.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_title_12)
        self.disabled_amenities_section_title_12.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_desc_11.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_amenities_section_desc_12)
        self.disabled_amenities_section_desc_12.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_amenities_section_title_12.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
