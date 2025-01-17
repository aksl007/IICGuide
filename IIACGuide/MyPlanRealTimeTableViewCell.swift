//
//  MyPlanRealTimeTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanRealTimeTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId: String? {
        didSet{
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_dep_5_title".localized
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
