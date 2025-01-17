//
//  ProhibitedItemViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ProhibitedItemViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ProhibitedItemViewController.self))
        self.initUi()
        
        if !CommonUtils.isKorean() {
            self.setNavigationItemTitle(title: "prohibited_item".localized)
            self.prohibited_item_btn_title.isHidden = true
            self.prohibited_item_btn_title.snp.remakeConstraints { (make) in
                make.top.equalTo(self.prohibited_item_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
        }
    }
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let icon_speaker : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_speaker")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let prohibited_item_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let prohibited_item_btn_title : UIButton = {
        let button = UIButton()
        button.setTitle("prohibited_item_btn_title".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let prohibited_item_title_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_boarder_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.sizeToFit()
        return view
    }()
    
    private let prohibited_item_title_1_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let prohibited_item_title_1_desc_1_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_1_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_desc_1_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_1_desc_1_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_desc_1_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_1_3".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_desc_1_3_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_1_desc_1_4 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_1_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let prohibited_item_title_1_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_desc_2_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_2_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_desc_2_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_1_desc_2_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_2_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let prohibited_item_title_1_desc_2_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_2_3".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_1_desc_2_3_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_1_desc_2_4 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_1_desc_2_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let prohibited_item_title_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_boarder_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.sizeToFit()
        return view
    }()
    
    private let prohibited_item_title_2_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_1_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_1_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_1_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_no")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let prohibited_item_title_2_desc_1_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_1_2".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_1_2_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_2_desc_1_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_1_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let prohibited_item_title_2_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_2_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_2_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_2_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_no")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let prohibited_item_title_2_desc_2_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_2_2".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_2_2_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_2_desc_2_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_2_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    private let prohibited_item_title_2_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_3_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_3_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_3_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_no")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let prohibited_item_title_2_desc_3_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_2_desc_3_2".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_2_desc_3_2_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    
    private let prohibited_item_title_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_3_boarder_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.sizeToFit()
        return view
    }()

    private let prohibited_item_title_3_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let prohibited_item_title_3_desc_1_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_1_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_3_desc_1_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_ok")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_3_desc_1_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let prohibited_item_title_3_desc_1_3 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_1_3".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_3_desc_1_3_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_no")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let prohibited_item_title_3_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let prohibited_item_title_3_desc_2_1 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_2_1".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_3_desc_2_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_no")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let prohibited_item_title_3_desc_2_2 : UILabel = {
        let label = UILabel()
        label.text = "prohibited_item_title_3_desc_2_2".localized.getDescription
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let prohibited_item_title_3_desc_2_2_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_no")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
}
extension ProhibitedItemViewController {
    func initUi(){
        
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
        self.contentsView.addSubview(self.icon_speaker)
        self.icon_speaker.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.contentsView.addSubview(self.prohibited_item_desc_1)
        self.prohibited_item_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.icon_speaker.snp.top)
            make.leading.equalTo(self.icon_speaker.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_btn_title.addTarget(self, action: #selector(moveAvsc), for: .touchUpInside)
        self.contentsView.addSubview(self.prohibited_item_btn_title)
        self.prohibited_item_btn_title.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.contentsView.addSubview(self.prohibited_item_title_1)
        self.prohibited_item_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_btn_title.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.prohibited_item_title_1_boarder_view)
        self.prohibited_item_title_1_boarder_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1)
        self.prohibited_item_title_1_desc_1.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1_1)
        self.prohibited_item_title_1_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1_1_image)
        self.prohibited_item_title_1_desc_1_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_1_desc_1_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1_2)
        self.prohibited_item_title_1_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1_3)
        self.prohibited_item_title_1_desc_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1_3_image)
        self.prohibited_item_title_1_desc_1_3_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_1_desc_1_3)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_1_4)
        self.prohibited_item_title_1_desc_1_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_1_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2)
        self.prohibited_item_title_1_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_1_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2_1)
        self.prohibited_item_title_1_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2_1_image)
        self.prohibited_item_title_1_desc_2_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_1_desc_2_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2_2)
        self.prohibited_item_title_1_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2_3)
        self.prohibited_item_title_1_desc_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2_3_image)
        self.prohibited_item_title_1_desc_2_3_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_1_desc_2_3)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_1_boarder_view.addSubview(self.prohibited_item_title_1_desc_2_4)
        self.prohibited_item_title_1_desc_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_desc_2_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalToSuperview().offset(-SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.prohibited_item_title_2)
        self.prohibited_item_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_1_boarder_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.prohibited_item_title_2_boarder_view)
        self.prohibited_item_title_2_boarder_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_1)
        self.prohibited_item_title_2_desc_1.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_1_1)
        self.prohibited_item_title_2_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_1_1_image)
        self.prohibited_item_title_2_desc_1_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_2_desc_1_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_1_2)
        self.prohibited_item_title_2_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_1_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_1_2_image)
        self.prohibited_item_title_2_desc_1_2_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_2_desc_1_2)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_1_3)
        self.prohibited_item_title_2_desc_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_2)
        self.prohibited_item_title_2_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_1_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_2_1)
        self.prohibited_item_title_2_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_2_1_image)
        self.prohibited_item_title_2_desc_2_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_2_desc_2_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_2_2)
        self.prohibited_item_title_2_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_2_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_2_2_image)
        self.prohibited_item_title_2_desc_2_2_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_2_desc_2_2)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_2_3)
        self.prohibited_item_title_2_desc_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_3)
        self.prohibited_item_title_2_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_2_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_3_1)
        self.prohibited_item_title_2_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_3_1_image)
        self.prohibited_item_title_2_desc_3_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_2_desc_3_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_3_2)
        self.prohibited_item_title_2_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_desc_3_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_2_boarder_view.addSubview(self.prohibited_item_title_2_desc_3_2_image)
        self.prohibited_item_title_2_desc_3_2_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_2_desc_3_2)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            
            make.bottom.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        
        self.contentsView.addSubview(self.prohibited_item_title_3)
        self.prohibited_item_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_2_boarder_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.prohibited_item_title_3_boarder_view)
        self.prohibited_item_title_3_boarder_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_1)
        self.prohibited_item_title_3_desc_1.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_1_1)
        self.prohibited_item_title_3_desc_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_1_1_image)
        self.prohibited_item_title_3_desc_1_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_3_desc_1_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_1_2)
        self.prohibited_item_title_3_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3_desc_1_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_1_3)
        self.prohibited_item_title_3_desc_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3_desc_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_1_3_image)
        self.prohibited_item_title_3_desc_1_3_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_3_desc_1_3)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_2)
        self.prohibited_item_title_3_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3_desc_1_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_2_1)
        self.prohibited_item_title_3_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_2_1_image)
        self.prohibited_item_title_3_desc_2_1_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_3_desc_2_1)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_2_2)
        self.prohibited_item_title_3_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.prohibited_item_title_3_desc_2_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.prohibited_item_title_3_boarder_view.addSubview(self.prohibited_item_title_3_desc_2_2_image)
        self.prohibited_item_title_3_desc_2_2_image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.prohibited_item_title_3_desc_2_2)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            
            
            make.bottom.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
    }
}
extension ProhibitedItemViewController {
    @objc func moveAvsc(){
        
        self.openWebView(title: "home_drag_menu_7".localized, url: ServerUtils.URL_AVSC)
    }
}
