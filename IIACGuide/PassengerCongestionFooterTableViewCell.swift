//
//  PassengerCongestionFooterTableViewCell.swift
//  incheon
//
//  Created by 김진성 on 2020/09/01.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PassengerCongestionFooterTableViewCell: UITableViewCell {
    
    var terminalType = "T1" {
        didSet {
            addSubview(self.passenger_sub_title_1)
            self.passenger_sub_title_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            addSubview(self.passenger_sub_title_2)
            self.passenger_sub_title_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                if self.terminalType == "T2" {
                    make.height.equalTo(0)
                }
            }
            
            addSubview(self.passenger_title_2)
            self.passenger_title_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_sub_title_2.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            
            addSubview(self.passenger_t1_desc_1_view)
            self.passenger_t1_desc_1_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            addSubview(self.passenger_t1_desc_1)
            self.passenger_t1_desc_1.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_1_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_1_view)
            }
            addSubview(self.passenger_t1_desc_2_view)
            self.passenger_t1_desc_2_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_t1_desc_1_view.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            addSubview(self.passenger_t1_desc_2)
            self.passenger_t1_desc_2.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_2_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_2_view)
            }
            addSubview(self.passenger_t1_desc_3_view)
            self.passenger_t1_desc_3_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_t1_desc_2_view.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            addSubview(self.passenger_t1_desc_3)
            self.passenger_t1_desc_3.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_3_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_3_view)
            }
            addSubview(self.passenger_t1_desc_4_view)
            self.passenger_t1_desc_4_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_t1_desc_3_view.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            addSubview(self.passenger_t1_desc_4)
            self.passenger_t1_desc_4.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_4_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_4_view)
            }
            
            if self.terminalType == "T2" {
                self.passenger_t1_desc_1.text = "passenger_t2_desc_1".localized
                self.passenger_t1_desc_2.text = "passenger_t2_desc_2".localized
                self.passenger_t1_desc_3.text = "passenger_t2_desc_3".localized
                self.passenger_t1_desc_4.text = "passenger_t2_desc_4".localized
            }
        }
    }
    
    
    private let passenger_sub_title_1: UILabel = {
        let label = UILabel()
        label.text = "passenger_sub_title_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let passenger_sub_title_2: UILabel = {
        let label = UILabel()
        label.text = "passenger_sub_title_2".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let passenger_title_2: UILabel = {
        let label = UILabel()
        label.text = "passenger_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_1: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_2: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_3: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: .regular)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_4: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: .regular)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private let passenger_t1_desc_1_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blue00ABFF)
        return view
    }()
    private let passenger_t1_desc_2_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.yellowFBFE00)
        return view
    }()
    private let passenger_t1_desc_3_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
        return view
    }()
    private let passenger_t1_desc_4_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redFF0000)
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
