//
//  AirlineAssignTableViewCell.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirlineAssignTableViewCell: UITableViewCell {
    
    var airlineAssign: AirlineAssign? {
        didSet {
            
            self.airline1.text = airlineAssign?.airline1
            self.airlineCode1.text = airlineAssign?.airlineCode1
            
            if airlineAssign?.airline2 != nil && airlineAssign?.airline2 != "" {
                self.airline2.text = airlineAssign?.airline2
                self.airlineCode2.text = airlineAssign?.airlineCode2
            }else {
                self.airline2.text = ""
                self.airlineCode2.text = ""
            }
            
            self.addSubview(self.mid_line_view)
            self.mid_line_view.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
                make.width.equalTo(1)
            }
            
            self.addSubview(self.end_line_view)
            self.end_line_view.snp.makeConstraints { (make) in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
            
            self.addSubview(self.airlineCode1)
            self.airlineCode1.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalTo(self.mid_line_view.snp.leading).offset(-SizeUtils.sideMargin)
            }
            
            self.addSubview(self.airline1)
            self.airline1.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview().dividedBy(2).offset(-SizeUtils.sideMargin)
            }
            
            self.addSubview(self.airlineCode2)
            self.airlineCode2.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.addSubview(self.airline2)
            self.airline2.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview().multipliedBy(1.5).offset(-SizeUtils.sideMargin)
            }
        }
    }
    
    private let end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let mid_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let airline1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let airlineCode1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let airline2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let airlineCode2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
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
