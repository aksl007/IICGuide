//
//  MyPlanBackHomeTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanBackHomeTableViewCell: MyPlanBaseTableViewCell {
    
    var terminalId: String?{
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_arr_02")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_arr_8_title".localized
            
            self.white_background_view.addSubview(self.icon_beacon01)
            self.icon_beacon01.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.size.equalTo(SizeUtils.iconSize)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_8_desc)
            self.myplan_passenger_arr_8_desc.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.centerY.equalTo(self.icon_beacon01)
                make.trailing.equalTo(self.icon_beacon01.snp.leading)
            }
            
            self.myplan_passenger_arr_8_btn_1.isUserInteractionEnabled = true
            self.myplan_passenger_arr_8_btn_2.isUserInteractionEnabled = true
            self.myplan_passenger_arr_8_btn_3.isUserInteractionEnabled = true
            
            self.myplan_passenger_arr_8_btn_1.tag = 0
            self.myplan_passenger_arr_8_btn_2.tag = 1
            self.myplan_passenger_arr_8_btn_3.tag = 2
            
            self.myplan_passenger_arr_8_btn_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackHome(_:))))
            self.myplan_passenger_arr_8_btn_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackHome(_:))))
            self.myplan_passenger_arr_8_btn_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackHome(_:))))
            
            self.white_background_view.addSubview(self.myplan_passenger_arr_8_btn_2)
            self.myplan_passenger_arr_8_btn_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_8_desc.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 8)/3)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            self.white_background_view.addSubview(self.myplan_passenger_arr_8_btn_1)
            self.myplan_passenger_arr_8_btn_1.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.myplan_passenger_arr_8_btn_2)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 8)/3)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            self.white_background_view.addSubview(self.myplan_passenger_arr_8_btn_3)
            self.myplan_passenger_arr_8_btn_3.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.myplan_passenger_arr_8_btn_2)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 8)/3)
                make.height.equalTo(SizeUtils.greenButtonHeight)
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
    
    public let myplan_passenger_arr_8_desc : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_8_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let myplan_passenger_arr_8_btn_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_8_btn_1".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_8_btn_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_8_btn_2".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_arr_8_btn_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_8_btn_3".localized
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
extension MyPlanBackHomeTableViewCell {
    @objc func tapBackHome(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //공항버스
            
            if self.terminalId == "P03"{
                self.delegate?.tapPublicTransport(terminalType: "T2", currentTap: 0)
            }else{
                self.delegate?.tapPublicTransport(terminalType: "T1", currentTap: 0)
            }
        }else if sender.view?.tag == 1 {
            //공항철도
            if self.terminalId == "P03"{
                self.delegate?.tapPublicTransport(terminalType: "T2", currentTap: 1)
            }else{
                self.delegate?.tapPublicTransport(terminalType: "T1", currentTap: 1)
            }
        }else if sender.view?.tag == 2 {
            //주차장
            if self.terminalId == "P03"{
                self.delegate?.tapParking(terminalType: "T2", currentTap: 0)
            }else{
                self.delegate?.tapParking(terminalType: "T1", currentTap: 0)
            }
        }
        
    }
}
