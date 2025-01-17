//
//  PopupNoticeCollectionViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PopupNoticeCollectionViewCell: UICollectionViewCell {
    
    var imageUrl: String = "" {
        didSet{
            
            if imageUrl  != "" {
                let url = URL(string: ServerUtils.REAL_URL + imageUrl)
                notice_image.kf.setImage(with: url)
            }
            
            self.addSubview(self.notice_image)
            self.notice_image.snp.makeConstraints { (make) in
                make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
        }
    }
    
    private let notice_image : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
}
