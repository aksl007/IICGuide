//
//  BusDetailTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class BusDetailTableViewCell: UITableViewCell {
    
    var isSearch = false
    var displayDepot : String?
    var busData : BusData? {
        didSet {
            
            if self.isSearch {
                self.terminalType.text = busData?.terminalID?.convertToTerminalNoLong
            }
            
            if self.busData?.busNo == nil || self.busData?.busNo == "" {
                self.busNo.text = "\(CommonUtils.getLocaleString(locale: self.busData?.busName))"
            }else{
                self.busNo.text = "\(self.busData?.busNo ?? "")(\(CommonUtils.getLocaleString(locale: self.busData?.busName)))"
            }
            
            var temp = ""
            if self.displayDepot != nil {
                temp = self.displayDepot ?? ""
            }else{
                var floor = ""
                var i = 0
                for depot in (self.busData?.depots)! {
                    if depot.floor != floor {
                        floor = depot.floor ?? ""
                        
                        if floor.contains("F"){
                            temp += "\(String((depot.floor?.reversed())!)) "
                        }else{
                            temp += "\(depot.floor ?? "") "
                        }
                    }
                    
                    temp += "\(depot.name ?? "")\(depot.rideHome ?? "")"
                 
                    if (self.busData?.depots?.count)! - 1 > i {
                        temp += ", "
                    }
                    
                    i += 1
                }
            }
            
            self.depots.text = "\("bus_list_stop".localized) \(temp) / \("bus_list_interval".localized) \(self.busData?.weekdayOffPeakAllocationTime ?? self.busData?.weekdayOffPeakAllocationTime ?? "")"


            self.addSubview(self.end_line_view)
            self.end_line_view.snp.makeConstraints { (make) in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
            
            self.addSubview(self.icon_arrow_right)
            self.icon_arrow_right.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            self.addSubview(self.busNoView)
            self.busNoView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalTo(self.icon_arrow_right.snp.leading)
            }
            
            self.busNoView.addSubview(self.terminalType)
            self.terminalType.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            
            self.busNoView.addSubview(self.busNo)
            self.busNo.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.leading.equalTo(self.terminalType.snp.trailing)
            }
            
            self.busNoView.addSubview(self.depots)
            self.depots.snp.makeConstraints { (make) in
                make.top.equalTo(self.busNo.snp.bottom).offset(SizeUtils.contentsMargin)
                make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
        }
    }
    
    private let busNoView: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let terminalType : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let busNo : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    private let depots : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let icon_arrow_right : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_arrow_right")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
