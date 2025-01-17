//
//  MenuTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/07/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import SnapKit

class MenuTableViewCell: UITableViewCell{
    
    var row : Int?
    
    var menu : Menu? {
        didSet{
            menuImageView.image = menu?.icon
            menuTitle.text = menu?.title
            
            self.accessoryType = .none
            if(menu!.isSub){
                
                self.menuTitle.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
                self.menuImageView.snp.updateConstraints { (update) in
                    update.leading.equalToSuperview().offset(SizeUtils.sideMargin + 30)
                    update.width.height.equalTo(20)
                }
                
                self.icon_arrow_bottom.image = UIImage(named: "icon_arrow_right")

                self.icon_arrow_bottom.isHidden = false
            }else{
 
                
                self.menuTitle.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
                self.menuImageView.snp.updateConstraints { (update) in
                    update.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                    update.width.height.equalTo(30)
                }
                
                if self.row == 0 || self.row == 18 || self.row == 25 {
                    self.icon_arrow_bottom.isHidden = true
                }else{
                    self.icon_arrow_bottom.isHidden = false
                }
                
                self.icon_arrow_bottom.image = UIImage(named: "icon_arrow_bottom")

            }
        }
    }
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let menuTitle : UILabel = {
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
    
    private let icon_arrow_bottom : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_arrow_bottom")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(self.menuImageView)
        self.menuImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.height.equalTo(30)
        }
        
        addSubview(self.menuTitle)
        self.menuTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.menuImageView.snp.trailing).offset(SizeUtils.sideMargin)
        }
        
        addSubview(self.shadowView)
        self.shadowView.snp.makeConstraints { (make) in
            make.bottom.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.icon_arrow_bottom)
        self.icon_arrow_bottom.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
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
