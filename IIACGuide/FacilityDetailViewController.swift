//
//  FacilityDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/16.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Kingfisher

class FacilityDetailViewController: BaseViewController {
    
    var paramType = ""
    var facility : Facility?
    var coupon : Coupon?
    
    var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FacilityDetailViewController.self))
        self.initUi()
        self.setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let favoriteData =  self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "usid == %@", self.facility?.usid as! CVarArg))
        if favoriteData.count > 0 {
            self.isFavorite = true
            self.facility_detail_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_star")!)
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
    
    private let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "no_image1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let ll_facility_coupon : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let ll_facility_coupon_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "no_image1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let tv_facility_coupon_title : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_facility_coupon_discount : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_facility_coupon_date : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let facility_name : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText).cgColor
        label.sizeToFit()
        return label
    }()

    private let ll_facility_detail_info_1 : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let facility_detail_loc : UILabel = {
        let label = UILabel()
        label.text = "facility_detail_loc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let facility_detail_loc_v_line : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let facility_detail_loc_result : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    private let ll_facility_detail_info_2 : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let facility_detail_item : UILabel = {
        let label = UILabel()
        label.text = "facility_detail_item".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let facility_detail_item_v_line : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let facility_detail_item_result : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let ll_facility_detail_info_3 : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let facility_detail_open : UILabel = {
        let label = UILabel()
        label.text = "facility_detail_open".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let facility_detail_open_v_line : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let facility_detail_open_result : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let tv_facility_detail_desc_line : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let tv_facility_detail_desc : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let facility_detail_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let facility_detail_link_1 : UILabel = {
        let label = UILabel()
        label.text = "facility_detail_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let facility_detail_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let facility_detail_link_2 : UILabel = {
        let label = UILabel()
        label.text = "facility_detail_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let facility_detail_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let facility_detail_link_3 : UILabel = {
        let label = UILabel()
        label.text = "facility_detail_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let facility_detail_link_3_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
}
extension FacilityDetailViewController {
    func initUi(){
        
        if self.paramType == "shopping" {
            self.setNavigationItemTitle(title: "slide_shop_sub_menu_0".localized)
        }else if self.paramType == "food" {
            self.setNavigationItemTitle(title: "slide_shop_sub_menu_1".localized)
        }else if self.paramType == "rest" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_0".localized)
        }else if self.paramType == "medical" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_1".localized)
        }else if self.paramType == "finance" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_2".localized)
        }else if self.paramType == "other" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_3".localized)
        }else if self.paramType == "immigration" {
            self.setNavigationItemTitle(title: "slide_airport_guide_sub_menu_3".localized)
        }else if self.paramType != "" {
            self.setNavigationItemTitle(title: self.paramType)
        }else {
            self.setNavigationItemTitle(title: "home_bottom_menu_4".localized)
        }
        
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
        
        self.contentsView.addSubview(self.logoImage)
        self.logoImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(250)
        }
        
        self.ll_facility_coupon.isUserInteractionEnabled = true
        self.ll_facility_coupon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveCouponDetail)))
        self.contentsView.addSubview(self.ll_facility_coupon)
        self.ll_facility_coupon.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoImage.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.ll_facility_coupon.addSubview(self.ll_facility_coupon_image)
        self.ll_facility_coupon_image.snp.makeConstraints { (make) in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.height.equalTo(60)
        }
        
        self.ll_facility_coupon.addSubview(self.tv_facility_coupon_discount)
        self.tv_facility_coupon_discount.snp.makeConstraints { (make) in
            make.leading.equalTo(self.ll_facility_coupon_image.snp.trailing).offset(SizeUtils.contentsMargin)
            make.centerY.equalTo(self.ll_facility_coupon_image)
            make.trailing.equalToSuperview()
        }
        self.ll_facility_coupon.addSubview(self.tv_facility_coupon_title)
        self.tv_facility_coupon_title.snp.makeConstraints { (make) in
            make.leading.equalTo(self.ll_facility_coupon_image.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.tv_facility_coupon_discount.snp.top)
        }
        self.ll_facility_coupon.addSubview(self.tv_facility_coupon_date)
        self.tv_facility_coupon_date.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_facility_coupon_discount.snp.bottom)
            make.leading.equalTo(self.ll_facility_coupon_image.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.facility_name)
        self.facility_name.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_facility_coupon.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(25)
        }
        
        self.contentsView.addSubview(self.ll_facility_detail_info_1)
        self.ll_facility_detail_info_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_name.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.ll_facility_detail_info_1.addSubview(self.facility_detail_loc)
        self.facility_detail_loc.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        self.ll_facility_detail_info_1.addSubview(self.facility_detail_loc_v_line)
        self.facility_detail_loc_v_line.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        self.ll_facility_detail_info_1.addSubview(self.facility_detail_loc_result)
        self.facility_detail_loc_result.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(self.facility_detail_loc_v_line.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.ll_facility_detail_info_2)
        self.ll_facility_detail_info_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_facility_detail_info_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.ll_facility_detail_info_2.addSubview(self.facility_detail_item)
        self.facility_detail_item.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        self.ll_facility_detail_info_2.addSubview(self.facility_detail_item_v_line)
        self.facility_detail_item_v_line.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        self.ll_facility_detail_info_2.addSubview(self.facility_detail_item_result)
        self.facility_detail_item_result.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(self.facility_detail_item_v_line.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.ll_facility_detail_info_3)
        self.ll_facility_detail_info_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_facility_detail_info_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.ll_facility_detail_info_3.addSubview(self.facility_detail_open)
        self.facility_detail_open.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        self.ll_facility_detail_info_3.addSubview(self.facility_detail_open_v_line)
        self.facility_detail_open_v_line.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        self.ll_facility_detail_info_3.addSubview(self.facility_detail_open_result)
        self.facility_detail_open_result.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(self.facility_detail_open_v_line.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.tv_facility_detail_desc_line)
        self.tv_facility_detail_desc_line.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_facility_detail_info_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.tv_facility_detail_desc)
        self.tv_facility_detail_desc.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_facility_detail_desc_line.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.facility_detail_link_1_line_view)
        self.facility_detail_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_facility_detail_desc.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.facility_detail_link_1.tag = 0
        self.facility_detail_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFacilityDetail(_:))))
        self.facility_detail_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.facility_detail_link_1)
        self.facility_detail_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_detail_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.facility_detail_link_1.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.contentsView.addSubview(self.facility_detail_link_2_line_view)
        self.facility_detail_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_detail_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.facility_detail_link_2.tag = 1
        self.facility_detail_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFacilityDetail(_:))))
        self.facility_detail_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.facility_detail_link_2)
        self.facility_detail_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_detail_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.facility_detail_link_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        
        self.contentsView.addSubview(self.facility_detail_link_3_line_view)
        self.facility_detail_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_detail_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.facility_detail_link_3.tag = 2
        self.facility_detail_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFacilityDetail(_:))))
        self.facility_detail_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.facility_detail_link_3)
        self.facility_detail_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_detail_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.facility_detail_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_delete")!)
        
        self.contentsView.addSubview(self.facility_detail_link_3_end_line_view)
        self.facility_detail_link_3_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_detail_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
    
    func setData(){
        if self.facility == nil {
            self.facility = self.realm.objects(Facility.self).first
        }
        
    
        if facility?.optionalImageUrl ?? "" != "" {
            let url = URL(string: ServerUtils.REAL_URL + (facility?.optionalImageUrl ?? ""))
            logoImage.kf.setImage(with: url)
        }else{
            if facility?.logoImageURL ?? "" != "" {
                let url = URL(string: ServerUtils.REAL_URL + (facility?.logoImageURL ?? ""))
                logoImage.kf.setImage(with: url)
            }
        }

        
        self.facility_name.text = CommonUtils.getLocaleString(locale: facility?.name)
        self.facility_detail_loc_result.text = CommonUtils.getLocaleString(locale: facility?.locationDesc)
        
        if !(self.paramType == "shopping" || self.paramType == "food") {
            self.facility_detail_item.text = "facility_detail_service".localized
        }
        self.facility_detail_item_result.text = CommonUtils.getLocaleString(locale: facility?.items)
        
        let openCloseTime: String = facility?.openCloseTime ?? ""
        
        let openTimeIdx: String.Index = openCloseTime.index(openCloseTime.startIndex, offsetBy: 3)
        let closeTimeIdx: String.Index = openCloseTime.index(openCloseTime.startIndex, offsetBy: 4)
        let openTimeResult = String(openCloseTime[...openTimeIdx])
        let closeTimeResult = String(openCloseTime[closeTimeIdx...])
        
        self.facility_detail_open_result.text = "\(CommonUtils.convertToStringFromStringDate(inputString: openTimeResult, inputFormat: "kkmm", outputFormat: "kk:mm")) ~ \(CommonUtils.convertToStringFromStringDate(inputString: closeTimeResult, inputFormat: "kkmm", outputFormat: "kk:mm"))"
        
        self.tv_facility_detail_desc.text = CommonUtils.getLocaleString(locale: facility?.desc)
        
        if self.facility?.telNo == nil || self.facility?.telNo == "" {
            self.facility_detail_link_2_line_view.isHidden = true
            self.facility_detail_link_2.isHidden = true
            self.facility_detail_link_2_line_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.facility_detail_link_1.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
            
            self.facility_detail_link_2.snp.remakeConstraints { (make) in
                make.top.equalTo(self.facility_detail_link_2_line_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
        }else{
            self.facility_detail_link_2_line_view.isHidden = false
            self.facility_detail_link_2.isHidden = false
            self.facility_detail_link_2_line_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.facility_detail_link_1.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            
            self.facility_detail_link_2.snp.remakeConstraints { (make) in
                make.top.equalTo(self.facility_detail_link_2_line_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(SizeUtils.buttonHeight)
            }
        }
        
        let tempString: String = self.facility?.usid ?? ""
        let campaignTarget = Array(self.realm.objects(CampaignTarget.self).filter(NSPredicate(format: "targetID == %@", tempString)))

        if campaignTarget.count == 0 {
            self.ll_facility_coupon.isHidden = true
            self.ll_facility_coupon.snp.remakeConstraints { (make) in
                make.top.equalTo(self.logoImage.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
        }else{
//            @objc dynamic var targetName, locationDescription: Localed?
//            @objc dynamic var targetType: String?
//            @objc dynamic var targetID: String?
//            @objc dynamic var logoImageURL: String?
            
            self.coupon = self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignID == %@", campaignTarget[0].campaignId as! CVarArg)).first
            

            if self.coupon!.logoFileURL ?? "" != "" {
                let url = URL(string: ServerUtils.REAL_URL + (self.coupon!.logoFileURL ?? ""))
                self.ll_facility_coupon_image.kf.setImage(with: url)
            }
            
            self.tv_facility_coupon_title.text = CommonUtils.getLocaleString(locale: self.coupon!.name)
            
            var currency = "$"
            var minCurrency = "$"
            var discount = ""
            var strEndDate = ""
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
                    discount += String(format: "coupon_detail_section_desc_percent_1".localized, self.coupon!.discountBoundary!.discountValue, currency, "\(self.coupon!.discountBoundary?.maxDiscountAmount ?? 0)".convertToDecimalNumber)
                }
            }
            
            strEndDate = String(format: "coupon_list_end_date".localized, CommonUtils.convertToStringFromStringDate(inputString: self.coupon!.endDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy.MM.dd") )
            
            self.tv_facility_coupon_discount.text = discount
            self.tv_facility_coupon_date.text = strEndDate
            
        }
        
    }
}
extension FacilityDetailViewController {
    @objc func clickFacilityDetail(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //매장위치 TODO map
        }else if sender.view?.tag == 1 {
            //문의전화
            
            if let url = URL(string: "tel://\(self.facility?.telNo!.replacingOccurrences(of: "-", with: "") ?? "")"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            //즐겨찾기
            
            if self.isFavorite {
                try! self.realm.write {
                    let result = self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "usid == %@", self.facility?.usid as! CVarArg))
                    self.realm.delete(result)
                }
                
                self.facility_detail_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_delete")!)
                
            }else{
                let favoriteData = FavoriteData()
                favoriteData.usid = self.facility?.usid
                favoriteData.name = self.facility?.name
                favoriteData.loc = self.facility?.locationDesc
                favoriteData.areaCode = self.facility?.areaCode
                favoriteData.logoImageUrl = self.facility?.logoImageURL
                favoriteData.terminalId = self.facility?.terminalID
                
                if self.facility?.bigCategory == "102" || self.facility?.bigCategory == "103" {
                    favoriteData.category = "1"
                }else{
                    favoriteData.category = "2"
                }
                
                favoriteData.favoriteDate = CommonUtils.getTodayDate(format: "yyyyMMddkkmmss")
                
                try! self.realm.write {
                    self.realm.add(favoriteData, update: .modified)
                }
                
                self.facility_detail_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_star")!)
            }
            
            self.isFavorite = !self.isFavorite
        }
    }
    @objc func moveCouponDetail(){
        let couponDetailVC = CouponDetailViewController()
        
        couponDetailVC.coupon = self.coupon
        self.navigationController?.pushViewController(couponDetailVC, animated: true)
    }
}
