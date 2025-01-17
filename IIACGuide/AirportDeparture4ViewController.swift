//
//  AirportDeparture4ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDeparture4ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDeparture4ViewController.self))
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
    
    private let departure04_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure04_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_quarantine_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_title_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_desc_2_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_2_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_2_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_2_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_2_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_2_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_desc_2_3_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_desc_2_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_2_3_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_desc_2_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_desc_2_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_2_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_desc_2_4_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_desc_2_4_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_2_4_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_desc_2_4_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_2_4_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_desc_2_4_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_2_4_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_desc_2_4_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_title_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_3_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_3_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_3_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_3_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_quarantine_section_link_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_quarantine_section_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure04_img02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure04_img02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_quarantine_section_title_4: UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_title_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_title_5: UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_title_5".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_desc_5_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_5_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_5_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_5_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_quarantine_section_title_6: UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_title_6".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_6_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_6_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_desc_6_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_quarantine_section_desc_6_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_quarantine_section_link_2_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_quarantine_section_link_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_quarantine_section_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_quarantine_section_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

}
extension AirportDeparture4ViewController {
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
        self.contentsView.addSubview(self.departure04_img01)
        self.departure04_img01.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeVeryBig)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_title_1)
        self.departure_quarantine_section_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure04_img01.snp.top)
            make.leading.equalTo(self.departure04_img01.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_title_2)
        self.departure_quarantine_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure04_img01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_1)
        self.departure_quarantine_section_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_title_2.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_2)
        self.departure_quarantine_section_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_1.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_3)
        self.departure_quarantine_section_desc_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_2.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_3_1)
        self.departure_quarantine_section_desc_2_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_3.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_3_2)
        self.departure_quarantine_section_desc_2_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_3_1.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_4)
        self.departure_quarantine_section_desc_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_3_2.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_4_1)
        self.departure_quarantine_section_desc_2_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_4.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_4_2)
        self.departure_quarantine_section_desc_2_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_4_1.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_4_3)
        self.departure_quarantine_section_desc_2_4_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_4_2.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_2_4_4)
        self.departure_quarantine_section_desc_2_4_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_4_3.snp.bottom).offset(SizeUtils.contents)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_title_3)
        self.departure_quarantine_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_2_4_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_3_1)
        self.departure_quarantine_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_title_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_3_2)
        self.departure_quarantine_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_3_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_3_3)
        self.departure_quarantine_section_desc_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_3_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_3_4)
        self.departure_quarantine_section_desc_3_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_3_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.departure_quarantine_section_link_1.isUserInteractionEnabled = true
        self.departure_quarantine_section_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture4(_:))))
        
        self.contentsView.addSubview(self.departure_quarantine_section_link_1_start_line_view)
        self.departure_quarantine_section_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_3_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_link_1)
        self.departure_quarantine_section_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_quarantine_section_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_quarantine_section_link_1_line_view)
        self.departure_quarantine_section_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure04_img02)
        self.departure04_img02.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_link_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeVeryBig)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_title_4)
        self.departure_quarantine_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure04_img02.snp.top)
            make.leading.equalTo(self.departure04_img02.snp.trailing).offset(SizeUtils.contentsMargin)
            
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_title_5)
        self.departure_quarantine_section_title_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure04_img02.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_5_1)
        self.departure_quarantine_section_desc_5_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_title_5.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_5_2)
        self.departure_quarantine_section_desc_5_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_5_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_title_6)
        self.departure_quarantine_section_title_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_5_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_6_1)
        self.departure_quarantine_section_desc_6_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_title_6.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_quarantine_section_desc_6_2)
        self.departure_quarantine_section_desc_6_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_6_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }

        self.departure_quarantine_section_link_2.isUserInteractionEnabled = true
        self.departure_quarantine_section_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture4(_:))))
        
        self.contentsView.addSubview(self.departure_quarantine_section_link_2_start_line_view)
        self.departure_quarantine_section_link_2_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_desc_6_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_quarantine_section_link_2)
        self.departure_quarantine_section_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_link_2_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_quarantine_section_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_quarantine_section_link_2_line_view)
        self.departure_quarantine_section_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_quarantine_section_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }

    }
}
extension AirportDeparture4ViewController {
    @objc func tapDeparture4(_ sender: UITapGestureRecognizer){
        self.openShopping(paramType: "immigration")
    }
}
