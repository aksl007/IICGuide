//
//  SearchTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var viewWidth: CGFloat = 0.0
    
    var showSearch: ShowSearchList? {
        didSet {
            self.tv_total_search_list_title.text = "search_category_\(self.showSearch?.code ?? "10")".localized
            self.tv_total_search_list_count.text = String(self.showSearch?.count ?? 0)
            
            self.addSubview(self.icon_arrow_right)
            self.icon_arrow_right.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
                make.centerY.equalToSuperview()
            }
            self.addSubview(self.tv_total_search_list_count)
            self.tv_total_search_list_count.snp.makeConstraints { (make) in
                make.trailing.equalTo(self.icon_arrow_right.snp.leading).offset(-SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
            }
            
            self.addSubview(self.tv_total_search_list_title)
            self.tv_total_search_list_title.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(self.viewWidth * 0.7)
                make.centerY.equalToSuperview()
            }
            
            self.addSubview(self.line_view)
            self.line_view.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
    
    private let tv_total_search_list_title : UILabel = {
        let label = UILabel()
        label.text = "테스트"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let tv_total_search_list_count : UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let icon_arrow_right : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_arrow_right")
        imageView.contentMode = .scaleAspectFit
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
