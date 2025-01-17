//
//  ShuttleBusTableViewCell.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ShuttleBusTableViewCell: UITableViewCell {
    
    var shuttleStop: ShuttleStop? {
        didSet{
            
            self.shuttle_title.text = CommonUtils.getLocaleString(locale: shuttleStop?.name)
            
            self.addSubview(self.icon_time_default)
            self.icon_time_default.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            
            self.addSubview(self.icon_arrow_right)
            self.icon_arrow_right.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }

            self.addSubview(self.shuttle_title)
            self.shuttle_title.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalTo(self.icon_time_default.snp.trailing).offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.icon_arrow_right.snp.leading).offset(-SizeUtils.sideMargin)
            }
            
            self.addSubview(self.end_view)
            self.end_view.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
    
    
    private let shuttle_title : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let icon_time_default : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_time_default")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let icon_arrow_right : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_arrow_right")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let end_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
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
