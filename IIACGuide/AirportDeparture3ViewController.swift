//
//  AirportDeparture3ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDeparture3ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDeparture3ViewController.self))
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
     private let departure_military_section_title_1: UILabel = {
         let label = UILabel()
         label.text = "departure_military_section_title_1".localized.getSubTitle
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
         label.sizeToFit()
         return label
     }()
    private let departure_military_section_desc_1 : UILabel = {
         let label = UILabel()
         label.text = "departure_military_section_desc_1".localized
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
         label.numberOfLines = 0
         label.sizeToFit()
         return label
    }()
    private let departure_military_section_title_2: UILabel = {
         let label = UILabel()
         label.text = "departure_military_section_title_2".localized.getSubTitle
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
         label.sizeToFit()
         return label
     }()
    private let departure_military_section_desc_2 : UILabel = {
         let label = UILabel()
         label.text = "departure_military_section_desc_2".localized
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
         label.numberOfLines = 0
         label.sizeToFit()
         return label
    }()
    private let departure_military_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "departure_military_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_military_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_military_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_military_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_military_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_military_section_desc_3_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_military_section_desc_3_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_military_section_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_military_section_link_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_military_section_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_military_section_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
//    "departure_military_section_desc_3_1" = "출국당일「국외여행허가증명서」를 반드시 소지하시길 바랍니다.";
//    "departure_military_section_desc_3_2" = "「국외여행허가증명서」미소지 시 출입국재심실인계, 허가사항확인을 위한 유선통화 등으로 출국이 지연될 수 있습니다.";
//    "departure_military_section_desc_3_3" = "허가기간과 출국일이 맞지 않거나 미허가상태인 경우 병무신고사무소의 부재로 인해 당일 신규허가 및 기간조정이 불가 또는 지연될 수 있습니다.";
//    "departure_military_section_link_1" = "병무민원센터";
}
extension AirportDeparture3ViewController {
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
        
        self.contentsView.addSubview(self.departure_military_section_title_1)
        self.departure_military_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_military_section_desc_1)
        self.departure_military_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_military_section_title_2)
        self.departure_military_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_military_section_desc_2)
        self.departure_military_section_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_military_section_title_3)
        self.departure_military_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_military_section_desc_3_1)
        self.departure_military_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_military_section_desc_3_2)
        self.departure_military_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_desc_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_military_section_desc_3_3)
        self.departure_military_section_desc_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_desc_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.departure_military_section_link_1.isUserInteractionEnabled = true
        self.departure_military_section_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture3(_:))))
        
        self.contentsView.addSubview(self.departure_military_section_link_1_start_line_view)
        self.departure_military_section_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_desc_3_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_military_section_link_1)
        self.departure_military_section_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_military_section_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_military_section_link_1_line_view)
        self.departure_military_section_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_military_section_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension AirportDeparture3ViewController {
    @objc func tapDeparture3(_ sender: UITapGestureRecognizer){
        self.openShopping(paramType: "immigration")
    }
}
