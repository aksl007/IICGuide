//
//  MyPlanCustomsTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanCustomsTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId : String? {
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_04")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_arr_6_title".localized
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_6_desc)
            self.myplan_passenger_arr_6_desc.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
        }
    }

    public let myplan_passenger_arr_6_desc : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_6_desc".localized
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
