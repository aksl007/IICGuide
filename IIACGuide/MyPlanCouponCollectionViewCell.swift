//
//  MyPlanCouponCollectionViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Kingfisher

class MyPlanCouponCollectionViewCell: UICollectionViewCell {
    
    var coupon : Coupon? {
        didSet {
            
            self.addSubview(self.couponImage)
            self.couponImage.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            if coupon?.logoFileURL ?? "" != "" {
                let url = URL(string: ServerUtils.REAL_URL + (coupon?.logoFileURL ?? ""))
                couponImage.kf.setImage(with: url)
            }
            
        }
    }
    private let couponImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "no_image1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
}
