//
//  MyPlanEndTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanEndTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId : String? {
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_02")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_dep_9_title".localized
            
            
            self.white_background_view.addSubview(self.icon_beacon01)
            self.icon_beacon01.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSize)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_9_desc)
            self.myplan_passenger_dep_9_desc.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.trailing.equalTo(self.icon_beacon01.snp.leading)
            }
        }
    }
    
    private let icon_beacon01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_beacon01")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    public let myplan_passenger_dep_9_desc : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_9_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
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
