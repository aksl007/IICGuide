//
//  PopupListTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/08/21.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PopupListTableViewCell: UITableViewCell{
    
    var row : Int = 0
    var listIamge : UIImage?
    var string : String = "" {
        didSet {
            
            if self.listIamge != nil {
                self.listIamgeView.image = listIamge
                self.listIamgeView.isHidden = false
                self.listIamgeView.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    make.size.equalTo(SizeUtils.iconSize)
                }
            }else {
                self.listIamgeView.isHidden = true
                self.listIamgeView.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    make.size.equalTo(0)
                }
            }
            
            self.contents.text = string
            if row % 2 == 1 {
                backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
            }else{
                backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
            }
        }
    }
    
    private let listIamgeView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let contents : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.sizeToFit()
        return label
    }()
    
    private let shadowView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(self.listIamgeView)
        self.listIamgeView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        addSubview(self.contents)
        self.contents.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.listIamgeView.snp.trailing).offset(SizeUtils.sideMargin)
        }
        
        addSubview(self.shadowView)
        self.shadowView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
