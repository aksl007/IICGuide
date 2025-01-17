//
//  MyPlanHallCongestionTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanHallCongestionTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId: String? {
        didSet{
        
            if terminalId == "P03"{
                self.isHidden = true
            }
            
            self.myplan_passenger_dep_con_title_1.text = "real_time_info_category_3".localized
            
            self.white_background_view.addSubview(self.realTimeInfoArrConestionView)
            self.realTimeInfoArrConestionView.snp.makeConstraints { (make) in
                make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
        }
    }
    
    public let realTimeInfoArrConestionView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
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
