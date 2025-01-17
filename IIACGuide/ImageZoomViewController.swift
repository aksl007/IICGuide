//
//  ImageZoomViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/11.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ImageZoomViewController: BaseViewController {
    
    var paramTitle: String = ""
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ImageZoomViewController.self))
        self.initUi()
    }
    
    private let scrollView : UIScrollView = {
          let scrollView = UIScrollView()
          return scrollView
      }()
    private let scrolled_image : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
}
extension ImageZoomViewController {
    func initUi(){
        self.setNavigationItemTitle(title: paramTitle)
        
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 10.0
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
       
        self.scrolled_image.image = image
        self.scrollView.addSubview(self.scrolled_image)
        self.scrolled_image.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(self.view.frame.width)
        }
    }
}
extension ImageZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.scrolled_image
    }
}
