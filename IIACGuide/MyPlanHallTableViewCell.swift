//
//  MyPlanHallTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanHallTableViewCell: MyPlanBaseTableViewCell {
    
    var counter : String?
    var terminalId: String? {
        didSet{
            
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_03")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_dep_hall_title".localized
            
            self.myplan_passenger_dep_hall_desc_1.text = String(format: "myplan_passenger_dep_hall_desc_1".localized, terminalId?.convertToTerminalNoLong as! CVarArg)
            
            self.tv_myplan_passenger_dep_4_checkin.text = counter
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_desc_1)
            self.myplan_passenger_dep_hall_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_desc_2)
            self.myplan_passenger_dep_hall_desc_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_hall_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.tv_myplan_passenger_dep_4_checkin)
            self.tv_myplan_passenger_dep_4_checkin.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_hall_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }

            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_desc_3)
            self.myplan_passenger_dep_hall_desc_3.snp.makeConstraints { (make) in
                make.leading.equalTo(self.tv_myplan_passenger_dep_4_checkin.snp.trailing)
                make.centerY.equalTo(self.tv_myplan_passenger_dep_4_checkin)
            }
            
            self.white_background_view.addSubview(self.divide_line_view)
            self.divide_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_hall_desc_3.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(20)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_desc_4)
            self.myplan_passenger_dep_hall_desc_4.snp.makeConstraints { (make) in
                make.top.equalTo(self.divide_line_view.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }

            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_btn_2_view)
            self.myplan_passenger_dep_hall_btn_2_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_hall_desc_4.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
                make.width.equalTo((self.viewWidth - SizeUtils.sideMargin * 8)/3)
                make.height.equalTo(35)
            }
            
            self.myplan_passenger_dep_hall_btn_2_view.addSubview(self.myplan_passenger_dep_hall_btn_2)
            self.myplan_passenger_dep_hall_btn_2.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset((SizeUtils.iconSizeVerySmall + SizeUtils.contentsMargin) / 2)
                make.centerY.equalToSuperview()
            }
            self.myplan_passenger_dep_hall_btn_2_view.addSubview(self.myplan_icon_roaming)
            self.myplan_icon_roaming.snp.makeConstraints { (make) in
                make.trailing.equalTo(self.myplan_passenger_dep_hall_btn_2.snp.leading).offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            
            self.myplan_passenger_dep_hall_btn_1_view.isUserInteractionEnabled = true
            self.myplan_passenger_dep_hall_btn_2_view.isUserInteractionEnabled = true
            self.myplan_passenger_dep_hall_btn_3_view.isUserInteractionEnabled = true
            
            self.myplan_passenger_dep_hall_btn_1_view.tag = 0
            self.myplan_passenger_dep_hall_btn_2_view.tag = 1
            self.myplan_passenger_dep_hall_btn_3_view.tag = 2
            
            self.myplan_passenger_dep_hall_btn_1_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDepHallButton(_:))))
            self.myplan_passenger_dep_hall_btn_2_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDepHallButton(_:))))
            self.myplan_passenger_dep_hall_btn_3_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDepHallButton(_:))))
            
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_btn_1_view)
            self.myplan_passenger_dep_hall_btn_1_view.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.myplan_passenger_dep_hall_btn_2_view)
                make.trailing.equalTo(self.myplan_passenger_dep_hall_btn_2_view.snp.leading).offset(-SizeUtils.sideMargin)
                make.width.equalTo((self.viewWidth - SizeUtils.sideMargin * 8)/3)
                make.height.equalTo(35)
            }
            
            self.myplan_passenger_dep_hall_btn_1_view.addSubview(self.myplan_passenger_dep_hall_btn_1)
            self.myplan_passenger_dep_hall_btn_1.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset((SizeUtils.iconSizeVerySmall + SizeUtils.contentsMargin) / 2)
                make.centerY.equalToSuperview()
            }
            self.myplan_passenger_dep_hall_btn_1_view.addSubview(self.myplan_icon_exchange)
            self.myplan_icon_exchange.snp.makeConstraints { (make) in
                make.trailing.equalTo(self.myplan_passenger_dep_hall_btn_1.snp.leading).offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_hall_btn_3_view)
            self.myplan_passenger_dep_hall_btn_3_view.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.myplan_passenger_dep_hall_btn_2_view)
                make.leading.equalTo(self.myplan_passenger_dep_hall_btn_2_view.snp.trailing).offset(SizeUtils.sideMargin)
                make.width.equalTo((self.viewWidth - SizeUtils.sideMargin * 8)/3)
                make.height.equalTo(35)
            }
            
            self.myplan_passenger_dep_hall_btn_3_view.addSubview(self.myplan_passenger_dep_hall_btn_3)
            self.myplan_passenger_dep_hall_btn_3.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset((SizeUtils.iconSizeVerySmall + SizeUtils.contentsMargin) / 2)
                make.centerY.equalToSuperview()
            }
            self.myplan_passenger_dep_hall_btn_3_view.addSubview(self.myplan_icon_insurance)
            self.myplan_icon_insurance.snp.makeConstraints { (make) in
                make.trailing.equalTo(self.myplan_passenger_dep_hall_btn_3.snp.leading).offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            
            self.addSubview(self.myplan_icon_bullet_2)
            self.myplan_icon_bullet_2.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.dot_line_view)
                make.centerY.equalTo(self.myplan_passenger_dep_hall_desc_4).offset(SizeUtils.topMargin)
            }
            self.addSubview(self.myplan_speech_bubble_tail_2)
            self.myplan_speech_bubble_tail_2.snp.makeConstraints { (make) in
                make.leading.equalTo(self.dot_line_view.snp.centerX)
                make.bottom.equalTo(self.myplan_icon_bullet_2.snp.top)
            }
        }
    }
    
    public let myplan_passenger_dep_hall_desc_1 : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_dep_hall_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_hall_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let tv_myplan_passenger_dep_4_checkin : UILabelPadding = {
        let label = UILabelPadding()

        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_dep_hall_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_hall_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let divide_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    
    public let myplan_passenger_dep_hall_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_hall_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let myplan_passenger_dep_hall_btn_1_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = 35 / 2
        view.sizeToFit()
        return view
    }()
    private let myplan_icon_exchange : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_icon_exchange")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let myplan_passenger_dep_hall_btn_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_hall_btn_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_dep_hall_btn_2_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = 35 / 2
        view.sizeToFit()
        return view
    }()
    private let myplan_icon_roaming : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_icon_roaming")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let myplan_passenger_dep_hall_btn_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_hall_btn_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_dep_hall_btn_3_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = 35 / 2
        view.sizeToFit()
        return view
    }()
    private let myplan_icon_insurance : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_icon_insurance")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let myplan_passenger_dep_hall_btn_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_hall_btn_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    public let myplan_icon_bullet_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_icon_bullet")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    public let myplan_speech_bubble_tail_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_speech_bubble_tail")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
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
extension MyPlanHallTableViewCell{
    @objc func tapDepHallButton(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //환전
            if self.terminalId == "P03" {
                self.delegate?.tapFinance(terminalType: "T2", currentTap: 1)
            }else{
                self.delegate?.tapFinance(terminalType: "T1", currentTap: 1)
            }
            
        }else if sender.view?.tag == 1 {
            //로밍
            if self.terminalId == "P03" {
                self.delegate?.tapOther(terminalType: "T2", currentTap: 0)
            }else{
                self.delegate?.tapOther(terminalType: "T1", currentTap: 0)
            }
            
        }else if sender.view?.tag == 2 {
            //보험
            if self.terminalId == "P03" {
                self.delegate?.tapFinance(terminalType: "T2", currentTap: 3)
            }else{
                self.delegate?.tapFinance(terminalType: "T1", currentTap: 3)
            }
        }
    }
}
