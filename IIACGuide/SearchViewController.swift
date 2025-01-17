//
//  SearchViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: BaseViewController {
    
    var search : Search?
    
    var showSearchList = [ShowSearchList]()

    var keywordLabels = [UILabel]()
    
    var paramKeyword = ""
    var paramCouponKeyword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: SearchViewController.self))
        self.initUI()
        self.keywordLabels.append(self.bg_guidemenu_1_keyword)
        self.keywordLabels.append(self.bg_guidemenu_2_keyword)
        self.keywordLabels.append(self.bg_guidemenu_3_keyword)
                
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.showRecentKeyword()
        
        self.addKeyboardNotification()
        
        self.search_input.becomeFirstResponder()
        
        if paramKeyword != "" {
            self.search_input.text = paramKeyword
            self.getSearchCount()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        self.unregisterForKeyboardNotifications()
    }
    
    //키보드
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            
            self.search_no_result_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.search_result_title_line_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(-keyboardHeight)
            }

            self.search_tableview.snp.remakeConstraints { (make) in
                make.top.equalTo(self.search_result_title_line_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(-keyboardHeight)
            }
        }
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {

        self.search_no_result_view.snp.remakeConstraints { (make) in
            make.top.equalTo(self.search_result_title_line_view.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        self.search_tableview.snp.remakeConstraints { (make) in
            make.top.equalTo(self.search_result_title_line_view.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
 
    private let search_input_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let search_input : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "search_input_hint".localized
        textField.isUserInteractionEnabled = true
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .search
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private let flight_icon_search : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let search_button : UILabel = {
        let label = UILabel()
        label.text = "search_button".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let search_recent_keyword_title_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    private let search_recent_keyword_title : UILabel = {
        let label = UILabel()
        label.text = "search_recent_keyword_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let bg_guidemenu_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_guidemenu")
        imageView.contentMode = .scaleToFill
        imageView.sizeToFit()
        return imageView
    }()
    private let bg_guidemenu_1_keyword : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let bg_guidemenu_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_guidemenu")
        imageView.contentMode = .scaleToFill
        imageView.sizeToFit()
        return imageView
    }()
    private let bg_guidemenu_2_keyword : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let bg_guidemenu_3 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_guidemenu")
        imageView.contentMode = .scaleToFill
        imageView.sizeToFit()
        return imageView
    }()
    private let bg_guidemenu_3_keyword : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let search_result_title_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    private let search_result_title : UILabel = {
        let label = UILabel()
        label.text = "search_result_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let search_result_title_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    
    private let search_no_result_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let search_no_result : UILabel = {
        let label = UILabel()
        label.text = "search_no_result".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let search_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
}
extension SearchViewController{
    func initUI(){
//        "search_keyword_warning" = "통합검색 키워드는 2자리 이상 입력해 주시기 바랍니다.";
//        "search_recent_keyword_title" = "최근 검색어";
//        "search_result_title" = "통합검색결과";
//        "search_no_result" = "검색결과가 없습니다.";
        
        self.setNavigationItemTitle(title: "search_title".localized)
        
        self.search_input.delegate = self
        self.view.addSubview(self.search_input_view)
        self.search_input_view.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(self.view.frame.width - SizeUtils.sideMargin * 2 - self.view.frame.width / 6)
        }
        
        self.search_input_view.addSubview(self.flight_icon_search)
        self.flight_icon_search.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.search_input_view.addSubview(self.search_input)
        self.search_input.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.flight_icon_search.snp.trailing).offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.search_button.isUserInteractionEnabled = true
        self.search_button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchAll)))
        self.view.addSubview(self.search_button)
        self.search_button.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_input_view.snp.top)
            make.bottom.equalTo(self.search_input_view.snp.bottom)
            make.leading.equalTo(self.search_input_view.snp.trailing).offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.view.addSubview(self.search_recent_keyword_title_view)
        self.search_recent_keyword_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_input_view.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
        }
     
        self.search_recent_keyword_title_view.addSubview(self.search_recent_keyword_title)
        self.search_recent_keyword_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            
        }
        
        self.search_recent_keyword_title_view.addSubview(self.bg_guidemenu_2)
        self.bg_guidemenu_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_recent_keyword_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 4) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
            
            make.bottom.equalToSuperview()
        }
        
        self.search_recent_keyword_title_view.isUserInteractionEnabled = true
        
        self.bg_guidemenu_1.isUserInteractionEnabled = true
        self.bg_guidemenu_2.isUserInteractionEnabled = true
        self.bg_guidemenu_3.isUserInteractionEnabled = true
        
        self.bg_guidemenu_1.tag = 1
        self.bg_guidemenu_2.tag = 2
        self.bg_guidemenu_3.tag = 3
        
        self.bg_guidemenu_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapRecentKeyword(_:))))
        self.bg_guidemenu_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapRecentKeyword(_:))))
        self.bg_guidemenu_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapRecentKeyword(_:))))
        
        self.bg_guidemenu_2.addSubview(self.bg_guidemenu_2_keyword)
        self.bg_guidemenu_2_keyword.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.search_recent_keyword_title_view.addSubview(self.bg_guidemenu_1)
        self.bg_guidemenu_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_recent_keyword_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalTo(self.bg_guidemenu_2.snp.leading).offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 4) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.bg_guidemenu_1.addSubview(self.bg_guidemenu_1_keyword)
        self.bg_guidemenu_1_keyword.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.search_recent_keyword_title_view.addSubview(self.bg_guidemenu_3)
        self.bg_guidemenu_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_recent_keyword_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.bg_guidemenu_2.snp.trailing).offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 4) / 3)
            make.height.equalTo(SizeUtils.tableHeight)
        }
        self.bg_guidemenu_3.addSubview(self.bg_guidemenu_3_keyword)
        self.bg_guidemenu_3_keyword.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.view.addSubview(self.search_result_title_view)
        self.search_result_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_recent_keyword_title_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
     
        self.search_result_title_view.addSubview(self.search_result_title)
        self.search_result_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
     
        self.view.addSubview(self.search_result_title_line_view)
        self.search_result_title_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_result_title_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.view.addSubview(self.search_no_result_view)
        self.search_no_result_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_result_title_line_view.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.search_no_result_view.addSubview(self.search_no_result)
        self.search_no_result.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.search_tableview.delegate = self
        self.search_tableview.dataSource = self
        self.search_tableview.separatorStyle = .none
        self.search_tableview.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        
        self.search_tableview.isHidden = true
        
        self.view.addSubview(self.search_tableview)
        self.search_tableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.search_result_title_line_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
        
    }
    func showRecentKeyword(){
        let recentKeywords = Array(self.realm.objects(Keyword.self).sorted(byKeyPath: "insertDate", ascending: false))
        
        if recentKeywords.count == 0 {
            self.search_recent_keyword_title_view.isHidden = true
            self.search_recent_keyword_title_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.search_input_view.snp.bottom).offset(SizeUtils.sideMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.search_recent_keyword_title_view.isHidden = false
            self.search_recent_keyword_title_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.search_input_view.snp.bottom).offset(SizeUtils.sideMargin)
                make.leading.trailing.equalToSuperview()
            }
            
            var i = 0
            for keywordLabel in self.keywordLabels {
                if recentKeywords.count > i {
                    keywordLabel.text = recentKeywords[i].keyword
                }
                i += 1
            }
        }
        
    }
}
extension SearchViewController {
    @objc func searchAll(){
        self.getSearchCount()
    }
    @objc func tapRecentKeyword(_ sender: UITapGestureRecognizer){

        self.search_input.text = self.keywordLabels[(sender.view?.tag ?? 1) - 1].text
        self.getSearchCount()
    }
}
extension SearchViewController {
    func getSearchCount(){
        
        let keyword: String = self.search_input.text ?? ""
        
        if keyword.count < 2 {
            self.openOneButtonPopup(title: "search_title".localized, contents: "search_keyword_warning".localized)
            return
        }
        
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getSearchCount")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.searchCount
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
                [
                    "keyword": keyword
                ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
        .validate(statusCode: 200..<400)
        .responseJSON {response in
            switch response.result{
            case .success(let obj):
                let json = JSON(obj)
                print(json)
                let code = json["code"]
                if code == 200 {
                    do {
                        let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        let result = try JSONDecoder().decode(BaseResult<Search>.self, from: dataJson)

                        self.search = result.data
                        
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    
                    //add keyword
                    let keywordData = Keyword(insertDate: CommonUtils.getTodayDate(format: "yyyyMMddkkmmss"), keyword: keyword)
                    try! self.realm.write {
                        self.realm.add(keywordData)
                    }
                    self.showRecentKeyword()
                    
                    self.showSearchList.removeAll()
                    
                    //set list data
                    self.setSearchCountList(code: "10", count: self.search?.category10 ?? 0)
                    self.setSearchCountList(code: "20", count: self.search?.category20 ?? 0)
                    
                    self.setSearchCountList(code: "50", count: self.findFacility(isT1: true, bigCategory: "103", keyword: keyword).count)
                    self.setSearchCountList(code: "60", count: self.findFacility(isT1: false, bigCategory: "103", keyword: keyword).count)
                    self.setSearchCountList(code: "70", count: self.findFacility(isT1: true, bigCategory: "102", keyword: keyword).count)
                    self.setSearchCountList(code: "80", count: self.findFacility(isT1: false, bigCategory: "102", keyword: keyword).count)
                    
                    self.paramKeyword = keyword
                    self.paramCouponKeyword = keyword
                    var couponKeyword = keyword
                    if "slide_shop_sub_menu_3".localized.uppercased() == keyword.uppercased().replacingOccurrences(of: " ", with: "") {
                        couponKeyword = ""
                        self.paramCouponKeyword = ""
                    }
                    self.setSearchCountList(code: "90", count: self.findCoupon(isGeneral: true, keyword: couponKeyword).count)
                    self.setSearchCountList(code: "91", count: self.findCoupon(isGeneral: false, keyword: couponKeyword).count)
                    
                    self.setSearchCountList(code: "100", count: self.search?.category100 ?? 0)
                    
                    self.setSearchCountList(code: "110", count: self.findFacility(isT1: true, bigCategory: "110", keyword: keyword).count)
                    self.setSearchCountList(code: "120", count: self.findFacility(isT1: false, bigCategory: "110", keyword: keyword).count)
                    self.setSearchCountList(code: "130", count: self.findFacility(isT1: true, bigCategory: "111", keyword: keyword).count)
                    self.setSearchCountList(code: "140", count: self.findFacility(isT1: false, bigCategory: "111", keyword: keyword).count)
                    self.setSearchCountList(code: "150", count: self.findFacility(isT1: false, bigCategory: "104", keyword: keyword).count)
                    self.setSearchCountList(code: "160", count: self.findFacility(isT1: true, bigCategory: "107", keyword: keyword).count)
                    self.setSearchCountList(code: "170", count: self.findFacility(isT1: false, bigCategory: "107", keyword: keyword).count)
                    self.setSearchCountList(code: "180", count: self.findFacility(isT1: true, bigCategory: "104", keyword: keyword).count)
                    
                    self.setSearchCountList(code: "190", count: self.search?.category190 ?? 0)
                    self.setSearchCountList(code: "250", count: self.search?.category250 ?? 0)
                    self.setSearchCountList(code: "300", count: self.search?.category300 ?? 0)
                    self.setSearchCountList(code: "310", count: self.search?.category310 ?? 0)
                    
                    self.setSearchCountList(code: "320", count: self.findFacility(isT1: true, bigCategory: "112", keyword: keyword).count)
                    self.setSearchCountList(code: "330", count: self.findFacility(isT1: false, bigCategory: "112", keyword: keyword).count)
                    
                    self.setSearchCountList(code: "340", count: self.search?.category340 ?? 0)
                    self.setSearchCountList(code: "380", count: self.search?.category380 ?? 0)
                    self.setSearchCountList(code: "410", count: self.search?.category410 ?? 0)
                    self.setSearchCountList(code: "420", count: self.search?.category420 ?? 0)

                    if self.showSearchList.count > 0 {
                        self.search_tableview.isHidden = false
                        self.search_tableview.snp.remakeConstraints { (make) in
                            make.top.equalTo(self.search_result_title_line_view.snp.bottom)
                            make.leading.trailing.bottom.equalToSuperview()
                        }
                    }else{
                        self.search_tableview.isHidden = true
                        self.search_tableview.snp.remakeConstraints { (make) in
                            make.top.equalTo(self.search_result_title_line_view.snp.bottom)
                            make.leading.trailing.equalToSuperview()
                            make.height.equalTo(0)
                        }
                    }
                    
                    
                    self.search_tableview.reloadData()
                    
                    self.search_input.resignFirstResponder()
                } else {
                    
                }
                Loading.hide()
            case .failure(let error):
                print(error)
                
                Loading.hide()
            }
        }
    }
    
    func findFacility(isT1: Bool, bigCategory: String, keyword: String) -> [Facility] {
        if isT1 {
            return Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID != 'P03' AND bigCategory == '\(bigCategory)' AND delete == false")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*' OR desc.ko LIKE '*\(keyword)*' OR desc.en LIKE '*\(keyword)*' OR desc.ja LIKE '*\(keyword)*' OR desc.zh LIKE '*\(keyword)*' OR keyword LIKE '*\(keyword)*'")))
        }else{
            return Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID == 'P03' AND bigCategory == '\(bigCategory)' AND delete == false")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*' OR desc.ko LIKE '*\(keyword)*' OR desc.en LIKE '*\(keyword)*' OR desc.ja LIKE '*\(keyword)*' OR desc.zh LIKE '*\(keyword)*' OR keyword LIKE '*\(keyword)*'")))
        }
    }
    func findCoupon(isGeneral: Bool, keyword: String) -> [Coupon] {
        if isGeneral {
            
            return Array(self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignType == 'General'")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*'")))
            
        }else{
            return Array(self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignType == 'DutyFree'")).filter(NSPredicate(format: "name.ko LIKE '*\(keyword)*' OR name.en LIKE '*\(keyword)*' OR name.ja LIKE '*\(keyword)*' OR name.zh LIKE '*\(keyword)*'")))
        }
    }
    
    func setSearchCountList(code: String, count: Int){
        if count > 0 {
            self.showSearchList.append(ShowSearchList(code: code, count: count))
        }
    }
}
extension SearchViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.search_input {
            self.searchAll()
        }
        
        return true
    }
}

extension SearchViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let searchResultVC = SearchResultViewController()
        
        
        let paramCode = self.showSearchList[indexPath.row].code ?? "10"
        
        searchResultVC.code = paramCode
        searchResultVC.searchTitle = "search_category_\(paramCode)".localized
        
        if paramCode == "90" || paramCode == "91" {
            searchResultVC.keyword = self.paramCouponKeyword
        }else{
            searchResultVC.keyword = self.paramKeyword
        }
        
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.showSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell")! as! SearchTableViewCell
 
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.viewWidth = self.view.frame.width
        cell.showSearch = self.showSearchList[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }

}
