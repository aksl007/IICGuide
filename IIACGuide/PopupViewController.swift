//
//  PopupViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PopupViewController: BasePopupViewController {

    var popupTitle = ""
    var popupContents = ""
    var completion: (() -> Swift.Void)? = nil
    
    var isTwoButton = false
    var isNoti = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PopupViewController.self))
        self.initUi()
    }
    
    private let popupTitleLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        label.sizeToFit()
        return label
    }()
    private let popupContentsLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    private let popupContentsLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white).cgColor
        label.sizeToFit()
        return label
    }()
    
    private let popupCloseButtonLineView: UIView = {
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
    
    private let popupConfirmButtonLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let popupCloseButton : UIButton = {
        let button = UIButton()
        button.setTitle("common_close".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white).cgColor
        
        return button
    }()
    
}
extension PopupViewController {
    func initUi(){

        self.popupTitleLabel.text = popupTitle
        self.contentsView.addSubview(self.popupTitleLabel)
        self.popupTitleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }

        self.contentsView.addSubview(self.popupContentsLabelView)
        self.popupContentsLabelView.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupTitleLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.popupContentsLabel.text = popupContents
        self.popupContentsLabelView.addSubview(self.popupContentsLabel)
        self.popupContentsLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.verticalMargin)
        }
        
        self.contentsView.addSubview(self.popupCloseButtonLineView)
        self.popupCloseButtonLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupContentsLabelView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        
        self.popupConfirmButton.addTarget(self, action: #selector(closePopupWithCompletion), for: .touchUpInside)
        
        
        if self.isTwoButton {
            
            self.popupCloseButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
            
            self.contentsView.addSubview(self.popupConfirmButtonLineView)
            self.popupConfirmButtonLineView.snp.makeConstraints { (make) in
                make.top.equalTo(self.popupCloseButtonLineView.snp.bottom)
                make.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(SizeUtils.buttonHeight)
                make.width.equalTo(1)
            }
            self.contentsView.addSubview(self.popupCloseButton)
            self.popupCloseButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.popupCloseButtonLineView.snp.bottom)
                make.leading.bottom.equalToSuperview()
                make.trailing.equalTo(self.popupConfirmButtonLineView.snp.leading)
                make.height.equalTo(SizeUtils.buttonHeight)
            }
            
            if isNoti {
                self.popupConfirmButton.setTitle("push_popup_flight_detail".localized, for: .normal) 
            }
            self.contentsView.addSubview(self.popupConfirmButton)
            self.popupConfirmButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.popupCloseButtonLineView.snp.bottom)
                make.trailing.bottom.equalToSuperview()
                make.leading.equalTo(self.popupConfirmButtonLineView.snp.trailing)
                make.height.equalTo(SizeUtils.buttonHeight)
            }
            
        }else{
            self.contentsView.addSubview(self.popupConfirmButton)
            self.popupConfirmButton.snp.makeConstraints { (make) in
                make.top.equalTo(self.popupCloseButtonLineView.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(SizeUtils.buttonHeight)
            }
        }
        
    }
}
extension PopupViewController {
    @objc func closePopupWithCompletion(){
        print("close")
        self.dismiss(animated: false, completion: self.completion)
    }
    @objc func closePopup(){
        print("close")
        self.dismiss(animated: false, completion: nil)
    }
}
