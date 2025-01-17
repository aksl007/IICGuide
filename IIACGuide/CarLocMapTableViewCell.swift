//
//  CarLocMapTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class CarLocMapTableViewCell: UITableViewCell {

    var row :Int = 0
    
    var carLocation : CarLocation? {
        didSet{
            self.car_location_date_label.text = CommonUtils.convertToStringFromStringDate(inputString: self.carLocation?.date, inputFormat: "yyyyMMddkkmmss", outputFormat: "yyyy.MM.dd kk:mm:ss")
            
            self.addSubview(self.start_h_line_view)
            self.start_h_line_view.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                if self.row == 0 {
                    make.height.equalTo(1)
                }else{
                    make.height.equalTo(0)
                }
            }
            
            self.addSubview(self.end_h_line_view)
            self.end_h_line_view.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            
            self.addSubview(self.car_location_date_label)
            self.car_location_date_label.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            }
            
            self.addSubview(self.icon_schedule_delete)
            self.icon_schedule_delete.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
        }
    }
    
    private let start_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let car_location_date_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let end_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    public let icon_schedule_delete : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_schedule_delete")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
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
