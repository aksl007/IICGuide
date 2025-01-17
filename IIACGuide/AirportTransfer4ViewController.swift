//
//  AirportTransfer4ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransfer4ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransfer4ViewController.self))
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
    
    private let transfer05_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_tour_title_1: UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer05_img02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let transfer_tour_1_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_1_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_tour_1_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_1_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_1_sub_1_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_1_sub_1_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_1_sub_1_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_1_sub_1_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_tour_1_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_1_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_1_sub_2_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_1_sub_2_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_1_sub_2_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_1_sub_2_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_tour_title_2: UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_2_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_2_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer05_img03 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img03")
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_tour_2_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_2_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_2_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_2_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_tour_title_3: UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_3_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_3_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer05_img04 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img04")
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    private let transfer_tour_3_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_3_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_3_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_3_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let transfer_tour_title_4: UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_4_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_4_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer05_img05 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img05")
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    private let transfer_tour_4_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_4_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_tour_title_5: UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_title_5".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_5_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_5_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer05_img06 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img06")
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_tour_5_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_5_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_5_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_5_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_tour_title_6: UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_title_6".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_tour_6_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_tour_6_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer05_img07 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer05_img07")
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    private let transfer_tour_6_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "transfer_tour_6_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
}
extension AirportTransfer4ViewController {
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
        
        self.contentsView.addSubview(self.transfer05_img01)
        self.transfer05_img01.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            //            make.top.equalTo(self.transfer_process_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.7)
        }
        
        self.contentsView.addSubview(self.transfer_tour_title_1)
        self.transfer_tour_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer05_img01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer05_img02)
        self.transfer05_img02.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_1_desc_1)
        self.transfer_tour_1_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.transfer05_img02.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_1_sub_title_1)
        self.transfer_tour_1_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_1_sub_1_desc_1)
        self.transfer_tour_1_sub_1_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_1_sub_1_desc_2)
        self.transfer_tour_1_sub_1_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_sub_1_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_1_sub_title_2)
        self.transfer_tour_1_sub_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_sub_1_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_1_sub_2_desc_1)
        self.transfer_tour_1_sub_2_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_sub_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_1_sub_2_desc_2)
        self.transfer_tour_1_sub_2_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_sub_2_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_title_2)
        self.transfer_tour_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_1_sub_2_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer05_img03)
        self.transfer05_img03.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(self.view.frame.width / 3)
        }
        self.contentsView.addSubview(self.transfer_tour_2_desc_1)
        self.transfer_tour_2_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalTo(self.transfer05_img03.snp.leading).offset(-SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_2_sub_title_1)
        self.transfer_tour_2_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_2_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_2_sub_title_2)
        self.transfer_tour_2_sub_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_2_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        
        self.contentsView.addSubview(self.transfer_tour_title_3)
        self.transfer_tour_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_2_sub_title_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.transfer05_img04)
        self.transfer05_img04.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(self.view.frame.width / 4)
        }
        self.contentsView.addSubview(self.transfer_tour_3_desc_1)
        self.transfer_tour_3_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.transfer05_img04.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_3_sub_title_1)
        self.transfer_tour_3_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_3_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_3_sub_title_2)
        self.transfer_tour_3_sub_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_3_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.transfer_tour_title_4)
        self.transfer_tour_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_3_sub_title_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer05_img05)
        self.transfer05_img05.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(self.view.frame.width / 3)
        }
        self.contentsView.addSubview(self.transfer_tour_4_desc_1)
        self.transfer_tour_4_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalTo(self.transfer05_img05.snp.leading).offset(-SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_4_sub_title_1)
        self.transfer_tour_4_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_4_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_title_5)
        self.transfer_tour_title_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_4_sub_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.transfer05_img06)
        self.transfer05_img06.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(self.view.frame.width / 4)
        }
        self.contentsView.addSubview(self.transfer_tour_5_desc_1)
        self.transfer_tour_5_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.transfer05_img06.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_5_sub_title_1)
        self.transfer_tour_5_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_5_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_tour_5_sub_title_2)
        self.transfer_tour_5_sub_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_5_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_title_6)
        self.transfer_tour_title_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_5_sub_title_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer05_img07)
        self.transfer05_img07.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_6.snp.bottom).offset(SizeUtils.verticalMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(self.view.frame.width / 3)
        }
        self.contentsView.addSubview(self.transfer_tour_6_desc_1)
        self.transfer_tour_6_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_title_6.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalTo(self.transfer05_img07.snp.leading).offset(-SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_tour_6_sub_title_1)
        self.transfer_tour_6_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_tour_6_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
    }
}
