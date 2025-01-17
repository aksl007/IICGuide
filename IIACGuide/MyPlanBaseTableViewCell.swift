//
//  MyPlanBaseTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/22.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanBaseTableViewCell: UITableViewCell {
    
    weak var delegate: MyPlanViewController?
    
    var viewWidth: CGFloat = 0.0 {
        didSet{
            
            self.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
            
            self.addSubview(self.myplan_icon_dep_01)
            self.myplan_icon_dep_01.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.sideMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSize)
            }
            self.addSubview(self.myplan_passenger_dep_con_title_1)
            self.myplan_passenger_dep_con_title_1.snp.makeConstraints { (make) in
                make.leading.equalTo(self.myplan_icon_dep_01.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.myplan_icon_dep_01)
            }
            
            self.addSubview(self.dot_line_view)
            self.dot_line_view.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.myplan_icon_dep_01)
                make.top.equalTo(self.myplan_icon_dep_01.snp.bottom)
                make.bottom.equalToSuperview()
                make.width.equalTo(7)
            }
            
            self.addSubview(self.myplan_icon_bullet)
            self.myplan_icon_bullet.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.dot_line_view)
                make.top.equalTo(self.myplan_icon_dep_01.snp.bottom).offset(SizeUtils.topMargin * 3)
            }
            self.addSubview(self.myplan_speech_bubble_tail)
            self.myplan_speech_bubble_tail.snp.makeConstraints { (make) in
                make.leading.equalTo(self.dot_line_view.snp.centerX)
                make.bottom.equalTo(self.myplan_icon_bullet.snp.top)
            }
            
            self.addSubview(self.white_background_view)
            self.white_background_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_title_1.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.equalTo(self.myplan_speech_bubble_tail.snp.trailing)
                make.trailing.bottom.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
        }
    }
    
    
    public let myplan_icon_dep_01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_icon_dep_01")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        imageView.layer.cornerRadius = SizeUtils.iconSize / 2
        imageView.sizeToFit()
        return imageView
    }()
    
    public let myplan_passenger_dep_con_title_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_title_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    public let dot_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "myplan_bg_dot")!)
        return view
    }()
    
    public let myplan_icon_bullet : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_icon_bullet")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    public let myplan_speech_bubble_tail : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_speech_bubble_tail")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    public let white_background_view : UIView = {
        let view = UIView()
        view.backgroundColor = .white
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
