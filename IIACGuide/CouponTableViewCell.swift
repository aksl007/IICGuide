//
//  CouponTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Kingfisher

class CouponTableViewCell: UITableViewCell {
    
    var viewWidth: CGFloat = 0.0
    var coupon : Coupon? {
        didSet{
            
            
            self.addSubview(self.logoImage)
            self.logoImage.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.width.equalTo((self.viewWidth - SizeUtils.sideMargin * 2) / 4)
                make.height.equalTo(60)
            }
            
            self.logoImage.addSubview(self.tv_list_coupon_area)
            self.tv_list_coupon_area.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(-5)
                make.leading.equalToSuperview()
                make.width.equalTo(45)
            }
            
            self.addSubview(self.coupon_list_end_line_view)
            self.coupon_list_end_line_view.snp.makeConstraints { (make) in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
            
            self.addSubview(self.coupon_name_and_location_view)
            self.coupon_name_and_location_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalTo(self.logoImage.snp.trailing).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.coupon_name_and_location_view.addSubview(self.name_label)
            self.name_label.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            self.coupon_name_and_location_view.addSubview(self.location_label)
            self.location_label.snp.makeConstraints { (make) in
                make.top.equalTo(self.name_label.snp.bottom)
                make.leading.trailing.equalToSuperview()
            }
            self.coupon_name_and_location_view.addSubview(self.date_label)
            self.date_label.snp.makeConstraints { (make) in
                make.top.equalTo(self.location_label.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            
            if coupon?.logoFileURL ?? "" != "" {
                let url = URL(string: ServerUtils.REAL_URL + (coupon?.logoFileURL ?? ""))
                logoImage.kf.setImage(with: url)
            }
            
            self.name_label.text = CommonUtils.getLocaleString(locale: coupon?.name)
            self.location_label.text = "coupon_list_publisher".localized
            self.date_label.text = String(format: "coupon_list_end_date".localized, CommonUtils.convertToStringFromStringDate(inputString: self.coupon!.endDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy.MM.dd") )
            
            if self.coupon?.campaignArea != nil && self.coupon?.campaignArea != "" {
                self.tv_list_coupon_area.isHidden = false
                
                if self.coupon?.campaignArea == "F" {
                    self.tv_list_coupon_area.text = "tax_free_area".localized
                }else if self.coupon?.campaignArea == "D" {
                    self.tv_list_coupon_area.text = "public_area".localized
                    self.tv_list_coupon_area.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
                }else if self.coupon?.campaignArea == "A" {
                    self.tv_list_coupon_area.text = "ALL"
                    self.tv_list_coupon_area.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightBackground).cgColor
                }
            }else{
                self.tv_list_coupon_area.isHidden = true
            }
        }
    }
    

    private let tv_list_coupon_area : UILabel = {
        let label = UILabel()
        label.text = "Duty Free"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redBackground).cgColor
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "no_image1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let coupon_list_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let coupon_name_and_location_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let name_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let location_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let date_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
