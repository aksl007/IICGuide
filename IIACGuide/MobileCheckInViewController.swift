//
//  MobileCheckInViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MobileCheckInViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MobileCheckInViewController.self))
        self.initUi()
    }

    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    private let departure_checkin_mobile_checkin_sub_title_1: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_sub_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_checkin_mobile_checkin_sub_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_sub_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_checkin_mobile_checkin_info_1: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_info_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()

    private let departure_checkin_mobile_checkin_info_1_arrow_image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "box_arrow_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_checkin_mobile_checkin_info_2: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_info_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()

    private let departure_checkin_mobile_checkin_info_2_arrow_image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "box_arrow_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_checkin_mobile_checkin_info_3: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_info_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()

    private let departure_checkin_mobile_checkin_info_3_arrow_image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "box_arrow_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_checkin_mobile_checkin_info_4: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_info_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .semibold)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()

    private let departure_checkin_mobile_checkin_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_checkin_mobile_checkin_link_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_checkin_mobile_checkin_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_mobile_checkin_link_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let departure_checkin_mobile_checkin_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_mobile_checkin_link_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let departure_checkin_mobile_checkin_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_mobile_checkin_link_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let departure_checkin_mobile_checkin_link_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_mobile_checkin_link_5 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_link_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let departure_checkin_mobile_checkin_link_5_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_mobile_checkin_link_6 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_mobile_checkin_link_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let departure_checkin_mobile_checkin_link_6_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
}
extension MobileCheckInViewController{
    func initUi(){
        self.setNavigationItemTitle(title: "departure_checkin_section_title_3".localized)
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_sub_title_1)
        self.departure_checkin_mobile_checkin_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_sub_desc_1)
        self.departure_checkin_mobile_checkin_sub_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_1)
        self.departure_checkin_mobile_checkin_info_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_sub_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_1_arrow_image)
        self.departure_checkin_mobile_checkin_info_1_arrow_image.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_2)
        self.departure_checkin_mobile_checkin_info_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_1_arrow_image.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_2_arrow_image)
        self.departure_checkin_mobile_checkin_info_2_arrow_image.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_3)
        self.departure_checkin_mobile_checkin_info_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_2_arrow_image.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_3_arrow_image)
        self.departure_checkin_mobile_checkin_info_3_arrow_image.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_info_4)
        self.departure_checkin_mobile_checkin_info_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_3_arrow_image.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.departure_checkin_mobile_checkin_link_1.isUserInteractionEnabled = true
        self.departure_checkin_mobile_checkin_link_2.isUserInteractionEnabled = true
        self.departure_checkin_mobile_checkin_link_3.isUserInteractionEnabled = true
        self.departure_checkin_mobile_checkin_link_4.isUserInteractionEnabled = true
        self.departure_checkin_mobile_checkin_link_5.isUserInteractionEnabled = true
        self.departure_checkin_mobile_checkin_link_6.isUserInteractionEnabled = true
        
        self.departure_checkin_mobile_checkin_link_1.tag = 0
        self.departure_checkin_mobile_checkin_link_2.tag = 1
        self.departure_checkin_mobile_checkin_link_3.tag = 2
        self.departure_checkin_mobile_checkin_link_4.tag = 3
        self.departure_checkin_mobile_checkin_link_5.tag = 4
        self.departure_checkin_mobile_checkin_link_6.tag = 5
        
        self.departure_checkin_mobile_checkin_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMobileCheckIn(_:))))
        self.departure_checkin_mobile_checkin_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMobileCheckIn(_:))))
        self.departure_checkin_mobile_checkin_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMobileCheckIn(_:))))
        self.departure_checkin_mobile_checkin_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMobileCheckIn(_:))))
        self.departure_checkin_mobile_checkin_link_5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMobileCheckIn(_:))))
        self.departure_checkin_mobile_checkin_link_6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMobileCheckIn(_:))))
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_1_start_line_view)
        self.departure_checkin_mobile_checkin_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_info_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_1)
        self.departure_checkin_mobile_checkin_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_mobile_checkin_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_1_line_view)
        self.departure_checkin_mobile_checkin_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_2)
        self.departure_checkin_mobile_checkin_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_mobile_checkin_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_2_line_view)
        self.departure_checkin_mobile_checkin_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_3)
        self.departure_checkin_mobile_checkin_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_mobile_checkin_link_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_3_line_view)
        self.departure_checkin_mobile_checkin_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_4)
        self.departure_checkin_mobile_checkin_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_mobile_checkin_link_4.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_4_line_view)
        self.departure_checkin_mobile_checkin_link_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_5)
        self.departure_checkin_mobile_checkin_link_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_mobile_checkin_link_5.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_5_line_view)
        self.departure_checkin_mobile_checkin_link_5_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_6)
        self.departure_checkin_mobile_checkin_link_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_5_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_mobile_checkin_link_6.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_mobile_checkin_link_6_line_view)
        self.departure_checkin_mobile_checkin_link_6_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_mobile_checkin_link_6.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension MobileCheckInViewController{
    @objc func tapMobileCheckIn(_ sender: UITapGestureRecognizer){
        
        let baseUrl = "itms-apps://itunes.apple.com/app/"
        
        var appId = "id369188136"
        
        if sender.view?.tag == 1 {
            appId = "id373932237"
        }else if sender.view?.tag == 2 {
            appId = "id669960328"
        }else if sender.view?.tag == 3 {
            appId = "id373053637"
        }else if sender.view?.tag == 4 {
            appId = "id564901451"
        }else if sender.view?.tag == 5 {
            appId = "id435624636"
        }
        
        if let url = URL(string: "\(baseUrl)\(appId)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(url)
                
            }
        }
    }
}
