//
//  MyPlanArrHallTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanArrHallTableViewCell: MyPlanBaseTableViewCell {
    
    var exitDoorNo: String?{
        didSet {
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_arr_7_title".localized
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_7_desc_1)
            self.myplan_passenger_arr_7_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
         
            self.tv_myplan_passenger_arr_7.text = self.exitDoorNo
            self.white_background_view.addSubview(self.tv_myplan_passenger_arr_7)
            self.tv_myplan_passenger_arr_7.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_7_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }

            self.white_background_view.addSubview(self.myplan_passenger_arr_7_desc_2)
            self.myplan_passenger_arr_7_desc_2.snp.makeConstraints { (make) in
                make.leading.equalTo(self.tv_myplan_passenger_arr_7.snp.trailing).offset(SizeUtils.contentsMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 10)
                make.centerY.equalTo(self.tv_myplan_passenger_arr_7)
            }
        }
    }

    public let myplan_passenger_arr_7_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_7_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let tv_myplan_passenger_arr_7 : UILabelPadding = {
        let label = UILabelPadding()

        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_7_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_7_desc_2".localized
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
