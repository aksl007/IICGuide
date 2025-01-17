//
//  CarLocMapFooterTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class CarLocMapFooterTableViewCell: UITableViewCell {
    
    var isExistList: Bool = false {
        didSet {
            
            self.addSubview(self.register_car_loc_no_result)
            self.register_car_loc_no_result.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.centerX.equalToSuperview()
                if self.isExistList{
                    make.height.equalTo(0)
                }
            }
            
            self.addSubview(self.parking_category_5)
            self.parking_category_5.snp.makeConstraints { (make) in
                make.top.equalTo(self.register_car_loc_no_result.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.height.equalTo(SizeUtils.buttonHeight)
            }
            
            self.addSubview(self.register_car_loc_sub_title_1)
            self.register_car_loc_sub_title_1.snp.makeConstraints { (make) in
                make.top.equalTo(self.parking_category_5.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.addSubview(self.register_car_loc_sub_title_2)
            self.register_car_loc_sub_title_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.register_car_loc_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            self.addSubview(self.register_car_loc_sub_title_3)
            self.register_car_loc_sub_title_3.snp.makeConstraints { (make) in
                make.top.equalTo(self.register_car_loc_sub_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
        }
    }
    
    private let register_car_loc_no_result : UILabel = {
        let label = UILabel()
        label.text = "register_car_loc_no_result".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    public let parking_category_5 : UIButton = {
        let button = UIButton()
        button.setTitle("parking_category_5".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let register_car_loc_sub_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "register_car_loc_sub_title_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let register_car_loc_sub_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "register_car_loc_sub_title_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let register_car_loc_sub_title_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "register_car_loc_sub_title_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
//    "register_car_loc_no_result" = "주차 위치를 등록해 주시기 바랍니다.";
//    "register_car_loc_sub_title_1" = "실내에서는 GPS가 제대로 동작하지 않을 수 있습니다.";
//    "register_car_loc_sub_title_2" = "실외에서 사용해주세요.";
//    "register_car_loc_sub_title_3" = "최대 5개까지 등록할 수 있습니다.";
//    "register_car_loc_delete" = "주차 기록을 삭제하시겠습니까?";
//    "register_map_save" = "위치 등록";
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
