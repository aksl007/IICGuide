//
//  AirBrsBagViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire
import SwiftyJSON

class AirBrsBagViewController: BaseViewController {
    
    var arrayDate = [String]()
    let arrayAirline = ["air_brs_bag_airline_0".localized, "air_brs_bag_airline_1".localized, "air_brs_bag_airline_2".localized, "air_brs_bag_airline_3".localized]
    
    var airBrsBagData : AirBrsBagData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirBrsBagViewController.self))
        self.initUi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addKeyboardNotification()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
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
            
            self.scrollView.snp.remakeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(-keyboardHeight)
            }
        }
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {

        self.scrollView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
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
    
    private let barcode_scan_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    private let air_brs_bag_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_desc_2_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        view.sizeToFit()
        return view
    }()
    private let air_brs_btn_barcode : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air_brs_btn_barcode")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let air_brs_bag_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_tag : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air_brs_bag_tag")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let air_brs_bag_date_title_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let air_brs_bag_date_title : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_date_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_date_title_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let air_brs_bag_date_title_border_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        return view
    }()
    private let air_brs_bag_date : UILabel = {
        let label = UILabel()
        label.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd (E)")
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_date_search_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let air_brs_bag_flight_title_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let air_brs_bag_flight_title : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_flight_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_flight_title_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let air_brs_bag_flight_title_border_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        return view
    }()
    private let air_brs_bag_flight : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_airline_0".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_flight_search_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let air_brs_bag_flight_sub_border_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        return view
    }()
    private let air_brs_bag_sub : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.text = "KE"
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .search
        textField.keyboardType = .asciiCapable
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private let air_brs_bag_barcode_title_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let air_brs_bag_barcode_title : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_barcode_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_barcode_title_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let air_brs_bag_barcode_title_boarder_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let air_brs_bag_barcode : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "ex) 1234567890"
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .search
        textField.keyboardType = .asciiCapable
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    
    private let air_brs_bag_seat_title_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let air_brs_bag_seat_title : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_seat_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let air_brs_bag_seat_title_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let air_brs_bag_seat_title_boarder_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let air_brs_bag_seat : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "ex) 7A"
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .search
        textField.keyboardType = .asciiCapable
        textField.addDoneButtonOnKeyboard()
        return textField
    }()

    private let air_brs_bag_btn : UIButton = {
        let button = UIButton()
        button.setTitle("air_brs_bag_btn".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let air_brs_bag_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
}
extension AirBrsBagViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "air_brs_bag_title".localized)
        self.navigationItem.rightBarButtonItem = getBarButtonAllSearch()
    
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
        
        self.barcode_scan_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBarcodeScanner)))
        self.contentsView.addSubview(self.barcode_scan_view)
        self.barcode_scan_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            
        }
        
        self.barcode_scan_view.addSubview(self.air_brs_bag_tag)
        self.air_brs_bag_tag.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(self.view.frame.width / 3)
            make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
        }
        
        self.barcode_scan_view.addSubview(self.air_brs_bag_desc_1)
        self.air_brs_bag_desc_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalTo(self.air_brs_bag_tag.snp.leading).offset(-SizeUtils.sideMargin * 2)
        }
        self.barcode_scan_view.addSubview(self.air_brs_bag_desc_2_view)
        self.air_brs_bag_desc_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalTo(self.air_brs_bag_tag.snp.leading).offset(-SizeUtils.sideMargin * 2)
        }
        self.air_brs_bag_desc_2_view.addSubview(self.air_brs_btn_barcode)
        self.air_brs_btn_barcode.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.air_brs_bag_desc_2_view.addSubview(self.air_brs_bag_desc_2)
        self.air_brs_bag_desc_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.air_brs_bag_date_title_view)
        self.air_brs_bag_date_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.barcode_scan_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.air_brs_bag_date_title_view.addSubview(self.air_brs_bag_date_title)
        self.air_brs_bag_date_title.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.air_brs_bag_date_title_view.addSubview(self.air_brs_bag_date_title_line_view)
        self.air_brs_bag_date_title_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_date_title.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.air_brs_bag_date_title_border_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSearchDate)))
        self.air_brs_bag_date_title_view.addSubview(self.air_brs_bag_date_title_border_view)
        self.air_brs_bag_date_title_border_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_date_title_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.air_brs_bag_date_title_border_view.addSubview(self.air_brs_bag_date)
        self.air_brs_bag_date.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.air_brs_bag_date_title_border_view.addSubview(self.air_brs_bag_date_search_image)
        self.air_brs_bag_date_search_image.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }

        
        self.contentsView.addSubview(self.air_brs_bag_flight_title_view)
        self.air_brs_bag_flight_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_date_title_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.air_brs_bag_flight_title_view.addSubview(self.air_brs_bag_flight_title)
        self.air_brs_bag_flight_title.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.air_brs_bag_flight_title_view.addSubview(self.air_brs_bag_flight_title_line_view)
        self.air_brs_bag_flight_title_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_flight_title.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.air_brs_bag_flight_title_border_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSearchAirline)))
        self.air_brs_bag_flight_title_view.addSubview(self.air_brs_bag_flight_title_border_view)
        self.air_brs_bag_flight_title_border_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_flight_title_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2)) * 3 / 5)
            make.bottom.equalToSuperview()
        }
        self.air_brs_bag_flight_title_border_view.addSubview(self.air_brs_bag_flight)
        self.air_brs_bag_flight.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.air_brs_bag_flight_title_border_view.addSubview(self.air_brs_bag_flight_search_image)
        self.air_brs_bag_flight_search_image.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.air_brs_bag_flight_title_view.addSubview(self.air_brs_bag_flight_sub_border_view)
        self.air_brs_bag_flight_sub_border_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_flight_title_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.air_brs_bag_flight_title_border_view.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.air_brs_bag_sub.delegate = self
        self.air_brs_bag_flight_sub_border_view.addSubview(self.air_brs_bag_sub)
        self.air_brs_bag_sub.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        
        self.contentsView.addSubview(self.air_brs_bag_barcode_title_view)
        self.air_brs_bag_barcode_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_flight_sub_border_view.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.air_brs_bag_barcode_title_view.addSubview(self.air_brs_bag_barcode_title)
        self.air_brs_bag_barcode_title.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.air_brs_bag_barcode_title_view.addSubview(self.air_brs_bag_barcode_title_line_view)
        self.air_brs_bag_barcode_title_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_barcode_title.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.air_brs_bag_barcode_title_view.addSubview(self.air_brs_bag_barcode_title_boarder_view)
        self.air_brs_bag_barcode_title_boarder_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_barcode_title_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.air_brs_bag_barcode.delegate = self
        self.air_brs_bag_barcode_title_boarder_view.addSubview(self.air_brs_bag_barcode)
        self.air_brs_bag_barcode.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        
        self.contentsView.addSubview(self.air_brs_bag_seat_title_view)
        self.air_brs_bag_seat_title_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_barcode_title_boarder_view.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.air_brs_bag_seat_title_view.addSubview(self.air_brs_bag_seat_title)
        self.air_brs_bag_seat_title.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.air_brs_bag_seat_title_view.addSubview(self.air_brs_bag_seat_title_line_view)
        self.air_brs_bag_seat_title_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_seat_title.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.air_brs_bag_seat_title_view.addSubview(self.air_brs_bag_seat_title_boarder_view)
        self.air_brs_bag_seat_title_boarder_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_seat_title_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.air_brs_bag_seat.delegate = self
        self.air_brs_bag_seat_title_boarder_view.addSubview(self.air_brs_bag_seat)
        self.air_brs_bag_seat.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }

        self.air_brs_bag_btn.addTarget(self, action: #selector(clickSearch), for: .touchUpInside)
        self.contentsView.addSubview(self.air_brs_bag_btn)
        self.air_brs_bag_btn.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_seat_title_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.contentsView.addSubview(self.air_brs_bag_desc_3)
        self.air_brs_bag_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_btn.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
    
    func openListPopup(type : String, arrayString : [String], popupTitle : String){
        let popupVC = PopupListViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.airBrsBag = self
        popupVC.type = type
        popupVC.arrayString = arrayString
        popupVC.popupTitle = popupTitle
        self.present(popupVC, animated: false, completion: nil)
    }
    
    func setString(type:String, row:Int){
        if type == CodeUtils.DATE {
            self.air_brs_bag_date.text = arrayDate[row]
        }else if type == CodeUtils.ARILINES {
            self.air_brs_bag_flight.text = arrayAirline[row]
            if row == 0 {
                self.air_brs_bag_sub.text = "KE"
            }else if row == 1 {
                self.air_brs_bag_sub.text = "OZ"
            }else if row == 2 {
                self.air_brs_bag_sub.text = "ZE"
            }else if row == 3 {
                self.air_brs_bag_sub.text = "RS"
            }

        }
    }
    
}
extension AirBrsBagViewController {

    @objc func moveBarcodeScanner(){
        
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            //already authorized
            self.openScanner()
            
        } else if AVCaptureDevice.authorizationStatus(for: .video) ==  .notDetermined{
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    //access allowed
                    DispatchQueue.main.async {
                      self.openScanner()
                    }
                    
                } else {
                    //access denied
                }
            })
        }else {
            self.setAuthPhotoAlertAction()
        }
    }
    
    func openScanner(){
        let scannerVC = ScannerViewController()
        scannerVC.delegate = self
        self.present(scannerVC, animated: true, completion: nil)
    }
    
    func setAuthPhotoAlertAction(){
        let authAlertController: UIAlertController
        authAlertController = UIAlertController(title: "Camera Permission", message: "Used to scan barcodes", preferredStyle: UIAlertController.Style.alert)

        let getAuthAction: UIAlertAction
        getAuthAction = UIAlertAction(title: "common_setting".localized, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            if let appSettings = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        })
        authAlertController.addAction(getAuthAction)
        self.present(authAlertController, animated: true, completion: nil)
    }
    
    @objc func clickSearch(){
        
        if self.air_brs_bag_sub.text!.count < 5 {
            self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_popup_fail_msg_1".localized)
            return
        }
        if self.air_brs_bag_barcode.text!.count < 1 {
            self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_popup_fail_msg_2".localized)
            return
        }
        if self.air_brs_bag_barcode.text!.count < 6 || self.air_brs_bag_barcode.text!.count > 10 {
            self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_fail_msg_4".localized)
            return
        }
        if self.air_brs_bag_seat.text!.count < 1 && self.air_brs_bag_barcode.text!.count != 10 {
            self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_fail_msg_5".localized)
            return
        }
        
        //키보드 닫기
        self.resignFirstResponder()
        
        self.getFlightsAirbrsTag()

        
    }
    
    @objc func clickSearchDate(){
        if self.arrayDate.count > 0 {
            self.arrayDate.removeAll()
        }
        for i in -1 ..< 2 {
            self.arrayDate.append(CommonUtils.getWantedDate(format: "yyyy.MM.dd (E)", sub: i))
        }
        
        self.openListPopup(type: CodeUtils.DATE, arrayString: arrayDate, popupTitle: "flight_search_date".localized)
        
    }
    @objc func clickSearchAirline(){
        
        self.openListPopup(type: CodeUtils.ARILINES, arrayString: arrayAirline, popupTitle: "air_brs_bag_flight_title".localized)
        
    }
}
extension AirBrsBagViewController {
    func getFlightsAirbrsTag(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getAirBrsBagTag")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.flightsAirbrsTag
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "fltNum": self.air_brs_bag_sub.text ?? "",
                "scheduleDt": CommonUtils.getTodayDate(format: "yyyyMMdd"),
                "bagTagNum": self.air_brs_bag_barcode.text ?? "",
                "seatNo": self.air_brs_bag_seat.text ?? "",
                "reqId": "IAGA"
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
                            let result = try? JSONDecoder().decode(BaseResult<AirBrsBagData>.self, from: dataJson)

                            self.airBrsBagData = result?.data as! AirBrsBagData
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        if self.airBrsBagData != nil && self.airBrsBagData?.code == "00" {
                            
                            let airBrsBagResultVC = AirBrsBagResultViewController()
                            airBrsBagResultVC.airBrsBagData = self.airBrsBagData

                            self.navigationController?.pushViewController(airBrsBagResultVC, animated: true)
                            
                        }else{
                            if self.airBrsBagData?.code == "03" {
                                self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_fail_msg_2".localized)
                            }else if self.airBrsBagData?.code == "02" {
                                self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_fail_msg_3".localized)
                            }else if self.airBrsBagData?.code == "04" {
                                self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_fail_msg_4".localized)
                            }else{
                                self.openOneButtonPopup(title: "air_brs_bag_title".localized, contents: "air_brs_bag_fail_msg_1".localized)
                            }
                        }
                        
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
}
extension AirBrsBagViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.air_brs_bag_seat {
            self.clickSearch()
        }else if textField == self.air_brs_bag_barcode {
            self.clickSearch()
        }else if textField == self.air_brs_bag_sub {
            self.clickSearch()
        }
        
        return true
    }
}
extension AirBrsBagViewController: BarcodeDelegate {
    func barcodeRead(barcode: String) {
        self.air_brs_bag_barcode.text = barcode
    }
    
}
