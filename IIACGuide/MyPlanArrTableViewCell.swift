//
//  MyPlanArrTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanArrTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId : String? {
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_arr_01")
            self.myplan_passenger_dep_con_title_1.text = "flight_enum_2".localized
            
            self.tv_myplan_passenger_arr_4_desc_1.text = String(format: "myplan_passenger_arr_4_desc_1".localized, terminalId?.convertToTerminalNoLong as! CVarArg)
            
            if terminalId == "P02"{
                self.myplan_passenger_arr_4_desc_2.text = "myplan_passenger_arr_4_desc_1_con".localized
            }
            
            self.white_background_view.addSubview(self.tv_myplan_passenger_arr_4_desc_1)
            self.tv_myplan_passenger_arr_4_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            self.white_background_view.addSubview(self.myplan_passenger_arr_4_desc_2)
            self.myplan_passenger_arr_4_desc_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_myplan_passenger_arr_4_desc_1.snp.bottom).offset(SizeUtils.contents)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
        }
    }
    
    public let tv_myplan_passenger_arr_4_desc_1 : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_4_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_4_desc_2".localized
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
