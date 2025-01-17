//
//  CouponDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class CouponDetailViewController: BaseViewController {
    
    var coupon : Coupon?

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: CouponDetailViewController.self))
        self.initUi()
        self.setData()
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    private let coupon_bg : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coupon_bg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let logo_image : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let info_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let info_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let info_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let name_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let location_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let date_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let coupon_detail_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "coupon_detail_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let coupon_detail_section_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "coupon_detail_section_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_coupon_detail_discount : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_coupon_detail_description : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let coupon_detail_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "coupon_detail_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let tv_coupon_detail_desc_end_date : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let coupon_detail_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "coupon_detail_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let coupon_detail_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "coupon_detail_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let coupon_detail_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "coupon_detail_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let coupon_detail_section_desc_3_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "coupon_detail_section_desc_3_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let coupon_detail_section_desc_3_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "coupon_detail_section_desc_3_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let coupon_detail_section_desc_3_5 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "coupon_detail_section_desc_3_5".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let coupon_detail_section_title_4: UILabel = {
        let label = UILabel()
        label.text = "coupon_detail_section_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let ll_coupon_desc_target : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
}
extension CouponDetailViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "home_drag_menu_12".localized)
        
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
        
        self.contentsView.addSubview(self.coupon_bg)
        self.coupon_bg.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        
        self.coupon_bg.addSubview(self.logo_image)
        self.logo_image.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo((self.view.frame.width * 2 / 3) * 2 / 3)
        }
    
        self.coupon_bg.addSubview(self.info_view)
        self.info_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.logo_image.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.trailing.equalToSuperview()
            
            make.bottom.equalToSuperview()
        }
        self.info_view.addSubview(self.info_start_line_view)
        self.info_start_line_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.info_view.addSubview(self.info_end_line_view)
        self.info_end_line_view.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.info_view.addSubview(self.name_label)
        self.name_label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.info_view.addSubview(self.location_label)
        self.location_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.name_label.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.info_view.addSubview(self.date_label)
        self.date_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.location_label.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.coupon_detail_section_title_1)
        self.coupon_detail_section_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_bg.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
        }
        self.contentsView.addSubview(self.coupon_detail_section_desc_1)
        self.coupon_detail_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.tv_coupon_detail_discount)
        self.tv_coupon_detail_discount.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.tv_coupon_detail_description)
        self.tv_coupon_detail_description.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_coupon_detail_discount.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.coupon_detail_section_title_2)
        self.coupon_detail_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_coupon_detail_description.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
        }
        self.contentsView.addSubview(self.tv_coupon_detail_desc_end_date)
        self.tv_coupon_detail_desc_end_date.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.coupon_detail_section_title_3)
        self.coupon_detail_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_coupon_detail_desc_end_date.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
        }
        self.contentsView.addSubview(self.coupon_detail_section_desc_3_1)
        self.coupon_detail_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.coupon_detail_section_desc_3_2)
        self.coupon_detail_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_desc_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.coupon_detail_section_desc_3_3)
        self.coupon_detail_section_desc_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_desc_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.coupon_detail_section_desc_3_4)
        self.coupon_detail_section_desc_3_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_desc_3_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.coupon_detail_section_desc_3_5)
        self.coupon_detail_section_desc_3_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_desc_3_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.coupon_detail_section_title_4)
        self.coupon_detail_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_desc_3_5.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.ll_coupon_desc_target)
        self.ll_coupon_desc_target.snp.makeConstraints { (make) in
            make.top.equalTo(self.coupon_detail_section_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
    }
    
    func setData(){
        if coupon?.logoFileURL ?? "" != "" {
            let url = URL(string: ServerUtils.REAL_URL + (coupon?.logoFileURL ?? ""))
            logo_image.kf.setImage(with: url)
        }
        
        self.name_label.text = CommonUtils.getLocaleString(locale: coupon?.name)
        self.location_label.text = "coupon_list_publisher".localized
        let endDate = String(format: "coupon_list_end_date".localized, CommonUtils.convertToStringFromStringDate(inputString: self.coupon!.endDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy.MM.dd") )
        self.date_label.text = endDate
        self.tv_coupon_detail_desc_end_date.text = endDate
        
        
        var currency = "$"
        var minCurrency = "$"
        var discount = ""
        if self.coupon!.discountBoundary?.currency == "KRW" {
            currency = "￦"
        }
        if self.coupon!.discountBoundary?.minCurrency == "KRW" {
            minCurrency = "￦"
        }
        
        if self.coupon!.discountBoundary?.discountUnit == "Amount" {
            if self.coupon!.discountBoundary!.discountValue > 0 && self.coupon!.discountBoundary?.minPurchaseAmount == 0 {
                discount += String(format: "coupon_detail_section_desc_amount_3".localized, currency, "\(self.coupon!.discountBoundary?.discountValue ?? 0)".convertToDecimalNumber)
            }else if self.coupon!.discountBoundary!.discountValue == 0 && self.coupon!.discountBoundary!.minPurchaseAmount > 0 {
                discount += String(format: "coupon_detail_section_desc_amount_2".localized, minCurrency, "\(self.coupon!.discountBoundary?.minPurchaseAmount ?? 0)".convertToDecimalNumber)
            }else {
                discount += String(format: "coupon_detail_section_desc_amount_1".localized, minCurrency, "\(self.coupon!.discountBoundary?.minPurchaseAmount ?? 0)".convertToDecimalNumber, currency, "\(self.coupon!.discountBoundary?.discountValue ?? 0)".convertToDecimalNumber)
            }
        }else {
            if self.coupon!.discountBoundary!.discountValue > 0 && self.coupon!.discountBoundary?.maxDiscountAmount == 0 {
                discount += String(format: "coupon_detail_section_desc_percent_2".localized, "\(self.coupon!.discountBoundary?.discountValue ?? 0)".convertToDecimalNumber)
            }else if self.coupon!.discountBoundary!.discountValue == 0 && self.coupon!.discountBoundary!.maxDiscountAmount > 0 {
                discount += String(format: "coupon_detail_section_desc_percent_3".localized, currency, "\(self.coupon!.discountBoundary?.maxDiscountAmount ?? 0)".convertToDecimalNumber)
            }else {
                discount += String(format: "coupon_detail_section_desc_percent_1".localized, "\(self.coupon!.discountBoundary?.discountValue ?? 0)".convertToDecimalNumber, currency, "\(self.coupon!.discountBoundary?.maxDiscountAmount ?? 0)".convertToDecimalNumber)
            }
        }
        
        self.tv_coupon_detail_discount.text = discount
        
        self.tv_coupon_detail_description.text = CommonUtils.getLocaleString(locale: coupon?.datumDescription)
        
        if self.coupon?.campaignType == "General" {
            self.coupon_detail_section_desc_3_1.isHidden = true
            self.coupon_detail_section_desc_3_1.snp.makeConstraints { (make) in
                make.top.equalTo(self.coupon_detail_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
        }
        
        let campaignTarget = Array(self.realm.objects(CampaignTarget.self).filter(NSPredicate(format: "campaignId == %@", self.coupon?.campaignID as! CVarArg)))
       
        
        
        //쿠폰 target 데이터 확인
        var targetString = ""
        if campaignTarget.count > 0 {
            for target in campaignTarget {
                targetString += "\(CommonUtils.getLocaleString(locale: target.targetName).getDescription)\n (\(CommonUtils.getLocaleString(locale: target.locationDescription)))\n"
            }

            self.ll_coupon_desc_target.text = targetString

        }

    }
}
