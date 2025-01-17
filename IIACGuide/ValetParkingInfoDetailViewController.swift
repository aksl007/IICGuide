//
//  ValetParkingInfoDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ValetParkingInfoDetailViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ValetParkingInfoDetailViewController.self))
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
    
    private let valet_parking_info_title_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let valet_parking_info_content_1_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_content_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_content_1_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_content_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_content_1_2_line_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let valet_parking_info_content_1_1_arrow_image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "box_arrow_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let valet_parking_info_content_2_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_content_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_content_2_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_content_2_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_content_2_2_line_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let valet_parking_info_content_2_1_arrow_image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "box_arrow_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let valet_parking_info_content_3_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_content_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_content_3_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_content_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_content_3_2_line_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let valet_parking_info_sub_title_1_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "valet_parking_info_sub_title_1_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_desc_1_1 : UILabel = {
        let label = UILabel()

        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let valet_parking_info_sub_title_1_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "valet_parking_info_sub_title_1_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_desc_1_2_1 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_desc_1_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_desc_1_2_2 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_desc_1_2_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let valet_parking_info_title_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_sub_title_2_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "valet_parking_info_sub_title_2_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let valet_parking_info_table_view: UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 1.0
        view.sizeToFit()
        return view
    }()
    private var valet_parking_info_table_header_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_table_header_1".localized
        return label
    }()
    private var valet_parking_info_table_header_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_table_header_2".localized
        return label
    }()
    private var valet_parking_info_table_col_1_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_table_col_1_1".localized
        return label
    }()
    private var valet_parking_info_table_col_1_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_table_col_1_2".localized
        return label
    }()
    private var valet_parking_info_table_col_2_1: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_table_col_2_1".localized
        return label
    }()
    private var valet_parking_info_table_col_2_2: UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_table_col_2_2".localized
        return label
    }()
    
    private let valet_parking_info_desc_2_1 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_info_desc_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let valet_parking_info_sub_title_2_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "valet_parking_info_sub_title_2_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_sub_title_2_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "valet_parking_info_sub_title_2_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let valet_parking_info_sub_title_2_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "valet_parking_info_sub_title_2_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()


}
extension ValetParkingInfoDetailViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "valet_parking_link_1".localized)
        
        if self.terminalType == "T2" {
            self.valet_parking_info_content_1_1.text = "valet_parking_info_t2_content_1_1".localized
            self.valet_parking_info_content_2_1.text = "valet_parking_info_t2_content_1_2".localized
            self.valet_parking_info_content_2_1.text = "valet_parking_info_t2_content_2_1".localized
            self.valet_parking_info_content_2_2.text = "valet_parking_info_t2_content_2_2".localized
            self.valet_parking_info_content_3_1.text = "valet_parking_info_t2_content_3_1".localized
            self.valet_parking_info_content_3_2.text = "valet_parking_info_t2_content_3_2".localized
        }
        
        self.valet_parking_info_desc_1_1.setHTMLFromString(htmlText: "valet_parking_info_desc_1_1".localized)
        if self.terminalType == "T2" {
            self.valet_parking_info_desc_1_1.setHTMLFromString(htmlText: "valet_parking_info_t2_desc_1_1".localized)
            self.valet_parking_info_desc_1_2_2.text = "valet_parking_info_t2_desc_1_2_2".localized
        }
        
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
        
        self.contentsView.addSubview(self.valet_parking_info_title_1)
        self.valet_parking_info_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_content_1_1)
        self.valet_parking_info_content_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_1_2)
        self.valet_parking_info_content_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_1_2_line_view)
        self.valet_parking_info_content_1_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_1_1_arrow_image)
        self.valet_parking_info_content_1_1_arrow_image.snp.makeConstraints { (make) in
            make.top.equalTo(valet_parking_info_content_1_2_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerX.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.valet_parking_info_content_2_1)
        self.valet_parking_info_content_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_1_1_arrow_image.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_2_2)
        self.valet_parking_info_content_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_2_2_line_view)
        self.valet_parking_info_content_2_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_2_1_arrow_image)
        self.valet_parking_info_content_2_1_arrow_image.snp.makeConstraints { (make) in
            make.top.equalTo(valet_parking_info_content_2_2_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerX.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.valet_parking_info_content_3_1)
        self.valet_parking_info_content_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_2_1_arrow_image.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_3_2)
        self.valet_parking_info_content_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
        }
        self.contentsView.addSubview(self.valet_parking_info_content_3_2_line_view)
        self.valet_parking_info_content_3_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_sub_title_1_1)
        self.valet_parking_info_sub_title_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_content_3_2_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.valet_parking_info_desc_1_1)
        self.valet_parking_info_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_sub_title_1_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.sideMargin / 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_sub_title_1_2)
        self.valet_parking_info_sub_title_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_desc_1_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.valet_parking_info_desc_1_2_1)
        self.valet_parking_info_desc_1_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_sub_title_1_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.sideMargin / 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.valet_parking_info_desc_1_2_2)
        self.valet_parking_info_desc_1_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_desc_1_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.sideMargin / 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_title_2)
        self.valet_parking_info_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_desc_1_2_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_desc_2)
        self.valet_parking_info_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_title_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.sideMargin / 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.valet_parking_info_sub_title_2_1)
        self.valet_parking_info_sub_title_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.sideMargin / 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_table_view)
        self.valet_parking_info_table_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_sub_title_2_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.valet_parking_info_table_header_1 = self.makeHeaderCell(label: self.valet_parking_info_table_header_1)
        self.valet_parking_info_table_header_2 = self.makeHeaderCell(label: self.valet_parking_info_table_header_2)
        
        self.valet_parking_info_table_view.addSubview(self.valet_parking_info_table_header_1)
        self.valet_parking_info_table_header_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 4)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.valet_parking_info_table_view.addSubview(self.valet_parking_info_table_header_2)
        self.valet_parking_info_table_header_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.valet_parking_info_table_header_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.valet_parking_info_table_col_1_1 = self.makeCell(label: self.valet_parking_info_table_col_1_1)
        self.valet_parking_info_table_col_1_2 = self.makeCell(label: self.valet_parking_info_table_col_1_2)
        self.valet_parking_info_table_col_2_1 = self.makeCell(label: self.valet_parking_info_table_col_2_1)
        self.valet_parking_info_table_col_2_2 = self.makeCell(label: self.valet_parking_info_table_col_2_2)
        
        self.valet_parking_info_table_view.addSubview(self.valet_parking_info_table_col_1_1)
        self.valet_parking_info_table_col_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_table_header_1.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 4)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.valet_parking_info_table_view.addSubview(self.valet_parking_info_table_col_1_2)
        self.valet_parking_info_table_col_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_table_header_1.snp.bottom)
            make.leading.equalTo(self.valet_parking_info_table_col_1_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.valet_parking_info_table_view.addSubview(self.valet_parking_info_table_col_2_1)
        self.valet_parking_info_table_col_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_table_col_1_1.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 4)
            make.height.equalTo(SizeUtils.buttonHeight)
            
            make.bottom.equalToSuperview()
        }
        self.valet_parking_info_table_view.addSubview(self.valet_parking_info_table_col_2_2)
        self.valet_parking_info_table_col_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_table_col_1_1.snp.bottom)
            make.leading.equalTo(self.valet_parking_info_table_col_2_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_desc_2_1)
        self.valet_parking_info_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_table_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.sideMargin / 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.valet_parking_info_sub_title_2_2)
        self.valet_parking_info_sub_title_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_desc_2_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.valet_parking_info_sub_title_2_3)
        self.valet_parking_info_sub_title_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_sub_title_2_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.valet_parking_info_sub_title_2_4)
        self.valet_parking_info_sub_title_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_info_sub_title_2_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    
    }
    func makeHeaderCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }

}
