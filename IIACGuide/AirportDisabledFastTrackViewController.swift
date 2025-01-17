//
//  AirportDisabledFastTrackViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledFastTrackViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledFastTrackViewController.self))
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
    
    private let departure_fast_track_section_title_0: UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_title_0".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transport04_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transport04_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_fast_track_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_fast_track_section_desc_1_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_fast_track_section_desc_1_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_fast_track_section_desc_1_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_fast_track_section_desc_1_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_fast_track_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_fast_track_section_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_fast_track_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_fast_track_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_fast_track_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let ll_disabled_fast_track_table: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var departure_fast_track_section_desc_3_1_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_1_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_1_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_2_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_2_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_2_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_2_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_3_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_3_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_3_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_3_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_4_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_4_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_4_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_4_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_5_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_5_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_5_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_5_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_6_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_6_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_1_col_6_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_1_col_6_2".localized
        return label
    }()
    
    private let departure_fast_track_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_fast_track_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let ll_disabled_fast_track_section_table: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private var departure_fast_track_section_desc_3_2_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_2_col_1_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_2_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_2_col_1_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_2_col_2_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_2_col_2_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_2_col_2_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_2_col_2_2".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_2_col_3_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_2_col_3_1".localized
        return label
    }()
    private var departure_fast_track_section_desc_3_2_col_3_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_fast_track_section_desc_3_2_col_3_2".localized
        return label
    }()
}
extension AirportDisabledFastTrackViewController{
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
        
        self.contentsView.addSubview(self.departure_fast_track_section_title_0)
        self.departure_fast_track_section_title_0.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        
        self.transport04_img01.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFastTrackImage(_:))))
        self.transport04_img01.isUserInteractionEnabled = true
        
        if self.terminalType == "T2" {
            transport04_img01.image = UIImage(named: "transport04_img02")
        }
        self.contentsView.addSubview(self.transport04_img01)
        self.transport04_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_title_0.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.7)
        }
        
        self.contentsView.addSubview(self.departure_fast_track_section_title_1)
        self.departure_fast_track_section_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transport04_img01.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_fast_track_section_desc_1_1)
        self.departure_fast_track_section_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_fast_track_section_desc_1_2)
        self.departure_fast_track_section_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_fast_track_section_title_2)
        self.departure_fast_track_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_1_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_fast_track_section_desc_2)
        self.departure_fast_track_section_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_fast_track_section_title_3)
        self.departure_fast_track_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_fast_track_section_desc_3_1)
        self.departure_fast_track_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        
        self.contentsView.addSubview(self.ll_disabled_fast_track_table)
        self.ll_disabled_fast_track_table.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.departure_fast_track_section_desc_3_1_col_1_1 = self.makeHeaderCell(label: self.departure_fast_track_section_desc_3_1_col_1_1)
        self.departure_fast_track_section_desc_3_1_col_1_2 = self.makeHeaderCell(label: self.departure_fast_track_section_desc_3_1_col_1_2)
        
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_1_1)
        self.departure_fast_track_section_desc_3_1_col_1_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_1_2)
        self.departure_fast_track_section_desc_3_1_col_1_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_fast_track_section_desc_3_1_col_1_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.departure_fast_track_section_desc_3_1_col_2_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_2_1)
        self.departure_fast_track_section_desc_3_1_col_2_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_2_2)
        self.departure_fast_track_section_desc_3_1_col_3_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_3_1)
        self.departure_fast_track_section_desc_3_1_col_3_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_3_2)
        self.departure_fast_track_section_desc_3_1_col_4_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_4_1)
        self.departure_fast_track_section_desc_3_1_col_4_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_4_2)
        self.departure_fast_track_section_desc_3_1_col_5_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_5_1)
        self.departure_fast_track_section_desc_3_1_col_5_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_5_2)
        self.departure_fast_track_section_desc_3_1_col_6_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_6_1)
        self.departure_fast_track_section_desc_3_1_col_6_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_1_col_6_2)
        
        
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_2_1)
        self.departure_fast_track_section_desc_3_1_col_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_1_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_2_2)
        self.departure_fast_track_section_desc_3_1_col_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_1_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_1_col_2_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_3_1)
        self.departure_fast_track_section_desc_3_1_col_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_2_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_3_2)
        self.departure_fast_track_section_desc_3_1_col_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_2_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_1_col_3_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_4_1)
        self.departure_fast_track_section_desc_3_1_col_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_3_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_4_2)
        self.departure_fast_track_section_desc_3_1_col_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_3_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_1_col_4_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_5_1)
        self.departure_fast_track_section_desc_3_1_col_5_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_4_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_5_2)
        self.departure_fast_track_section_desc_3_1_col_5_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_4_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_1_col_5_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_6_1)
        self.departure_fast_track_section_desc_3_1_col_6_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_5_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            
            make.bottom.equalToSuperview()
        }
        self.ll_disabled_fast_track_table.addSubview(self.departure_fast_track_section_desc_3_1_col_6_2)
        self.departure_fast_track_section_desc_3_1_col_6_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_1_col_5_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_1_col_6_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        
        self.contentsView.addSubview(self.departure_fast_track_section_desc_3_2)
        self.departure_fast_track_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_disabled_fast_track_table.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        

        self.contentsView.addSubview(self.ll_disabled_fast_track_section_table)
        self.ll_disabled_fast_track_section_table.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
        self.departure_fast_track_section_desc_3_2_col_1_1 = self.makeHeaderCell(label: self.departure_fast_track_section_desc_3_2_col_1_1)
        self.departure_fast_track_section_desc_3_2_col_1_2 = self.makeHeaderCell(label: self.departure_fast_track_section_desc_3_2_col_1_2)
        
        self.ll_disabled_fast_track_section_table.addSubview(self.departure_fast_track_section_desc_3_2_col_1_1)
        self.departure_fast_track_section_desc_3_2_col_1_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_section_table.addSubview(self.departure_fast_track_section_desc_3_2_col_1_2)
        self.departure_fast_track_section_desc_3_2_col_1_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_fast_track_section_desc_3_2_col_1_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.departure_fast_track_section_desc_3_2_col_2_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_2_col_2_1)
        self.departure_fast_track_section_desc_3_2_col_2_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_2_col_2_2)
        self.departure_fast_track_section_desc_3_2_col_3_1 = self.makeCell(label: self.departure_fast_track_section_desc_3_2_col_3_1)
        self.departure_fast_track_section_desc_3_2_col_3_2 = self.makeCell(label: self.departure_fast_track_section_desc_3_2_col_3_2)
        
        
        self.ll_disabled_fast_track_section_table.addSubview(self.departure_fast_track_section_desc_3_2_col_2_1)
        self.departure_fast_track_section_desc_3_2_col_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_2_col_1_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight * 3)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_fast_track_section_table.addSubview(self.departure_fast_track_section_desc_3_2_col_2_2)
        self.departure_fast_track_section_desc_3_2_col_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_2_col_1_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_2_col_2_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight * 3)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
        }
        
        self.ll_disabled_fast_track_section_table.addSubview(self.departure_fast_track_section_desc_3_2_col_3_1)
        self.departure_fast_track_section_desc_3_2_col_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_2_col_2_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight * 3)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            
            make.bottom.equalToSuperview()
        }
        self.ll_disabled_fast_track_section_table.addSubview(self.departure_fast_track_section_desc_3_2_col_3_2)
        self.departure_fast_track_section_desc_3_2_col_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_fast_track_section_desc_3_2_col_2_1.snp.bottom)
            make.leading.equalTo(self.departure_fast_track_section_desc_3_2_col_3_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight * 3)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
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
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
}
extension AirportDisabledFastTrackViewController {

    @objc func clickFastTrackImage(_ sender: UITapGestureRecognizer){
        let imageZoomVC = ImageZoomViewController()
        imageZoomVC.paramTitle = "slide_airport_guide_sub_menu_4".localized
        imageZoomVC.image = (sender.view as! UIImageView).image
        self.navigationController?.pushViewController(imageZoomVC, animated: true)
    }
}
