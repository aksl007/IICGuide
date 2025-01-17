//
//  HomeMenuCollectionViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/07/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class HomeMenuCollectionViewCell: UICollectionViewCell {
    var homeMenu : HomeMenu? {
        didSet{
            menuImage.image = homeMenu?.icon
            menuImage.sizeToFit()
            menuLabel.text = homeMenu?.title
            menuLabel.sizeToFit()
        }
    }
    
    private let contentsView : UIView = {
        let view = UIView()
        
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightBackground)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = SizeUtils.radius
        
        return view
    }()
    
    private let menuImage : UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.sizeToFit()
        image.clipsToBounds = true
        return image
    }()
    
    private let menuLabel : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        self.contentsView.addSubview(self.menuImage)
        self.menuImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(frame.height / 2)
        }
        
        self.contentsView.addSubview(self.menuLabel)
        self.menuLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.menuImage.snp.trailing)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
