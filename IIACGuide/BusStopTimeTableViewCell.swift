//
//  BusStopTimeTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class BusStopTimeTableViewCell: UITableViewCell {
    var type = "bus"
    var isTodayInWeekend = true
    var rowIndex = 0
    var colIndex = 0
    var indexRow = 0
    
    var viewWidth: CGFloat = 0.0
    
    var busTimetableRow : BusTimetableRow? {
        didSet{
            
            self.hour = self.makeCell(label: self.hour)
            self.shuttle_bus_time_weekday = self.makeCell(label: self.shuttle_bus_time_weekday)
            self.shuttle_bus_time_weekend = self.makeCell(label: self.shuttle_bus_time_weekend)
            self.min_weekday = self.makeCell(label: self.min_weekday)
            self.min_weekend = self.makeCell(label: self.min_weekend)
            self.min_same = self.makeCell(label: self.min_same)
            
            
            
            self.hour.text = self.busTimetableRow?.hour
        
            
            if indexRow == rowIndex {
                if self.isTodayInWeekend {
                    //주말
                    var attributeString =  NSMutableAttributedString(string: " \(self.busTimetableRow?.minRow2 ?? "00")")
                    if self.busTimetableRow?.minRow2 == "" {
                        attributeString =  NSMutableAttributedString(string: "")
                    }else{
                        attributeString.addAttribute(NSAttributedString.Key.foregroundColor,
                                                     value: ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText),
                                                     range: NSMakeRange((colIndex * 4) + 1, 2))
                    }
                    
                    self.min_same.attributedText = attributeString
                    self.min_weekend.attributedText = attributeString
                    self.min_weekday.text = " \(self.busTimetableRow?.minRow1 ?? "00")"
                }else{
                    //주중
                    var attributeString =  NSMutableAttributedString(string: " \(self.busTimetableRow?.minRow1 ?? "00")")
                    if self.busTimetableRow?.minRow1 == "" {
                        attributeString =  NSMutableAttributedString(string: "")
                    }else{
                        attributeString.addAttribute(NSAttributedString.Key.foregroundColor,
                                                     value: ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText),
                                                     range: NSMakeRange((colIndex * 4) + 1, 2))
                    }
                    
                    self.min_same.attributedText = attributeString
                    self.min_weekday.attributedText = attributeString
                    self.min_weekend.text = " \(self.busTimetableRow?.minRow2 ?? "00")"
                }
                
            }else {
                
                self.min_same.text = " \(self.busTimetableRow?.minRow1 ?? "00")"
                self.min_weekday.text = " \(self.busTimetableRow?.minRow1 ?? "00")"
                self.min_weekend.text = " \(self.busTimetableRow?.minRow2 ?? "00")"
            }
            
            
            if (self.busTimetableRow?.same)! {
                self.min_same.isHidden = false
            }else{
                self.min_same.isHidden = true
            }
            
            
            
            self.addSubview(self.hour)
            self.hour.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.height.equalTo(SizeUtils.tableHeight * 2)
                make.width.equalTo(self.viewWidth)
            }
            
            self.addSubview(self.shuttle_bus_time_weekday)
            self.shuttle_bus_time_weekday.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.hour.snp.trailing)
                make.height.equalTo(SizeUtils.tableHeight)
                make.width.equalTo(self.viewWidth)
            }
            self.shuttle_bus_time_weekend.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
            if self.type == "arex" {
                self.shuttle_bus_time_weekday.text = "arex_time_note_1".localized
                self.shuttle_bus_time_weekend.text = "arex_time_note_2".localized
                
                self.shuttle_bus_time_weekday.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
                self.shuttle_bus_time_weekend.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
            }
            self.addSubview(self.shuttle_bus_time_weekend)
            self.shuttle_bus_time_weekend.snp.makeConstraints { (make) in
                make.top.equalTo(self.shuttle_bus_time_weekday.snp.bottom)
                make.leading.equalTo(self.hour.snp.trailing)
                make.height.equalTo(SizeUtils.tableHeight)
                make.width.equalTo(self.viewWidth)
            }
            self.min_weekday.textAlignment = .left
            self.min_weekend.textAlignment = .left
            self.min_same.textAlignment = .left
            self.addSubview(self.min_weekday)
            self.min_weekday.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.shuttle_bus_time_weekday.snp.trailing)
                make.height.equalTo(SizeUtils.tableHeight)
                make.width.equalTo(self.viewWidth * 4)
            }
            self.addSubview(self.min_weekend)
            self.min_weekend.snp.makeConstraints { (make) in
                make.top.equalTo(self.min_weekday.snp.bottom)
                make.leading.equalTo(self.shuttle_bus_time_weekday.snp.trailing)
                make.height.equalTo(SizeUtils.tableHeight)
                make.width.equalTo(self.viewWidth * 4)
            }
            
            self.min_same.backgroundColor = .white
            self.addSubview(self.min_same)
            self.min_same.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.shuttle_bus_time_weekday.snp.trailing)
                make.height.equalTo(SizeUtils.tableHeight * 2)
                make.width.equalTo(self.viewWidth * 4)
            }
        }
    }
    
    private var hour : UILabel = {
        let label = UILabel()
        return label
    }()
    private var shuttle_bus_time_weekday : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_time_weekday".localized
        return label
    }()
    private var shuttle_bus_time_weekend : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_time_weekend".localized
        return label
    }()
    
    private var min_weekday : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var min_weekend : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var min_same : UILabel = {
        let label = UILabel()
        return label
    }()
    
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
