//
//  NoticeTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {
    
    var viewWidth: CGFloat?
    var notice: Notice?{
        didSet{
            
            self.notice_title.text = CommonUtils.getLocaleString(locale: self.notice?.title)
            self.notice_date.text = CommonUtils.convertToStringFromStringDate(inputString: self.notice?.startDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy-MM-dd")
            
            self.addSubview(self.icon_arrow_right)
            self.icon_arrow_right.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            self.addSubview(self.contents_view)
            self.contents_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalTo(self.icon_arrow_right.snp.leading).offset(-SizeUtils.sideMargin)
                make.leading.equalToSuperview()
            }
            
            self.contents_view.addSubview(self.notice_title)
            self.notice_title.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview()
            }
            
            self.contents_view.addSubview(self.notice_date)
            self.notice_date.snp.makeConstraints { (make) in
                make.top.equalTo(self.notice_title.snp.bottom).offset(3)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            self.addSubview(self.end_view)
            self.end_view.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
    
    private let contents_view: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let notice_title : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let notice_date : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
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
    
    private let end_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
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
