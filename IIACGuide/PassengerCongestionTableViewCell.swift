//
//  PassengerCongestionTableViewCell.swift
//  incheon
//
//  Created by 김진성 on 2020/09/01.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PassengerCongestionTableViewCell: UITableViewCell {

    var width: CGFloat = 0.0
    var terminalType = "T1"
    var type = "dep"
    var row = 0
    
    var beforeTotal:Int = 0
    var afterTotal:Int = 0
    
    var passengerInfo : PassengerInfo? {
        didSet{
            
            self.passenger_t1_1_table_header_1 = self.makeCell(label: self.passenger_t1_1_table_header_1)
            self.passenger_t1_1_table_header_2 = self.makeCell(label: self.passenger_t1_1_table_header_2)
            self.passenger_t1_1_table_header_3 = self.makeCell(label: self.passenger_t1_1_table_header_3)
            self.passenger_t1_1_table_header_4 = self.makeCell(label: self.passenger_t1_1_table_header_4)
            self.passenger_t1_1_table_header_5 = self.makeCell(label: self.passenger_t1_1_table_header_5)
            self.passenger_t1_1_table_header_6 = self.makeCell(label: self.passenger_t1_1_table_header_6)
            
            addSubview(self.passenger_t1_1_table_header_1)
            self.passenger_t1_1_table_header_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                if self.terminalType == "T2" {
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 4)
                }else{
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 6)
                }
                
                make.height.equalTo(SizeUtils.tableBigHeight)
                make.bottom.equalToSuperview()
            }
            addSubview(self.passenger_t1_1_table_header_2)
            self.passenger_t1_1_table_header_2.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.passenger_t1_1_table_header_1.snp.trailing)
                if self.terminalType == "T2" {
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 4)
                }else{
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 6)
                }
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.passenger_t1_1_table_header_3)
            self.passenger_t1_1_table_header_3.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.passenger_t1_1_table_header_2.snp.trailing)
                if self.terminalType == "T2" {
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 4)
                }else{
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 6)
                }
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.passenger_t1_1_table_header_4)
            self.passenger_t1_1_table_header_4.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.passenger_t1_1_table_header_3.snp.trailing)
                if self.terminalType == "T2" {
                    make.width.equalTo(0)
                }else{
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 6)
                }
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.passenger_t1_1_table_header_5)
            self.passenger_t1_1_table_header_5.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.passenger_t1_1_table_header_4.snp.trailing)
                if self.terminalType == "T2" {
                    make.width.equalTo(0)
                }else{
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 6)
                }
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.passenger_t1_1_table_header_6)
            self.passenger_t1_1_table_header_6.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.passenger_t1_1_table_header_5.snp.trailing)
                if self.terminalType == "T2" {
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 4)
                }else{
                    make.width.equalTo((self.width - SizeUtils.sideMargin * 2) / 6)
                }
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            
            self.passenger_t1_1_table_header_1.text = "\(self.row)~\(self.row + 1)"
            if self.row == 24 {
                self.passenger_t1_1_table_header_1.text = "passenger_t1_1_table_header_6".localized
            }
            
            
            if self.terminalType == "T1" {
                if self.type == "dep" {
                    self.passenger_t1_1_table_header_2.text = "\(self.passengerInfo?.section12Passengers ?? 0)"
                    self.passenger_t1_1_table_header_3.text = "\(self.passengerInfo?.section3Passengers ?? 0)"
                    self.passenger_t1_1_table_header_4.text = "\(self.passengerInfo?.section4Passengers ?? 0)"
                    self.passenger_t1_1_table_header_5.text = "\(self.passengerInfo?.section56Passengers ?? 0)"
                    self.passenger_t1_1_table_header_6.text = "\(self.passengerInfo?.totalPassengers ?? 0)"
                }else {
                    self.passenger_t1_1_table_header_2.text = "\(self.passengerInfo?.eastSectionPassengers ?? 0)"
                    self.passenger_t1_1_table_header_3.text = "\(self.passengerInfo?.westSectionPassengers ?? 0)"
                    self.passenger_t1_1_table_header_4.text = "\(self.passengerInfo?.cSectionPassengers ?? 0)"
                    self.passenger_t1_1_table_header_5.text = "\(self.passengerInfo?.dSectionPassengers ?? 0)"
                    self.passenger_t1_1_table_header_6.text = "\(self.passengerInfo?.totalPassengers ?? 0)"
                }
            }else {
                if self.type == "dep" {
                    self.passenger_t1_1_table_header_2.text = "\(self.passengerInfo?.section1Passengers ?? 0)"
                    self.passenger_t1_1_table_header_3.text = "\(self.passengerInfo?.section2Passengers ?? 0)"
                    self.passenger_t1_1_table_header_6.text = "\(self.passengerInfo?.totalPassengers ?? 0)"
                }else {
                    self.passenger_t1_1_table_header_2.text = "\(self.passengerInfo?.eastSectionPassengers ?? 0)"
                    self.passenger_t1_1_table_header_3.text = "\(self.passengerInfo?.westSectionPassengers ?? 0)"
                    self.passenger_t1_1_table_header_6.text = "\(self.passengerInfo?.totalPassengers ?? 0)"
                }
            }
            
            let total = (self.passengerInfo?.totalPassengers ?? 0)
            if self.terminalType == "T2" {
                if total >= 3200 && total < 3500 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blue00ABFF)
                }else if total >= 3500 && total < 3800 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.yellowFBFE00)
                }else if total >= 3800 && total < 4000 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
                }else if total >= 4000 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redFF0000)
                }
            }else {
                if total >= 7000 && total < 7600 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blue00ABFF)
                }else if total >= 7600 && total < 8200 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.yellowFBFE00)
                }else if total >= 8200 && total < 8600 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
                }else if total >= 8600 {
                    backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redFF0000)
                }
            }
            
            
            if self.terminalType == "T2" {
                if total >= 3500 {
                    if (self.beforeTotal >= 3500 && self.beforeTotal < 3800) || (self.afterTotal >= 3500 && self.afterTotal < 3800) {
                        backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
                    }else if (self.beforeTotal >= 3800) || (self.afterTotal >= 3800) {
                        backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redFF0000)
                    }
                }
                
            }else {
                if total >= 7600 {
                    if (self.beforeTotal >= 7600 && self.beforeTotal < 8200) || (self.afterTotal >= 7600 && self.afterTotal < 8200) {
                        backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
                    }else if (self.beforeTotal >= 8200) || (self.afterTotal >= 8200) {
                        backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redFF0000)
                    }
                }
            }
            
        }
    }
            
    func makeCell(label:UILabel) -> UILabel{
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
         label.textAlignment = .center
         label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
         label.layer.borderWidth = 0.5
         label.numberOfLines = 2
         label.sizeToFit()
         return label
     }
     
    private var passenger_t1_1_table_header_1: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_2: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_3: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_4: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_5: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    private var passenger_t1_1_table_header_6: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
