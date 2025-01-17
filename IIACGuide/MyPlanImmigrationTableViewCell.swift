//
//  MyPlanImmigrationTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanImmigrationTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId : String? {
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_02")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_arr_2_title".localized
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_2_desc_1)
            self.myplan_passenger_arr_2_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_2_btn_1)
            self.myplan_passenger_arr_2_btn_1.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_2_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            self.white_background_view.addSubview(self.myplan_passenger_arr_2_desc_2)
            self.myplan_passenger_arr_2_desc_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_2_btn_1.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_2_btn_2)
            self.myplan_passenger_arr_2_btn_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_2_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            self.white_background_view.addSubview(self.myplan_passenger_arr_2_desc_3)
            self.myplan_passenger_arr_2_desc_3.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_2_btn_2.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_2_btn_3)
            self.myplan_passenger_arr_2_btn_3.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_2_desc_3.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            
            self.myplan_passenger_arr_2_btn_1.isUserInteractionEnabled = true
            self.myplan_passenger_arr_2_btn_2.isUserInteractionEnabled = true
            self.myplan_passenger_arr_2_btn_3.isUserInteractionEnabled = true
            
            self.myplan_passenger_arr_2_btn_1.tag = 0
            self.myplan_passenger_arr_2_btn_2.tag = 1
            self.myplan_passenger_arr_2_btn_3.tag = 2
            
            self.myplan_passenger_arr_2_btn_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDepCheckButton(_:))))
            self.myplan_passenger_arr_2_btn_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDepCheckButton(_:))))
            self.myplan_passenger_arr_2_btn_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDepCheckButton(_:))))
        }
    }

    public let myplan_passenger_arr_2_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_2_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_2_btn_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_2_btn_1".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_2_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_2_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_2_btn_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_2_btn_2".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_2_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_2_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_2_btn_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_2_btn_3".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
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
extension MyPlanImmigrationTableViewCell{
    @objc func tapDepCheckButton(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            
            self.delegate?.tabAirportArriveTab(currentTab: 5)
        }else if sender.view?.tag == 1 {
            
            self.delegate?.tabAirportArriveTab(currentTab: 2)
        }else if sender.view?.tag == 2 {

            self.delegate?.tabAirportArriveTab(currentTab: 4)
        }
    }
}
