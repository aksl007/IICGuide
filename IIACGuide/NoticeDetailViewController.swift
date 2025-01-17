//
//  NoticeDetailViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Kingfisher

class NoticeDetailViewController: BaseViewController {
    
    var notice: Notice?

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: NoticeDetailViewController.self))
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
    private let notice_title : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let notice_date : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let end_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let image_file : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let tv_notice_detail_content : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let btn_notice : UIButton = {
        let button = UIButton()
//        button.setTitle("air_brs_bag_result_re_search".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
}
extension NoticeDetailViewController{
    func initUi(){
        self.setNavigationItemTitle(title: "slide_main_menu_notice".localized)
        
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
        
        self.contentsView.addSubview(self.notice_title)
        self.notice_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.notice_date)
        self.notice_date.snp.makeConstraints { (make) in
            make.top.equalTo(self.notice_title.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.end_view)
        self.end_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.notice_date.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        

        
        self.image_file.isUserInteractionEnabled = true
        self.image_file.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNoticeImageFile(_:))))
        
        self.contentsView.addSubview(self.image_file)
        self.image_file.snp.makeConstraints { (make) in
            make.top.equalTo(self.end_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(self.view.frame.width * 1.5)
        }
        
        self.contentsView.addSubview(self.tv_notice_detail_content)
        self.tv_notice_detail_content.snp.makeConstraints { (make) in
            make.top.equalTo(self.image_file.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }

        self.btn_notice.addTarget(self, action: #selector(moveLink), for: .touchUpInside)
        self.contentsView.addSubview(self.btn_notice)
        self.btn_notice.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_notice_detail_content.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
    
    func setData(){
        
        self.notice_title.text = CommonUtils.getLocaleString(locale: self.notice?.title)
        self.notice_date.text = CommonUtils.convertToStringFromStringDate(inputString: self.notice?.startDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy-MM-dd")
        
        let contents = CommonUtils.getLocaleString(locale: self.notice?.content)
        if contents == "" {
            self.tv_notice_detail_content.isHidden = true
            self.tv_notice_detail_content.snp.remakeConstraints { (make) in
                make.top.equalTo(self.image_file.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
        }else{
            self.tv_notice_detail_content.isHidden = false
            self.tv_notice_detail_content.snp.remakeConstraints { (make) in
                make.top.equalTo(self.image_file.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            if contents.contains("<br>") || contents.contains("<li>") || contents.contains("<p>") {
                self.tv_notice_detail_content.text = contents.htmlToString
            }else{
                self.tv_notice_detail_content.text = contents
            }
        }
        
        let imageUrl = CommonUtils.getLocaleString(locale: self.notice?.mainImageFile)
        if imageUrl == "" {
            self.image_file.isHidden = true
            self.image_file.snp.remakeConstraints { (make) in
                make.top.equalTo(self.end_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
            }
        }else{
            
            let url = URL(string: ServerUtils.REAL_URL + imageUrl)
            image_file.kf.setImage(with: url)
 
            self.image_file.isHidden = false
            self.image_file.snp.makeConstraints { (make) in
                make.top.equalTo(self.end_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(self.view.frame.width * 1.5)
            }
        }
        

        if CommonUtils.getLocaleString(locale: self.notice?.buttonName) == "" {
            
            self.btn_notice.isHidden = true
            self.btn_notice.snp.remakeConstraints { (make) in
                make.top.equalTo(self.tv_notice_detail_content.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
                
                make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
            }
        }else{
            self.btn_notice.isHidden = false
            self.btn_notice.snp.remakeConstraints { (make) in
                make.top.equalTo(self.tv_notice_detail_content.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(SizeUtils.buttonHeight)
                
                make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
            }
        }
        
    }
}
extension NoticeDetailViewController {
    
    @objc func moveLink(){
        self.openWebView(title: "slide_main_menu_notice".localized, url: CommonUtils.getLocaleString(locale: self.notice?.linkURL))
    }
    
    @objc func tapNoticeImageFile(_ sender: UITapGestureRecognizer){
        let imageZoomVC = ImageZoomViewController()
        imageZoomVC.paramTitle = "slide_main_menu_notice".localized
        imageZoomVC.image = (sender.view as! UIImageView).image
        self.navigationController?.pushViewController(imageZoomVC, animated: true)
    }
}
