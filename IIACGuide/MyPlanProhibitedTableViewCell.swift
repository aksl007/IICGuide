//
//  MyPlanProhibitedTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanProhibitedTableViewCell: MyPlanBaseTableViewCell {

    var terminalId: String? {
        didSet{
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_04")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_dep_6_title".localized
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_6_desc_1)
            self.myplan_passenger_dep_6_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            
            self.myplan_passenger_dep_6_btn_1_view.isUserInteractionEnabled = true
            self.myplan_passenger_dep_6_btn_1_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapProhibitedItem)))
            self.white_background_view.addSubview(self.myplan_passenger_dep_6_btn_1_view)
            self.myplan_passenger_dep_6_btn_1_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_6_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.viewWidth * 2 / 3)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            
            self.myplan_passenger_dep_6_btn_1_view.addSubview(self.myplan_passenger_dep_6_btn_1)
            self.myplan_passenger_dep_6_btn_1.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset(-(SizeUtils.iconSize + SizeUtils.sideMargin) / 2)
                make.centerY.equalToSuperview()
            }
            self.myplan_passenger_dep_6_btn_1_view.addSubview(self.myplan_flight_search)
            self.myplan_flight_search.snp.makeConstraints { (make) in
                make.leading.equalTo(self.myplan_passenger_dep_6_btn_1.snp.trailing).offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSize)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_6_desc_2)
            self.myplan_passenger_dep_6_desc_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_6_btn_1_view.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            
            self.addSubview(self.divide_line_view)
            self.divide_line_view.snp.makeConstraints { (make) in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(SizeUtils.navigationHeight)
            }
            self.divide_line_view.addSubview(self.myplan_passenger_dep_7_title_1)
            self.myplan_passenger_dep_7_title_1.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
            
            self.divide_line_view.addSubview(self.divide_line_start_view)
            self.divide_line_start_view.snp.makeConstraints { (make) in
                make.leading.centerY.equalToSuperview()
                make.trailing.equalTo(self.myplan_passenger_dep_7_title_1.snp.leading).offset(-SizeUtils.sideMargin * 2)
                make.height.equalTo(1)
            }
            self.divide_line_view.addSubview(self.divide_line_end_view)
            self.divide_line_end_view.snp.makeConstraints { (make) in
                make.trailing.centerY.equalToSuperview()
                make.leading.equalTo(self.myplan_passenger_dep_7_title_1.snp.trailing).offset(SizeUtils.sideMargin * 2)
                make.height.equalTo(1)
            }
            
        }
    }
    
    public let myplan_passenger_dep_6_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_6_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_dep_6_btn_1_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        view.sizeToFit()
        return view
    }()
    private let myplan_passenger_dep_6_btn_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_6_btn_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let myplan_flight_search : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_flight_search")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    public let myplan_passenger_dep_6_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_6_desc_2".localized
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
    public let divide_line_start_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    public let divide_line_end_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    public let myplan_passenger_dep_7_title_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_7_title_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
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
extension MyPlanProhibitedTableViewCell {
    @objc func tapProhibitedItem(){
        self.delegate?.tapAirportTab(currentTab: 5)
    }
    
}

