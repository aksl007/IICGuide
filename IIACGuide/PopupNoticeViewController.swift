//
//  PopupNoticeViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PopupNoticeViewController: BasePopupViewController {
    
    var delegate: HomeViewController?
    
    var notices = [Notice]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PopupNoticeViewController.self))
        self.initUi()
        self.setData()
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

    private let popupCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.sizeToFit()   
        return collectionView
    }()
    
    private let popupCloseButtonLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let popupConfirmButton : UIButton = {
        let button = UIButton()
        button.setTitle("popup_notice_detail".localized, for: .normal)
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
    
    private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        pageControl.pageIndicatorTintColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        pageControl.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        pageControl.sizeToFit()
        return pageControl
    }()
    
    private let popupNoShowView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.sizeToFit()
        return view
    }()
    
    private let noShowCheckBox : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_checkbox_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_checkbox_rel"), for: .selected)
        button.isSelected = false
        button.addTarget(self, action: #selector(toggleChecker(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    
    private let noShowCheckBoxLabel: UILabel = {
        let label = UILabel()
        label.text = "common_no_more_show".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
}
extension PopupNoticeViewController {
    func initUi(){
        
        self.contentsView.addSubview(self.popupTitleLabel)
        self.popupTitleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        
        self.popupCollectionView.delegate = self
        self.popupCollectionView.dataSource = self
        self.popupCollectionView.backgroundColor = .white
        self.popupCollectionView.showsHorizontalScrollIndicator = false
        self.popupCollectionView.isPagingEnabled = true
        self.popupCollectionView.register(PopupNoticeCollectionViewCell.self, forCellWithReuseIdentifier: "PopupNoticeCollectionViewCell")
        self.contentsView.addSubview(self.popupCollectionView)
        self.popupCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupTitleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width - SizeUtils.popupMargin * 2)
        }
        
        self.contentsView.addSubview(self.popupNoShowView)
        self.popupNoShowView.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.popupNoShowView.addSubview(self.noShowCheckBox)
        self.noShowCheckBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
            
            make.bottom.equalToSuperview()
        }
        self.popupNoShowView.addSubview(self.noShowCheckBoxLabel)
        self.noShowCheckBoxLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.noShowCheckBox.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.pageControl.numberOfPages = self.notices.count
        self.contentsView.addSubview(self.pageControl)
        self.pageControl.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupNoShowView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.popupCloseButtonLineView)
        self.popupCloseButtonLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pageControl.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        
        self.popupConfirmButton.addTarget(self, action: #selector(closeNoticePopupWithCompletion), for: .touchUpInside)
        self.popupCloseButton.addTarget(self, action: #selector(closeNoticePopup), for: .touchUpInside)
        
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
        self.contentsView.addSubview(self.popupConfirmButton)
        self.popupConfirmButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupCloseButtonLineView.snp.bottom)
            make.trailing.bottom.equalToSuperview()
            make.leading.equalTo(self.popupConfirmButtonLineView.snp.trailing)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        
        
//        self.ll_area_b.addSubview(self.cb_area_b)
//        self.cb_area_b.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(SizeUtils.topMargin)
//            make.size.equalTo(SizeUtils.iconSizeSmall)
//            make.centerX.equalToSuperview()
//        }
//        self.ll_area_b.addSubview(self.cb_area_b_label)
//        self.cb_area_b_label.snp.makeConstraints { (make) in
//            make.top.equalTo(self.cb_area_b.snp.bottom)
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
//        }
           
    }
    
    func setData(){
        
        self.pageControl.currentPage = 0
        
        self.popupTitleLabel.text = CommonUtils.getLocaleString(locale: self.notices[self.pageControl.currentPage].title)
        
        let buttonName = CommonUtils.getLocaleString(locale: self.notices[self.pageControl.currentPage].buttonName)
        if buttonName != "" {
            self.popupConfirmButton.setTitle(buttonName, for: .normal)
        }
        
        self.noShowCheckBox.isSelected = self.notices[self.pageControl.currentPage].prefPopupEnable
        
    }
}
extension PopupNoticeViewController {
    
    @objc func closeNoticePopup(){
        self.dismiss(animated: false, completion: {
            self.closeProcess()
        })
    }
    
    @objc func closeNoticePopupWithCompletion(){
        self.dismiss(animated: false, completion: {
            
            let buttonName = CommonUtils.getLocaleString(locale: self.notices[self.pageControl.currentPage].buttonName)
            if buttonName != "" {
                
                let webVC = BaseWebViewController()
                webVC.webViewTitle = "slide_main_menu_notice".localized
                webVC.webViewUrl = CommonUtils.getLocaleString(locale: self.notices[self.pageControl.currentPage].linkURL)
                self.delegate?.navigationController?.pushViewController(webVC, animated: true)
                
            }else{
                let noticeDetailVC = NoticeDetailViewController()
                noticeDetailVC.notice = self.notices[self.pageControl.currentPage]
                self.delegate?.navigationController?.pushViewController(noticeDetailVC, animated: true)
            }
            
            self.closeProcess()
        })
    }
    
    func closeProcess(){
    
        var tempString = UserDefaultsUtils.getNoticePopupUsid()
        for notice in self.notices {
            if notice.prefPopupEnable && !tempString.contains(String(notice.usid ?? "")) {
                tempString += "\(notice.usid ?? ""),"
            }
        }
        
        UserDefaultsUtils.setNoticePopupUsid(tempString)
    }
    
    @objc func toggleChecker(_ sender : UIButton){
        sender.isSelected = !sender.isSelected
        self.notices[self.pageControl.currentPage].prefPopupEnable = sender.isSelected
    }
}
extension PopupNoticeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - SizeUtils.popupMargin * 2 , height: self.view.frame.width - SizeUtils.popupMargin * 2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return notices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupNoticeCollectionViewCell", for: indexPath) as! PopupNoticeCollectionViewCell
        
        cell.imageUrl = CommonUtils.getLocaleString(locale: notices[indexPath.row].popupImageFile)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / (self.view.frame.width - SizeUtils.popupMargin * 2))
        self.pageControl.currentPage = page
        
        self.popupTitleLabel.text = CommonUtils.getLocaleString(locale: self.notices[page].title)
        
        let buttonName = CommonUtils.getLocaleString(locale: self.notices[page].buttonName)
        if buttonName != "" {
            self.popupConfirmButton.setTitle(buttonName, for: .normal)
        }
        
        self.noShowCheckBox.isSelected = self.notices[page].prefPopupEnable
    }
}
