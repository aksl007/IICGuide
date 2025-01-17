//
//  ArrCongestionTableViewCell.swift
//  incheon
//
//  Created by 김진성 on 2020/08/31.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ArrCongestionTableViewCell: UITableViewCell {
    
    var width: CGFloat = 0.0
    
    var arrCongestionInfo : ArrCongestionInfo? {
        didSet{
            
            self.arr_congestion_section = self.makeCell(label: self.arr_congestion_section)
            self.arr_congestion_from = self.makeCell(label: self.arr_congestion_from)
            self.arr_congestion_sch_time = self.makeCell(label: self.arr_congestion_sch_time)
            self.arr_congestion_div_kor = self.makeCell(label: self.arr_congestion_div_kor)
            self.arr_congestion_div_for = self.makeCell(label: self.arr_congestion_div_for)
            self.arr_congestion_gate = self.makeCell(label: self.arr_congestion_gate)
            
            
            addSubview(self.arr_congestion_section)
            self.arr_congestion_section.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.width.equalTo((self.width - SizeUtils.sideMargin * 2) * 7 / 100)
                make.height.equalTo(SizeUtils.tableBigHeight)
                make.bottom.equalToSuperview()
            }
            addSubview(self.arr_congestion_from)
            self.arr_congestion_from.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.arr_congestion_section.snp.trailing)
                make.width.equalTo((self.width - SizeUtils.sideMargin * 2) * 24 / 100)
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.arr_congestion_sch_time)
            self.arr_congestion_sch_time.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.arr_congestion_from.snp.trailing)
                make.width.equalTo((self.width - SizeUtils.sideMargin * 2) * 24 / 100)
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.arr_congestion_div_kor)
            self.arr_congestion_div_kor.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.arr_congestion_sch_time.snp.trailing)
                make.width.equalTo((self.width - SizeUtils.sideMargin * 2) * 15 / 100)
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.arr_congestion_div_for)
            self.arr_congestion_div_for.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.arr_congestion_div_kor.snp.trailing)
                make.width.equalTo((self.width - SizeUtils.sideMargin * 2) * 15 / 100)
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            addSubview(self.arr_congestion_gate)
            self.arr_congestion_gate.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.arr_congestion_div_for.snp.trailing)
                make.width.equalTo((self.width - SizeUtils.sideMargin * 2) * 15 / 100)
                make.height.equalTo(SizeUtils.tableBigHeight)
            }
            
            self.arr_congestion_section.text = arrCongestionInfo?.zone
            self.arr_congestion_from.text = "\(arrCongestionInfo?.originIataCode ?? "")\n(\(arrCongestionInfo?.publicPID ?? ""))"
            self.arr_congestion_sch_time.text = "\(CommonUtils.convertToStringFromStringDate(inputString: arrCongestionInfo?.scheduledDateTime, inputFormat: "yyyyMMddkkmm", outputFormat: "kk:mm"))\n\(CommonUtils.convertToStringFromStringDate(inputString: arrCongestionInfo?.estimatedDateTime, inputFormat: "yyyyMMddkkmm", outputFormat: "(kk:mm)"))"
            var koreanCount = (arrCongestionInfo?.koreanTotalCount ?? 0) - (arrCongestionInfo?.koreanJudgeCount ?? 0)
            
            if koreanCount < 0 {
                koreanCount = 0
            }
            self.arr_congestion_div_kor.text = "\(koreanCount)"
            
            var foreignerCount = (arrCongestionInfo?.foreignerTotalCount ?? 0) - (arrCongestionInfo?.foreignerJudgeCount ?? 0)
            
            if foreignerCount < 0 {
                foreignerCount = 0
            }
            
            self.arr_congestion_div_for.text = "\(foreignerCount)"
            
            self.arr_congestion_gate.text = arrCongestionInfo?.gate
        }
    }
    
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }
    
    private var arr_congestion_section : UILabel = {
        let label = UILabel()
        return label
    }()
    private var arr_congestion_from : UILabel = {
        let label = UILabel()
        return label
    }()
    private var arr_congestion_sch_time : UILabel = {
        let label = UILabel()
        return label
    }()
    private var arr_congestion_div_kor : UILabel = {
        let label = UILabel()
        return label
    }()
    private var arr_congestion_div_for : UILabel = {
        let label = UILabel()
        return label
    }()
    private var arr_congestion_gate : UILabel = {
        let label = UILabel()
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
