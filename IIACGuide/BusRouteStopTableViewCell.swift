//
//  BusRouteStopTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class BusRouteStopTableViewCell: UITableViewCell {
    
    var busRouteStop : BusRouteStop? {
        didSet {
            
            self.addSubview(self.bus_line)
            self.bus_line.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSize)
            }
            
            self.stopName.text = CommonUtils.getLocaleString(locale: self.busRouteStop?.stop?.name)
            
            self.addSubview(self.stopName)
            self.stopName.snp.makeConstraints { (make) in
                make.leading.equalTo(self.bus_line.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.bus_line)
            }
        }
    }

    private let bus_line : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bus_line")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let stopName : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
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
