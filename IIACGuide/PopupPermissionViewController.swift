//
//  PopupPermissionViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/10/05.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PopupPermissionViewController: BasePopupViewController {
    
    weak var delegate : HomeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PopupPermissionViewController.self))
        self.initUi()
    }

    private let security_en : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "security_en")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let popupConfirmButtonLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let popupConfirmButton : UIButton = {
        let button = UIButton()
        button.setTitle("common_confirm".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white).cgColor
        
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
}
extension PopupPermissionViewController{
    func initUi(){
        
        self.contentsView.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.popupMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.popupMargin)
        }
        self.security_en.image = UIImage(named: "security_\(CommonUtils.getLocaleId())")
        self.contentsView.addSubview(self.security_en)
        self.security_en.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo((self.view.frame.width - SizeUtils.popupMargin * 2) * 1760 / 1080)
        }
        self.contentsView.addSubview(self.popupConfirmButtonLineView)
        self.popupConfirmButtonLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.security_en.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.popupConfirmButton.addTarget(self, action: #selector(confirmPermisstion), for: .touchUpInside)
        self.contentsView.addSubview(self.popupConfirmButton)
        self.popupConfirmButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupConfirmButtonLineView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(SizeUtils.buttonHeight)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func confirmPermisstion(){
        self.dismiss(animated: true) {
            self.delegate?.openNoticePopup()
        }
        
    }
}
