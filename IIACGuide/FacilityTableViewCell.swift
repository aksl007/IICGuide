//
//  FacilityTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Kingfisher

class FacilityTableViewCell: UITableViewCell {
    
    var viewWidth: CGFloat = 0.0
    
    var isCoupon = false
    
    var facility : Facility? {
        didSet {
            
            self.addSubview(self.logoImage)
            self.logoImage.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.width.equalTo((self.viewWidth - SizeUtils.sideMargin * 2) / 4)
                make.height.equalTo(60)
            }
            self.addSubview(self.facility_area_and_event_view)
            self.facility_area_and_event_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                
            }
            
            self.facility_area_and_event_view.addSubview(self.area_label)
            self.area_label.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(20)
                make.width.equalTo(50)
            }
            self.facility_area_and_event_view.addSubview(self.shopping_event_icon)
            self.shopping_event_icon.snp.makeConstraints { (make) in
                make.top.equalTo(self.area_label.snp.bottom)
                make.size.equalTo(SizeUtils.iconSizeSmall)
                
                make.bottom.equalToSuperview()
            }
            
            self.addSubview(self.facility_name_and_location_view)
            self.facility_name_and_location_view.snp.makeConstraints { (make) in
                make.leading.equalTo(self.logoImage.snp.trailing).offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.facility_area_and_event_view.snp.leading).offset(-SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
            }
            
            self.facility_name_and_location_view.addSubview(self.name_label)
            self.name_label.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            self.facility_name_and_location_view.addSubview(self.locatioin_label)
            self.locatioin_label.snp.makeConstraints { (make) in
                make.top.equalTo(self.name_label.snp.bottom).offset(3)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            self.addSubview(self.facility_list_end_line_view)
            self.facility_list_end_line_view.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
            
            if facility?.logoImageURL ?? "" != "" {
                let url = URL(string: ServerUtils.REAL_URL + (facility?.logoImageURL ?? ""))
                logoImage.kf.setImage(with: url)
            }
            
            self.name_label.text = CommonUtils.getLocaleString(locale: facility?.name)
            self.locatioin_label.text = CommonUtils.getLocaleString(locale: facility?.locationDesc)
            
            if self.facility?.areaCode == "D" {
                self.area_label.text = "public_area".localized
                self.area_label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
            }else {
                self.area_label.text = "tax_free_area".localized
                self.area_label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redBackground).cgColor
            }

            if self.isCoupon {
                self.shopping_event_icon.isHidden = false
                self.shopping_event_icon.snp.remakeConstraints { (make) in
                    make.top.equalTo(self.area_label.snp.bottom).offset(SizeUtils.contentsMargin)
                    make.size.equalTo(SizeUtils.iconSize)
                    make.centerX.equalToSuperview()
                    
                    make.bottom.equalToSuperview()
                }
            }else{
                self.shopping_event_icon.isHidden = true
                self.shopping_event_icon.snp.remakeConstraints { (make) in
                    make.top.equalTo(self.area_label.snp.bottom)
                    make.size.equalTo(0)
                    
                    make.bottom.equalToSuperview()
                }
            }
        }
    }
    
    private let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "no_image1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let facility_list_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let facility_name_and_location_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let name_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let locatioin_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let facility_area_and_event_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let area_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redBackground).cgColor
        label.sizeToFit()
        return label
    }()
    
    private let shopping_event_icon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shopping_event_icon")
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
