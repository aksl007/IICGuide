//
//  FAQTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    var viewWidth: CGFloat = 0.0
    
    var faqData: FaqData? {
        didSet{
            
            self.faq_title_label.text = faqData?.title
            self.faq_contents_textview.text = faqData?.contents
            self.faq_tell.text = faqData?.tel
            
            self.addSubview(self.title_view)
            self.title_view.snp.makeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.buttonHeight)
            }
            self.title_view.addSubview(self.icon_arrow_bottom)
            self.icon_arrow_bottom.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            self.title_view.addSubview(self.faq_title_label)
            self.faq_title_label.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalTo(self.icon_arrow_bottom.snp.leading).offset(-SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
            }
            
            
            self.addSubview(self.contents_view)
            self.contents_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.title_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(0)
                
            }
            self.contents_view.addSubview(self.faq_contents_textview)
            self.faq_contents_textview.snp.makeConstraints { (make) in
                make.top.left.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
                make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
                
            }
//            self.scrollView.addSubview(self.faq_contents_label)
//            self.faq_contents_label.snp.makeConstraints { (make) in
//                make.width.equalTo(self.viewWidth - (SizeUtils.sideMargin * 2))
//                make.centerX.top.bottom.equalToSuperview()
//            }
            
            self.addSubview(self.tel_view)
            self.tel_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.contents_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
                
            }
            
            self.tel_view.addSubview(self.faq_tell_line_view)
            self.faq_tell_line_view.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }
            
            self.faq_tell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callFaq)))
            self.faq_tell.isUserInteractionEnabled = true
            self.tel_view.addSubview(self.faq_tell)
            self.faq_tell.snp.makeConstraints { (make) in
                make.top.equalTo(self.faq_tell_line_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(SizeUtils.buttonHeight)

                
            }
            self.faq_tell.addCall(width: self.viewWidth - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

            self.addSubview(self.faq_tell_end_line_view)
            self.faq_tell_end_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.tel_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(1)
            }

            
            if (faqData?.isHidden)! {
                self.contents_view.isHidden = true
                self.tel_view.isHidden = true
            }else{
                self.contents_view.isHidden = false
                if faqData?.tel == "" {
                    self.tel_view.isHidden = true
                }else{
                    self.tel_view.isHidden = false
                }
            }
            
            
            
            self.contents_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.title_view.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                if (faqData?.isHidden)! {
                    make.height.equalTo(0)
                }else{
                    
                }
            }
            self.tel_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.contents_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                if (faqData?.isHidden)! {
                    make.height.equalTo(0)
                }else{
                    if faqData?.tel == "" {
                        make.height.equalTo(0)
                    }else{
                        make.height.equalTo(SizeUtils.buttonHeight)
                    }
                }
            }
        }
    }

    private let title_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let icon_arrow_bottom : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_arrow_bottom")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let faq_title_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return scrollView
    }()
    private let contents_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    
    private let faq_contents_textview : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let faq_contents_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let tel_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let faq_tell_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let faq_tell : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let faq_tell_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func callFaq(){
        if let url = URL(string: "tel://\("prohibited_item_faq_4_call_number".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
