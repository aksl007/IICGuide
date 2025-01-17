//
//  AREXRateViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/10.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AREXRateViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AREXRateViewController.self))
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
    private let arex_fare_title_1: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let arex_fare_title_2_t1: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_title_2_t1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private var arex_fare_table_title_1: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_title_1".localized
        return label
    }()
    private var arex_fare_table_title_2: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_title_2".localized
        return label
    }()
    
    private var arex_fare_table_t1_station_1: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_1".localized
        return label
    }()
    private var arex_fare_table_t1_station_2: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_2".localized
        return label
    }()
    private var arex_fare_table_t1_station_3: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_3".localized
        return label
    }()
    private var arex_fare_table_t1_station_4: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_4".localized
        return label
    }()
    private var arex_fare_table_t1_station_5: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_5".localized
        return label
    }()
    private var arex_fare_table_t1_station_6: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_6".localized
        return label
    }()
    private var arex_fare_table_t1_station_7: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_7".localized
        return label
    }()
    private var arex_fare_table_t1_station_8: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_8".localized
        return label
    }()
    private var arex_fare_table_t1_station_9: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_9".localized
        return label
    }()
    private var arex_fare_table_t1_station_10: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_10".localized
        return label
    }()
    private var arex_fare_table_t1_station_11: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_11".localized
        return label
    }()
    private var arex_fare_table_t1_station_12: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_12".localized
        return label
    }()
    private var arex_fare_table_t1_station_13: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_station_13".localized
        return label
    }()
    
    private var arex_fare_table_t1_fare_1: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_1".localized
        return label
    }()
    private var arex_fare_table_t1_fare_2: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_2".localized
        return label
    }()
    private var arex_fare_table_t1_fare_3: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_3".localized
        return label
    }()
    private var arex_fare_table_t1_fare_4: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_4".localized
        return label
    }()
    private var arex_fare_table_t1_fare_5: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_5".localized
        return label
    }()
    private var arex_fare_table_t1_fare_6: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_6".localized
        return label
    }()
    private var arex_fare_table_t1_fare_7: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_7".localized
        return label
    }()
    private var arex_fare_table_t1_fare_8: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_8".localized
        return label
    }()
    private var arex_fare_table_t1_fare_9: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_9".localized
        return label
    }()
    private var arex_fare_table_t1_fare_10: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_10".localized
        return label
    }()
    private var arex_fare_table_t1_fare_11: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_11".localized
        return label
    }()
    private var arex_fare_table_t1_fare_12: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_12".localized
        return label
    }()
    private var arex_fare_table_t1_fare_13: UILabel = {
        let label = UILabel()
        label.text = "arex_fare_table_t1_fare_13".localized
        return label
    }()

    private let arex_fare_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "arex_fare_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arex_fare_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "arex_fare_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arex_fare_sub_title_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "arex_fare_sub_title_3".localized.getDescription,
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
extension AREXRateViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "arex_link_1".localized)
        
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
        
        self.contentsView.addSubview(self.arex_fare_title_1)
        self.arex_fare_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        if self.terminalType == "T2" {
            self.arex_fare_title_2_t1.text = "arex_fare_title_2_t2".localized.getSubTitle
        }
        self.contentsView.addSubview(self.arex_fare_title_2_t1)
        self.arex_fare_title_2_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.arex_fare_table_title_1 = self.makeHeaderCell(label: self.arex_fare_table_title_1)
        self.arex_fare_table_title_2 = self.makeHeaderCell(label: self.arex_fare_table_title_2)
        
        self.contentsView.addSubview(self.arex_fare_table_title_1)
        self.arex_fare_table_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_title_2_t1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_title_2)
        self.arex_fare_table_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_title_2_t1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalTo(self.arex_fare_table_title_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        //    "arex_fare_table_t1_station_1" = "인천공항 2터미널";
        //    "arex_fare_table_t1_station_2" = "공항화물청사";
        //    "arex_fare_table_t1_station_3" = "운서";
        //    "arex_fare_table_t1_station_4" = "영종";
        //    "arex_fare_table_t1_station_5" = "청라국제도시";
        //    "arex_fare_table_t1_station_6" = "검암";
        //    "arex_fare_table_t1_station_7" = "계양";
        //    "arex_fare_table_t1_station_8" = "김포공항";
        //    "arex_fare_table_t1_station_9" = "마곡나루";
        //    "arex_fare_table_t1_station_10" = "디지털미디어시티";
        //    "arex_fare_table_t1_station_11" = "홍대입구";
        //    "arex_fare_table_t1_station_12" = "공덕";
        //    "arex_fare_table_t1_station_13" = "서울역";
        
        self.arex_fare_table_t1_station_1 = self.makeCell(label: self.arex_fare_table_t1_station_1)
        self.arex_fare_table_t1_station_2 = self.makeCell(label: self.arex_fare_table_t1_station_2)
        self.arex_fare_table_t1_station_3 = self.makeCell(label: self.arex_fare_table_t1_station_3)
        self.arex_fare_table_t1_station_4 = self.makeCell(label: self.arex_fare_table_t1_station_4)
        self.arex_fare_table_t1_station_5 = self.makeCell(label: self.arex_fare_table_t1_station_5)
        self.arex_fare_table_t1_station_6 = self.makeCell(label: self.arex_fare_table_t1_station_6)
        self.arex_fare_table_t1_station_7 = self.makeCell(label: self.arex_fare_table_t1_station_7)
        self.arex_fare_table_t1_station_8 = self.makeCell(label: self.arex_fare_table_t1_station_8)
        self.arex_fare_table_t1_station_9 = self.makeCell(label: self.arex_fare_table_t1_station_9)
        self.arex_fare_table_t1_station_10 = self.makeCell(label: self.arex_fare_table_t1_station_10)
        self.arex_fare_table_t1_station_11 = self.makeCell(label: self.arex_fare_table_t1_station_11)
        self.arex_fare_table_t1_station_12 = self.makeCell(label: self.arex_fare_table_t1_station_12)
        self.arex_fare_table_t1_station_13 = self.makeCell(label: self.arex_fare_table_t1_station_13)
        
        if self.terminalType == "T2" {
            self.arex_fare_table_t1_station_1.text = "arex_fare_table_t2_station_1".localized
            self.arex_fare_table_t1_station_2.text = "arex_fare_table_t2_station_2".localized
            self.arex_fare_table_t1_station_3.text = "arex_fare_table_t2_station_3".localized
            self.arex_fare_table_t1_station_4.text = "arex_fare_table_t2_station_4".localized
            self.arex_fare_table_t1_station_5.text = "arex_fare_table_t2_station_5".localized
            self.arex_fare_table_t1_station_6.text = "arex_fare_table_t2_station_6".localized
            self.arex_fare_table_t1_station_7.text = "arex_fare_table_t2_station_7".localized
            self.arex_fare_table_t1_station_8.text = "arex_fare_table_t2_station_8".localized
            self.arex_fare_table_t1_station_9.text = "arex_fare_table_t2_station_9".localized
            self.arex_fare_table_t1_station_10.text = "arex_fare_table_t2_station_10".localized
            self.arex_fare_table_t1_station_11.text = "arex_fare_table_t2_station_11".localized
            self.arex_fare_table_t1_station_12.text = "arex_fare_table_t2_station_12".localized
            self.arex_fare_table_t1_station_13.text = "arex_fare_table_t2_station_13".localized
        }
        
        self.contentsView.addSubview(self.arex_fare_table_t1_station_1)
        self.arex_fare_table_t1_station_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_title_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_2)
        self.arex_fare_table_t1_station_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_3)
        self.arex_fare_table_t1_station_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_4)
        self.arex_fare_table_t1_station_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_5)
        self.arex_fare_table_t1_station_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_6)
        self.arex_fare_table_t1_station_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_7)
        self.arex_fare_table_t1_station_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_6.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_8)
        self.arex_fare_table_t1_station_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_7.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_9)
        self.arex_fare_table_t1_station_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_8.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_10)
        self.arex_fare_table_t1_station_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_9.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_11)
        self.arex_fare_table_t1_station_11.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_10.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_12)
        self.arex_fare_table_t1_station_12.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_11.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_station_13)
        self.arex_fare_table_t1_station_13.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_station_12.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 3 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        self.arex_fare_table_t1_fare_1 = self.makeCell(label: self.arex_fare_table_t1_fare_1)
        self.arex_fare_table_t1_fare_2 = self.makeCell(label: self.arex_fare_table_t1_fare_2)
        self.arex_fare_table_t1_fare_3 = self.makeCell(label: self.arex_fare_table_t1_fare_3)
        self.arex_fare_table_t1_fare_4 = self.makeCell(label: self.arex_fare_table_t1_fare_4)
        self.arex_fare_table_t1_fare_5 = self.makeCell(label: self.arex_fare_table_t1_fare_5)
        self.arex_fare_table_t1_fare_6 = self.makeCell(label: self.arex_fare_table_t1_fare_6)
        self.arex_fare_table_t1_fare_7 = self.makeCell(label: self.arex_fare_table_t1_fare_7)
        self.arex_fare_table_t1_fare_8 = self.makeCell(label: self.arex_fare_table_t1_fare_8)
        self.arex_fare_table_t1_fare_9 = self.makeCell(label: self.arex_fare_table_t1_fare_9)
        self.arex_fare_table_t1_fare_10 = self.makeCell(label: self.arex_fare_table_t1_fare_10)
        self.arex_fare_table_t1_fare_11 = self.makeCell(label: self.arex_fare_table_t1_fare_11)
        self.arex_fare_table_t1_fare_12 = self.makeCell(label: self.arex_fare_table_t1_fare_12)
        self.arex_fare_table_t1_fare_13 = self.makeCell(label: self.arex_fare_table_t1_fare_13)
        
        if self.terminalType == "T2" {
            self.arex_fare_table_t1_fare_1.text = "arex_fare_table_t2_fare_1".localized
            self.arex_fare_table_t1_fare_2.text = "arex_fare_table_t2_fare_2".localized
            self.arex_fare_table_t1_fare_3.text = "arex_fare_table_t2_fare_3".localized
            self.arex_fare_table_t1_fare_4.text = "arex_fare_table_t2_fare_4".localized
            self.arex_fare_table_t1_fare_5.text = "arex_fare_table_t2_fare_5".localized
            self.arex_fare_table_t1_fare_6.text = "arex_fare_table_t2_fare_6".localized
            self.arex_fare_table_t1_fare_7.text = "arex_fare_table_t2_fare_7".localized
            self.arex_fare_table_t1_fare_8.text = "arex_fare_table_t2_fare_8".localized
            self.arex_fare_table_t1_fare_9.text = "arex_fare_table_t2_fare_9".localized
            self.arex_fare_table_t1_fare_10.text = "arex_fare_table_t2_fare_10".localized
            self.arex_fare_table_t1_fare_11.text = "arex_fare_table_t2_fare_11".localized
            self.arex_fare_table_t1_fare_12.text = "arex_fare_table_t2_fare_12".localized
            self.arex_fare_table_t1_fare_13.text = "arex_fare_table_t2_fare_13".localized
        }
        
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_1)
        self.arex_fare_table_t1_fare_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_title_1.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_2)
        self.arex_fare_table_t1_fare_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_1.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_3)
        self.arex_fare_table_t1_fare_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_2.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_4)
        self.arex_fare_table_t1_fare_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_3.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_5)
        self.arex_fare_table_t1_fare_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_4.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_6)
        self.arex_fare_table_t1_fare_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_5.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_7)
        self.arex_fare_table_t1_fare_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_6.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_8)
        self.arex_fare_table_t1_fare_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_7.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_9)
        self.arex_fare_table_t1_fare_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_8.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_10)
        self.arex_fare_table_t1_fare_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_9.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_11)
        self.arex_fare_table_t1_fare_11.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_10.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_12)
        self.arex_fare_table_t1_fare_12.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_11.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_fare_table_t1_fare_13)
        self.arex_fare_table_t1_fare_13.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_12.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        self.contentsView.addSubview(self.arex_fare_sub_title_1)
        self.arex_fare_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_table_t1_fare_13.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arex_fare_sub_title_2)
        self.arex_fare_sub_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arex_fare_sub_title_3)
        self.arex_fare_sub_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_fare_sub_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
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
