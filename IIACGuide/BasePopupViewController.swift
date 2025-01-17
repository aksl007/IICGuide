//
//  BasePopupViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/21.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class BasePopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.black, alphaValue: 0.5)
//        self.view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(closeThisPage)))
        self.view.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.height.lessThanOrEqualTo(self.view.frame.height * 7 / 10)
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.popupMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.popupMargin)
        }
    }

    public let contentsView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
}
extension BasePopupViewController {
    
    @objc func closeThisPage(){
        print("closeThisPage")
        self.dismiss(animated: false, completion: nil)
    }
}
