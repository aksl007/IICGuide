//
//  MyPlanBoardingTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanBoardingTableViewCell: MyPlanBaseTableViewCell {
    
    var time : String?
    
    var terminalId : String?
    
    var gateNo : String? {
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_06")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_dep_8_title".localized
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_8_desc_1)
            self.myplan_passenger_dep_8_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            
            self.tv_myplan_passenger_dep_8.text = self.gateNo
            self.white_background_view.addSubview(self.tv_myplan_passenger_dep_8)
            self.tv_myplan_passenger_dep_8.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_8_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }

            self.white_background_view.addSubview(self.myplan_passenger_dep_8_desc_2)
            self.myplan_passenger_dep_8_desc_2.snp.makeConstraints { (make) in
                make.leading.equalTo(self.tv_myplan_passenger_dep_8.snp.trailing).offset(SizeUtils.contentsMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 9)
                make.centerY.equalTo(self.tv_myplan_passenger_dep_8)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_8_desc_3)
            self.myplan_passenger_dep_8_desc_3.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_8_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            
            if terminalId != "P02" {
                self.myplan_passenger_dep_8_desc_3_con.isHidden = true
            }
            self.white_background_view.addSubview(self.myplan_passenger_dep_8_desc_3_con)
            self.myplan_passenger_dep_8_desc_3_con.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_8_desc_3.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
                if terminalId != "P02" {
                    make.height.equalTo(0)
                }
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_8_desc_4)
            self.myplan_passenger_dep_8_desc_4.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_8_desc_3_con.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            
            self.myplan_passenger_dep_8_desc_3.attributedText = "<span style='font-size: \(SizeUtils.contentsBig)px;'>\(String(format: "myplan_passenger_dep_8_desc_3".localized, "<span style='color:red;'>\(self.time ?? "")</span>" as! CVarArg))</span>".htmlToAttributedString
        }
    }
    
    public let myplan_passenger_dep_8_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_8_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let tv_myplan_passenger_dep_8 : UILabelPadding = {
        let label = UILabelPadding()

        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_dep_8_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_8_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_dep_8_desc_3 : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_8_desc_3_con : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_8_desc_3_con".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_8_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_8_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
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
