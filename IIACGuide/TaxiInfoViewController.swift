//
//  TaxiInfoViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/11.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class TaxiInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: TaxiInfoViewController.self))
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
    
    private let taxi_info_title_1: UILabel = {
        let label = UILabel()
        label.text = "taxi_info_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_1_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_1_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_1_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_1_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_1_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_1_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_1_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_1_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let taxi_info_title_2: UILabel = {
        let label = UILabel()
        label.text = "taxi_info_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_2_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_2_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_2_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_2_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_2_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_2_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_2_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_2_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let taxi_info_title_3: UILabel = {
        let label = UILabel()
        label.text = "taxi_info_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let taxi_info_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let taxi_info_link_1 : UILabel = {
        let label = UILabel()
        label.text = "taxi_info_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let taxi_info_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let taxi_info_link_2 : UILabel = {
        let label = UILabel()
        label.text = "taxi_info_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let taxi_info_link_2_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let taxi_info_title_4: UILabel = {
        let label = UILabel()
        label.text = "taxi_info_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_sub_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_sub_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_content_4_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_content_4_1".localized,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_content_4_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_content_4_2".localized,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let taxi_info_title_content_4_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "taxi_info_title_content_4_3".localized,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let taxi_info_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let taxi_info_link_3 : UILabel = {
        let label = UILabel()
        label.text = "taxi_info_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let taxi_info_link_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let taxi_info_link_4 : UILabel = {
        let label = UILabel()
        label.text = "taxi_info_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let taxi_info_link_4_end_line_view : UIView = {
          let view = UIView()
          view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
          view.sizeToFit()
          return view
      }()

}
extension TaxiInfoViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "taxi_link_1".localized)
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.taxi_info_title_1)
        self.taxi_info_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_sub_1_1)
        self.taxi_info_title_sub_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_1_2)
        self.taxi_info_title_sub_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_1_3)
        self.taxi_info_title_sub_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_1_4)
        self.taxi_info_title_sub_1_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_1_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_2)
        self.taxi_info_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_1_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_sub_2_1)
        self.taxi_info_title_sub_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_2_2)
        self.taxi_info_title_sub_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_2_3)
        self.taxi_info_title_sub_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_2_4)
        self.taxi_info_title_sub_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_2_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_3)
        self.taxi_info_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_2_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_sub_3_1)
        self.taxi_info_title_sub_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_sub_3_2)
        self.taxi_info_title_sub_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_link_1_line_view)
        self.taxi_info_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_3_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.taxi_info_link_1.tag = 0
        self.taxi_info_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.taxi_info_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.taxi_info_link_1)
        self.taxi_info_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.taxi_info_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.taxi_info_link_2_line_view)
        self.taxi_info_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.taxi_info_link_2.tag = 1
        self.taxi_info_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.taxi_info_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.taxi_info_link_2)
        self.taxi_info_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.taxi_info_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.taxi_info_link_2_end_line_view)
        self.taxi_info_link_2_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_4)
        self.taxi_info_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_2_end_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_title_sub_4)
        self.taxi_info_title_sub_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_content_4_1)
        self.taxi_info_title_content_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_sub_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_content_4_2)
        self.taxi_info_title_content_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_content_4_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.taxi_info_title_content_4_3)
        self.taxi_info_title_content_4_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_content_4_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.taxi_info_link_3_line_view)
        self.taxi_info_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_title_content_4_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.taxi_info_link_3.tag = 2
        self.taxi_info_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.taxi_info_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.taxi_info_link_3)
        self.taxi_info_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.taxi_info_link_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.taxi_info_link_4_line_view)
        self.taxi_info_link_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.taxi_info_link_4.tag = 3
        self.taxi_info_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.taxi_info_link_4.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.taxi_info_link_4)
        self.taxi_info_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.taxi_info_link_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.taxi_info_link_4_end_line_view)
        self.taxi_info_link_4_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_info_link_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension TaxiInfoViewController {
    @objc func moveDetail(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            
            let urlString = ServerUtils.URL_INTERNATIONAL_TAXI
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url, options: [:])
            }
        }else if sender.view?.tag == 1 {
            
            let urlString = ServerUtils.URL_KOREA_TAXI
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url, options: [:])
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("taxi_info_link_call_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("taxi_info_link_call_4".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
