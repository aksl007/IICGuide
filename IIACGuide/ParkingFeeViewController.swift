//
//  ParkingFeeViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/08/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ParkingFeeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingFeeViewController.self))
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
    
    private let parkingFeeTableView : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()

    private let parking_fee_info_title_1 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let real_time_info_parking_short_term : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_short_term".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.yellowBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let real_time_info_parking_long_term : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_long_term".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let parking_fee_info_reserve : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_reserve".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
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
    
    private var parking_fee_info_small_for_short : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_small".localized
        return label
    }()
    private var parking_fee_info_small_for_long : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_small".localized
        return label
    }()
    private var parking_fee_info_large : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_large".localized
        return label
    }()
    private var parking_fee_info_small_for_reserve : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_small".localized
        return label
    }()
    
    private var parking_fee_info_short_term_small_basic : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_short_term_small_basic".localized
        return label
    }()
    private var parking_fee_info_short_term_small_add : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_short_term_small_add".localized
        return label
    }()
    private var parking_fee_info_long_term_small_basic : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_long_term_small_basic".localized
        return label
    }()
    private var parking_fee_info_long_term_large_basic : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_long_term_large_basic".localized
        return label
    }()
    private var parking_fee_info_reserve_small_basic : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_reserve_small_basic".localized
        return label
    }()

    func makeDescription(label: UILabel, description: String) -> UILabel{
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: description.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
    
    private var parking_fee_info_sub_title_1_1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_1_2 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_1_3 : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let parking_fee_info_title_2 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private var parking_fee_info_sub_title_2_1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_2_2 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_2_3 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_2_4 : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let parking_fee_info_title_3 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private var parking_fee_info_sub_title_3 : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let parking_fee_info_title_4 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private var parking_fee_info_sub_title_4_1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_4_2 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_4_3 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_4_4 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var parking_fee_info_sub_title_4_5 : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let parking_fee_info_link_1_line_view_1 : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let parking_fee_info_link_1 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_info_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let parking_fee_info_link_1_line_view_2 : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
}
extension ParkingFeeViewController {
    
    func initUi(){
        self.setNavigationItems()
        
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
        
        self.contentsView.addSubview(self.parking_fee_info_title_1)
        self.parking_fee_info_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.parkingFeeTableView)
        self.parkingFeeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.parkingFeeTableView.addSubview(self.real_time_info_parking_short_term)
        self.real_time_info_parking_short_term.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight * 2)
        }
        self.parkingFeeTableView.addSubview(self.real_time_info_parking_long_term)
        self.real_time_info_parking_long_term.snp.makeConstraints { (make) in
            make.top.equalTo(self.real_time_info_parking_short_term.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight * 2)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_reserve)
        self.parking_fee_info_reserve.snp.makeConstraints { (make) in
            make.top.equalTo(self.real_time_info_parking_long_term.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
            make.bottom.equalToSuperview()
        }
        
        self.parking_fee_info_small_for_short = self.makeCell(label: self.parking_fee_info_small_for_short)
        self.parking_fee_info_small_for_long = self.makeCell(label: self.parking_fee_info_small_for_long)
        self.parking_fee_info_large = self.makeCell(label: self.parking_fee_info_large)
        self.parking_fee_info_small_for_reserve = self.makeCell(label: self.parking_fee_info_small_for_reserve)
        
        self.parkingFeeTableView.addSubview(self.parking_fee_info_small_for_short)
        self.parking_fee_info_small_for_short.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.real_time_info_parking_short_term.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight * 2)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_small_for_long)
        self.parking_fee_info_small_for_long.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_small_for_short.snp.bottom)
            make.leading.equalTo(self.real_time_info_parking_long_term.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_large)
        self.parking_fee_info_large.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_small_for_long.snp.bottom)
            make.leading.equalTo(self.real_time_info_parking_long_term.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_small_for_reserve)
        self.parking_fee_info_small_for_reserve.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_large.snp.bottom)
            make.leading.equalTo(self.parking_fee_info_reserve.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        
        self.parking_fee_info_short_term_small_basic = self.makeCell(label: self.parking_fee_info_short_term_small_basic)
        self.parking_fee_info_short_term_small_add = self.makeCell(label: self.parking_fee_info_short_term_small_add)
        self.parking_fee_info_long_term_small_basic = self.makeCell(label: self.parking_fee_info_long_term_small_basic)
        self.parking_fee_info_long_term_large_basic = self.makeCell(label: self.parking_fee_info_long_term_large_basic)
        self.parking_fee_info_reserve_small_basic = self.makeCell(label: self.parking_fee_info_reserve_small_basic)
        
        self.parkingFeeTableView.addSubview(self.parking_fee_info_short_term_small_basic)
        self.parking_fee_info_short_term_small_basic.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.parking_fee_info_small_for_short.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) * 3 / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_short_term_small_add)
        self.parking_fee_info_short_term_small_add.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_short_term_small_basic.snp.bottom)
            make.leading.equalTo(self.parking_fee_info_small_for_short.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) * 3 / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_long_term_small_basic)
        self.parking_fee_info_long_term_small_basic.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_short_term_small_add.snp.bottom)
            make.leading.equalTo(self.parking_fee_info_small_for_short.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) * 3 / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_long_term_large_basic)
        self.parking_fee_info_long_term_large_basic.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_long_term_small_basic.snp.bottom)
            make.leading.equalTo(self.parking_fee_info_small_for_short.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) * 3 / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        self.parkingFeeTableView.addSubview(self.parking_fee_info_reserve_small_basic)
        self.parking_fee_info_reserve_small_basic.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_long_term_large_basic.snp.bottom)
            make.leading.equalTo(self.parking_fee_info_small_for_short.snp.trailing)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) * 3 / 5)
            make.height.equalTo(SizeUtils.parkingFeeTableHeight)
        }
        
        self.parking_fee_info_sub_title_1_1 = self.makeDescription(label: self.parking_fee_info_sub_title_1_1, description: "parking_fee_info_sub_title_1_1".localized)
        self.parking_fee_info_sub_title_1_2 = self.makeDescription(label: self.parking_fee_info_sub_title_1_2, description: "parking_fee_info_sub_title_1_2".localized)
        self.parking_fee_info_sub_title_1_3 = self.makeDescription(label: self.parking_fee_info_sub_title_1_3, description: "parking_fee_info_sub_title_1_3".localized)
        
        self.contentsView.addSubview(self.parking_fee_info_sub_title_1_1)
        self.parking_fee_info_sub_title_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(parkingFeeTableView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_1_2)
        self.parking_fee_info_sub_title_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_1_3)
        self.parking_fee_info_sub_title_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.parking_fee_info_sub_title_2_1 = self.makeDescription(label: self.parking_fee_info_sub_title_2_1, description: "parking_fee_info_sub_title_2_1".localized)
        self.parking_fee_info_sub_title_2_2 = self.makeDescription(label: self.parking_fee_info_sub_title_2_2, description: "parking_fee_info_sub_title_2_2".localized)
        self.parking_fee_info_sub_title_2_3 = self.makeDescription(label: self.parking_fee_info_sub_title_2_3, description: "parking_fee_info_sub_title_2_3".localized)
        self.parking_fee_info_sub_title_2_4 = self.makeDescription(label: self.parking_fee_info_sub_title_2_4, description: "parking_fee_info_sub_title_2_4".localized)
        
        self.contentsView.addSubview(self.parking_fee_info_title_2)
        self.parking_fee_info_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_sub_title_1_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_2_1)
        self.parking_fee_info_sub_title_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_2_2)
        self.parking_fee_info_sub_title_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_2_3)
        self.parking_fee_info_sub_title_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_2_4)
        self.parking_fee_info_sub_title_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_2_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.parking_fee_info_sub_title_3 = self.makeDescription(label: self.parking_fee_info_sub_title_3, description: "parking_fee_info_sub_title_3".localized)
        
        self.contentsView.addSubview(self.parking_fee_info_title_3)
        self.parking_fee_info_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_sub_title_2_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_3)
        self.parking_fee_info_sub_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.parking_fee_info_sub_title_4_1 = self.makeDescription(label: self.parking_fee_info_sub_title_4_1, description: "parking_fee_info_sub_title_4_1".localized)
        self.parking_fee_info_sub_title_4_2 = self.makeDescription(label: self.parking_fee_info_sub_title_4_2, description: "parking_fee_info_sub_title_4_2".localized)
        self.parking_fee_info_sub_title_4_3 = self.makeDescription(label: self.parking_fee_info_sub_title_4_3, description: "parking_fee_info_sub_title_4_3".localized)
        self.parking_fee_info_sub_title_4_4 = self.makeDescription(label: self.parking_fee_info_sub_title_4_4, description: "parking_fee_info_sub_title_4_4".localized)
        self.parking_fee_info_sub_title_4_5 = self.makeDescription(label: self.parking_fee_info_sub_title_4_5, description: "parking_fee_info_sub_title_4_5".localized)
        
        self.contentsView.addSubview(self.parking_fee_info_title_4)
        self.parking_fee_info_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_sub_title_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_4_1)
        self.parking_fee_info_sub_title_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_4_2)
        self.parking_fee_info_sub_title_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_4_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_4_3)
        self.parking_fee_info_sub_title_4_3.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_4_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_4_4)
        self.parking_fee_info_sub_title_4_4.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_4_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_info_sub_title_4_5)
        self.parking_fee_info_sub_title_4_5.snp.makeConstraints { (make) in
            make.top.equalTo(parking_fee_info_sub_title_4_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
        }
        
        self.contentsView.addSubview(self.parking_fee_info_link_1_line_view_1)
        self.parking_fee_info_link_1_line_view_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_sub_title_4_5.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.parking_fee_info_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveParkingFeeInfoDetail)))
        self.parking_fee_info_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.parking_fee_info_link_1)
        self.parking_fee_info_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_link_1_line_view_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.parking_fee_info_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.parking_fee_info_link_1_line_view_2)
        self.parking_fee_info_link_1_line_view_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_info_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            //scroll end
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "real_time_info_parking_link_1".localized)
    }
    
}

extension ParkingFeeViewController {
    @objc func moveParkingFeeInfoDetail(){
        self.openWebView(title: "parking_fee_info_link_1".localized, url: ServerUtils.URL_PARKING_FEE)
    }
}

