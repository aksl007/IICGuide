//
//  ParkingT2ViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/08/26.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ParkingT2ViewController: UIViewController {
    
    var t2_short_1f = 0
    var t2_short_1f_total = 0
    var t2_short_2f = 0
    var t2_short_2f_total = 0
    var t2_short_mf = 0
    var t2_short_mf_total = 0
    var t2_short_b1 = 0
    var t2_short_b1_total = 0
    var t2_long = 0
    var t2_long_total = 0
    
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
        label.text = "real_time_info_parking_table_t2_div_detail_1_1".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail1_2 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_t2_div_detail_1_2".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail1_3 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_t2_div_detail_1_3".localized
        return label
    }()
    private var realTimeInfoParkingTableDivDetail1_4 : UILabel = {
        let label = UILabel()
        label.text = "real_time_info_parking_table_t2_div_detail_1_4".localized
        return label
    }()
    
    private var realTimeInfoParkingT2Short1F : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT2Short2F : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT2ShortMF : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT2ShortB1 : UILabel = {
        let label = UILabel()
        return label
    }()
    private var realTimeInfoParkingT2Long : UILabel = {
        let label = UILabel()
        return label
    }()
    
}
extension ParkingT2ViewController {
    func initUi(){
        self.view.addSubview(self.realTimeInfoParkingHeaderView)
        self.realTimeInfoParkingHeaderView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        self.realTimeInfoParkingHeaderView.addSubview(self.realTimeInfoParkingHeader1)
        self.realTimeInfoParkingHeader1.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.bottom.equalToSuperview()
        }
        self.realTimeInfoParkingHeaderView.addSubview(self.realTimeInfoParkingHeader2)
        self.realTimeInfoParkingHeader2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.realTimeInfoParkingHeader1.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.realTimeInfoParkingHeaderView.addSubview(self.realTimeInfoParkingHeader3)
        self.realTimeInfoParkingHeader3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        
        self.realTimeInfoParkingShortTerm = self.makeCell(label: self.realTimeInfoParkingShortTerm)
        self.realTimeInfoParkingLongTerm = self.makeCell(label: self.realTimeInfoParkingLongTerm)
        self.realTimeInfoParkingTableDivDetail1_1 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_1)
        self.realTimeInfoParkingTableDivDetail1_2 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_2)
        self.realTimeInfoParkingTableDivDetail1_3 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_3)
        self.realTimeInfoParkingTableDivDetail1_4 = self.makeCell(label: self.realTimeInfoParkingTableDivDetail1_4)
        self.realTimeInfoParkingT2Short1F = self.makeCell(label: self.realTimeInfoParkingT2Short1F)
        self.realTimeInfoParkingT2Short2F = self.makeCell(label: self.realTimeInfoParkingT2Short2F)
        self.realTimeInfoParkingT2ShortMF = self.makeCell(label: self.realTimeInfoParkingT2ShortMF)
        self.realTimeInfoParkingT2ShortB1 = self.makeCell(label: self.realTimeInfoParkingT2ShortB1)
        self.realTimeInfoParkingT2Long = self.makeCell(label: self.realTimeInfoParkingT2Long)
        
        self.view.addSubview(self.realTimeInfoParkingShortTerm)
        self.realTimeInfoParkingShortTerm.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingHeaderView.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight * 4)
        }
        self.view.addSubview(self.realTimeInfoParkingLongTerm)
        self.realTimeInfoParkingLongTerm.snp.makeConstraints { (make) in
            make.top.equalTo(realTimeInfoParkingShortTerm.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_1)
        self.realTimeInfoParkingTableDivDetail1_1.snp.makeConstraints { (make) in
            make.top.equalTo(realTimeInfoParkingHeaderView.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_2)
        self.realTimeInfoParkingTableDivDetail1_2.snp.makeConstraints { (make) in
            make.top.equalTo(realTimeInfoParkingTableDivDetail1_1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_3)
        self.realTimeInfoParkingTableDivDetail1_3.snp.makeConstraints { (make) in
            make.top.equalTo(realTimeInfoParkingTableDivDetail1_2.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingTableDivDetail1_4)
        self.realTimeInfoParkingTableDivDetail1_4.snp.makeConstraints { (make) in
            make.top.equalTo(realTimeInfoParkingTableDivDetail1_3.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingShortTerm.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        
        self.view.addSubview(self.realTimeInfoParkingT2Short1F)
        self.realTimeInfoParkingT2Short1F.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingHeaderView.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT2Short2F)
        self.realTimeInfoParkingT2Short2F.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT2Short1F.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT2ShortMF)
        self.realTimeInfoParkingT2ShortMF.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT2Short2F.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT2ShortB1)
        self.realTimeInfoParkingT2ShortB1.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT2ShortMF.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.view.addSubview(self.realTimeInfoParkingT2Long)
        self.realTimeInfoParkingT2Long.snp.makeConstraints { (make) in
            make.top.equalTo(self.realTimeInfoParkingT2ShortB1.snp.bottom)
            make.leading.equalTo(self.realTimeInfoParkingHeader2.snp.trailing)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2)) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        
        self.setParkingConData(label: self.realTimeInfoParkingT2Short1F, carCount: self.t2_short_1f, total: self.t2_short_1f_total)
        self.setParkingConData(label: self.realTimeInfoParkingT2Short2F, carCount: self.t2_short_2f, total: self.t2_short_2f_total)
        self.setParkingConData(label: self.realTimeInfoParkingT2ShortMF, carCount: self.t2_short_mf, total: self.t2_short_mf_total)
        self.setParkingConData(label: self.realTimeInfoParkingT2ShortB1, carCount: self.t2_short_b1, total: self.t2_short_b1_total)
        
        self.setParkingConData(label: self.realTimeInfoParkingT2Long, carCount: self.t2_long, total: self.t2_long_total)
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
