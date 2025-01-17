//
//  MyPlanParkingTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/22.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanParkingTableViewCell: MyPlanBaseTableViewCell {
    
    
    var terminalId : String? {
        didSet{
            self.myplan_passenger_dep_con_title_1.text = "\("real_time_info_parking_title".localized)(\(self.terminalId?.convertToTerminalNoLong ?? "flights_list_t1".localized))"
            
            self.white_background_view.addSubview(self.realTimeInfoParkingView)
            self.realTimeInfoParkingView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.sideMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                if self.terminalId == "P03" {
                    make.height.equalTo(SizeUtils.tableHeaderHeight + (SizeUtils.tableHeight * 5))
                }else {
                    make.height.equalTo(SizeUtils.tableHeaderHeight + (SizeUtils.tableHeight * 8))
                }
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_parking_notice)
            self.myplan_passenger_parking_notice.snp.makeConstraints { (make) in
                make.top.equalTo(self.realTimeInfoParkingView.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
        }
    }
    
    public let realTimeInfoParkingView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let myplan_passenger_parking_notice : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_parking_notice".localized
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
