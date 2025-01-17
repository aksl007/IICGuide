//
//  MenuHeaderChildCollectionViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/07/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MenuHeaderChildCollectionViewCell: UICollectionViewCell {
    
    var menu : Menu? {
        didSet{
            menuImage.image = menu?.icon
            menuLabel.text = menu?.title
        }
    }
    
    private let menuImage : UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let menuLabel : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(self.menuImage)
        self.menuImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.width.height.equalTo(50)
        }
        
        addSubview(self.menuLabel)
        self.menuLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.menuImage.snp.bottom).offset(5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
