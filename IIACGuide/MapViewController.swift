//
//  MapViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MapViewController: BaseViewController {
    
    var map: Map?

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MapViewController.self))
        self.initUi()
        
        self.setData()
    }
    
    private let mapImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
}
extension MapViewController {
    func initUi(){
        self.mapImage.isUserInteractionEnabled = true
        self.mapImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImage(_:))))
        self.view.addSubview(self.mapImage)
        self.mapImage.snp.makeConstraints { (make) in
            make.size.equalTo(self.view.frame.width)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset((-CommonUtils.getTopPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getBottomPadding())/2)
        }
    }
    
    func setData(){
        var imageUrl = self.map?.mapKoImageFileURL
        if CommonUtils.getLocaleId() == "en" {
            imageUrl = self.map?.mapEnImageFileURL
        }else if CommonUtils.getLocaleId() == "ja" {
            imageUrl = self.map?.mapJaImageFileURL
        }else if CommonUtils.getLocaleId() == "zh" {
            imageUrl = self.map?.mapZhImageFileURL
        }
        
        let url = URL(string: ServerUtils.REAL_URL + imageUrl!)
        self.mapImage.kf.setImage(with: url)
    }
}
extension MapViewController {
    @objc func tapImage(_ sender: UITapGestureRecognizer){
        let imageZoomVC = ImageZoomViewController()
        imageZoomVC.paramTitle = "slide_shop_sub_menu_2".localized
        imageZoomVC.image = (sender.view as! UIImageView).image
        self.navigationController?.pushViewController(imageZoomVC, animated: true)
    }
}
