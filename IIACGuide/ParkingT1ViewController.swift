//
//  ParkingT1ViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/25.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ParkingT1ViewController: UIViewController {
    
    var t1_short_1f = 0
    var t1_short_1f_total = 0
    var t1_short_b1 = 0
    var t1_short_b1_total = 0
    var t1_short_b2 = 0
    var t1_short_b2_total = 0
    var t1_long_tower_p1 = 0
    var t1_long_tower_p1_total = 0
    var t1_long_tower_p2 = 0
    var t1_long_tower_p2_total = 0
    var t1_long_p1 = 0
    var t1_long_p1_total = 0
    var t1_long_p2 = 0
    var t1_long_p2_total = 0
    var t1_long_p3 = 0
    var t1_long_p3_total = 0
    
    var viewWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewWidth == 0.0 {
            viewWidth = self.view.frame.width
        }
        
        initUi()
    }
    
    private let realTimeInfoParkingHeaderView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let realTimeInfoParkingHeader1 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_header_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }()
    private let realTimeInfoParkingHeader2 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_header_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }()
    private let realTimeInfoParkingHeader3 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_header_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }()
    
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.subTitle, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
    private var realTimeInfoParkingShortTerm : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_short_term".localized
        return label
    }()
    private var realTimeInfoParkingLongTerm : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_long_term".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail1_1 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_1_1".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail1_2 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_1_2".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail1_3 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_1_3".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail2_1 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_2_1".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail2_2 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_2_2".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail2_3 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_2_3".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail2_4 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_2_4".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail2_5 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_div_detail_2_5".localized
        return label
    }()
    
    private var realTimeInfoParkingT1Short1F : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1ShortB1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1ShortB2 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1LongTowerP1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1LongTowerP2 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1LongP1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1LongP2 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT1LongP3 : UILabel = {
        let label = UILabel()
        return label
    }()
    
}
//UI
extension ParkingT1ViewController {
    func initUi(){
        
        self.view.addSubview(self.realTimeInfoParkingHeaderView)
        self.realTimeInfoParkingHeaderView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        self.realTimeInfoParkingHeaderView.addSubview(self.realTimeInfoParkingHeader1)
        self.realTimeInfoParkingHeader1.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.bottom.equalToSuperview()
        }
        self.realTimeInfoParkingHeaderView.addSubview(self.realTimeInfoParkingHeader2)
        self.realTimeInfoParkingHeader2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.realTimeInfoParkingHeader1.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.realTimeInfoParkingHeaderView.addSubview(self.realTimeInfoParkingHeader3)
        self.realTimeInfoParkingHeader3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        
        self.realTimeInfoParkingShortTerm = self.makeCell(label: self.realTimeInfoParkingShortTerm)
        self.realTimeInfoParkingLongTerm = self.makeCell(label: self.realTimeInfoParkingLongTerm)
        self.realTimeInfoParkingTableDivDetail1_1 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_1)
        self.realTimeInfoParkingTableDivDetail1_2 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_2)
        self.realTimeInfoParkingTableDivDetail1_3 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_3)
        self.realTimeInfoParkingTableDivDetail2_1 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail2_1)
        self.realTimeInfoParkingTableDivDetail2_2 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail2_2)
        self.realTimeInfoParkingTableDivDetail2_3 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail2_3)
        self.realTimeInfoParkingTableDivDetail2_4 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail2_4)
        self.realTimeInfoParkingTableDivDetail2_5 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail2_5)
        
        self.view.addSubview(self.realTimeInfoParkingShortTerm)
        self.realTimeInfoParkingShortTerm.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingHeaderView.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight * 3)
        }
        self.view.addSubview(self.realTimeInfoParkingLongTerm)
        self.realTimeInfoParkingLongTerm.snp.makeConstraints { (make) in
            make.top.equalTo(realTimeInfoParkingShortTerm.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight * 5)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_1)
        self.realTimeInfoParkingTableDivDetail1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingHeaderView.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_2)
        self.realTimeInfoParkingTableDivDetail1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail1_1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_3)
        self.realTimeInfoParkingTableDivDetail1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail1_2.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail2_1)
        self.realTimeInfoParkingTableDivDetail2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail1_3.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingLongTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail2_2)
        self.realTimeInfoParkingTableDivDetail2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail2_1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingLongTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail2_3)
        self.realTimeInfoParkingTableDivDetail2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail2_2.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingLongTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail2_4)
        self.realTimeInfoParkingTableDivDetail2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail2_3.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingLongTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail2_5)
        self.realTimeInfoParkingTableDivDetail2_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingTableDivDetail2_4.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingLongTerm.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        
        self.realTimeInfoParkingT1Short1F = self.makeCell(label: self.realTimeInfoParkingT1Short1F)
        self.realTimeInfoParkingT1ShortB1 = self.makeCell(label: self.realTimeInfoParkingT1ShortB1)
        self.realTimeInfoParkingT1ShortB2 = self.makeCell(label: self.realTimeInfoParkingT1ShortB2)
        self.realTimeInfoParkingT1LongTowerP1 = self.makeCell(label: self.realTimeInfoParkingT1LongTowerP1)
        self.realTimeInfoParkingT1LongTowerP2 = self.makeCell(label: self.realTimeInfoParkingT1LongTowerP2)
        self.realTimeInfoParkingT1LongP1 = self.makeCell(label: self.realTimeInfoParkingT1LongP1)
        self.realTimeInfoParkingT1LongP2 = self.makeCell(label: self.realTimeInfoParkingT1LongP2)
        self.realTimeInfoParkingT1LongP3 = self.makeCell(label: self.realTimeInfoParkingT1LongP3)
        
        
//        if self.t1_short_1f_total == 0 {
//            self.realTimeInfoParkingT1Short1F.text = "not_operated".localized
//            self.realTimeInfoParkingT1Short1F.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
//        }else{
//            self.realTimeInfoParkingT1Short1F.text = "\(self.t1_short_1f) \("real_time_info_parking_table_count_unit".localized)"
//            if self.t1_short_1f <= 0 {
//                self.realTimeInfoParkingT1Short1F.text = "real_time_info_parking_table_count_full".localized
//                self.realTimeInfoParkingT1Short1F.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
//            }
//        }
//
        
        self.view.addSubview(self.realTimeInfoParkingT1Short1F)
        self.realTimeInfoParkingT1Short1F.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingHeaderView.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1ShortB1)
        self.realTimeInfoParkingT1ShortB1.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1Short1F.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1ShortB2)
        self.realTimeInfoParkingT1ShortB2.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1ShortB1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1LongTowerP1)
        self.realTimeInfoParkingT1LongTowerP1.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1ShortB2.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1LongTowerP2)
        self.realTimeInfoParkingT1LongTowerP2.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1LongTowerP1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1LongP1)
        self.realTimeInfoParkingT1LongP1.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1LongTowerP2.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1LongP2)
        self.realTimeInfoParkingT1LongP2.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1LongP1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT1LongP3)
        self.realTimeInfoParkingT1LongP3.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT1LongP2.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        
        self.setParkingConData(label: self.realTimeInfoParkingT1Short1F, carCount: self.t1_short_1f, total: self.t1_short_1f_total)
        self.setParkingConData(label: self.realTimeInfoParkingT1ShortB1, carCount: self.t1_short_b1, total: self.t1_short_b1_total)
        self.setParkingConData(label: self.realTimeInfoParkingT1ShortB2, carCount: self.t1_short_b2, total: self.t1_short_b2_total)
        
        self.setParkingConData(label: self.realTimeInfoParkingT1LongTowerP1, carCount: self.t1_long_tower_p1, total: self.t1_long_tower_p1_total)
        self.setParkingConData(label: self.realTimeInfoParkingT1LongTowerP2, carCount: self.t1_long_tower_p2, total: self.t1_long_tower_p2_total)
        self.setParkingConData(label: self.realTimeInfoParkingT1LongP1, carCount: self.t1_long_p1, total: self.t1_long_p1_total)
        self.setParkingConData(label: self.realTimeInfoParkingT1LongP2, carCount: self.t1_long_p2, total: self.t1_long_p2_total)
        self.setParkingConData(label: self.realTimeInfoParkingT1LongP3, carCount: self.t1_long_p3, total: self.t1_long_p3_total)
    }
    
    func setParkingConData(label: UILabel, carCount: Int , total: Int){
        if total == 0 {
            label.text = "not_operated".localized
            label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        }else{
            label.text = "\(carCount) \("real_time_info_parking_table_count_unit".localized)"
            if carCount <= 0 {
                label.text = "real_time_info_parking_table_count_full".localized
                label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
            }
        }
    }
}
