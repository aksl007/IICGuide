//
//  AirportDeparture2ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDeparture2ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDeparture2ViewController.self))
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
    private let departure_baggage_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_1_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_1_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_1_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_1_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_1_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_1_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_1_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_1_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_baggage_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure02_img01 : UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "departure02_img01")
          imageView.contentMode = .scaleAspectFit
          imageView.sizeToFit()
          return imageView
    }()
    private let departure02_img02 : UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "departure02_img02")
          imageView.contentMode = .scaleAspectFit
          imageView.sizeToFit()
          return imageView
    }()
        
    private let departure_baggage_section_desc_2_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_baggage_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_1_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_1_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure02_img03 : UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "departure02_img03")
          imageView.contentMode = .scaleAspectFit
          imageView.sizeToFit()
          return imageView
    }()
    
    private let departure_baggage_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_2_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_2_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_2_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_baggage_section_desc_3_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_3_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_3_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_3_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_3_3_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_3_3_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_baggage_section_desc_3_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_baggage_section_desc_3_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_baggage_section_title_4: UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_baggage_section_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_baggage_section_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

}
extension AirportDeparture2ViewController{
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
        
        self.contentsView.addSubview(self.departure_baggage_section_title_1)
        self.departure_baggage_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_1_1)
        self.departure_baggage_section_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_1_2)
        self.departure_baggage_section_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_1_3)
        self.departure_baggage_section_desc_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_1_4)
        self.departure_baggage_section_desc_1_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_1_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_title_2)
        self.departure_baggage_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_1_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure02_img01)
        self.departure02_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSize)
            make.centerX.equalToSuperview().dividedBy(2)
        }
        self.contentsView.addSubview(self.departure02_img02)
        self.departure02_img02.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSize)
            make.centerX.equalToSuperview().multipliedBy(1.5)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_desc_2_1)
        self.departure_baggage_section_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure02_img01.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_title_3)
        self.departure_baggage_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_2_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure02_img03)
        self.departure02_img03.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_1)
        self.departure_baggage_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure02_img03.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_1_1)
        self.departure_baggage_section_desc_3_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_1_2)
        self.departure_baggage_section_desc_3_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_2)
        self.departure_baggage_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_2_1)
        self.departure_baggage_section_desc_3_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_2_2)
        self.departure_baggage_section_desc_3_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_3)
        self.departure_baggage_section_desc_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_3_1)
        self.departure_baggage_section_desc_3_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_3_2)
        self.departure_baggage_section_desc_3_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_3_3)
        self.departure_baggage_section_desc_3_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_desc_3_4)
        self.departure_baggage_section_desc_3_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_3_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_title_4)
        self.departure_baggage_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_desc_3_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_baggage_section_desc_4)
        self.departure_baggage_section_desc_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_baggage_section_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
