//
//  FlightInfoSearchSubViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FlightInfoSearchSubViewController: BaseViewController {
    
    var type = "dep" // dep, arr
    
    var date = ""
    
    let arrayTerminal = ["ALL", "T1", "T2"]
    var arrayDate = [String]()
    var arrayAriportsString = [String]()
    var arrayArilinesString = [String]()
    let arrayEntrance = ["flight_search_not_select".localized, "A", "B", "C", "D", "E", "F"]
    var arrayAriports = [FlightAirport]()
    var arrayArilines = [FlightAirline]()
    
    var airlineIataCode = ""
    var originAirport = ""
    var terminalId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightInfoSearchSubViewController.self))
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
            self.flightSearchSearchView.snp.remakeConstraints { (make) in
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(-(keyboardHeight - CommonUtils.getBottomPadding() - SizeUtils.navigationHeight - 5))
            }
        }
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {

        self.flightSearchSearchView.snp.remakeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setString(type:String, row:Int){
        if type == CodeUtils.TERMINAL {
            self.flightSearchTerminal.text = arrayTerminal[row]
            if arrayTerminal[row] == "T1" {
                terminalId = "P01"
            }else if arrayTerminal[row] == "T2" {
                terminalId = "P03"
            }else{
                terminalId = ""
            }
        }else if type == CodeUtils.DATE {
            self.flightSearchDate.text = arrayDate[row]
        }else if type == CodeUtils.ARIPORTS {
            if row == 0 {
                self.flightSearchDestination.text = ""
                self.originAirport = ""
            }else{
                self.flightSearchDestination.text = arrayAriportsString[row]
                self.originAirport = arrayAriports[row - 1].iataCode ?? ""
            }
            
        }else if type == CodeUtils.ARILINES {
            if row == 0 {
                self.flightSearchAirlilne.text = ""
                self.airlineIataCode = ""
            }else{
                self.flightSearchAirlilne.text = arrayArilinesString[row]
                self.airlineIataCode = arrayArilines[row - 1].iataCode ?? ""
            }
            
        }else if type == CodeUtils.EXITDOOR {
            if row == 0 {
                self.flightSearchExitdoor.text = ""
            }else{
                self.flightSearchExitdoor.text = arrayEntrance[row]
            }
        }
    }
    
    private let flightSearchSearchView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchSearchButton : UIButton = {
        let button = UIButton()
        button.setTitle("flight_search_search".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    private let flightSearchDateView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchDateTitle : UILabel = {
        let label = UILabel()
        label.text = "flight_search_date".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchDateLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightSearchDateBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        return view
    }()
    private let flightSearchDate : UILabel = {
        let label = UILabel()
        label.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd (E)")
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightSearchDateSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flightSearchTerminalView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchTerminalTitle : UILabel = {
        let label = UILabel()
        label.text = "flight_search_terminal".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchTerminalLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightSearchTerminalBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let flightSearchTerminal : UILabel = {
        let label = UILabel()
        label.text = "ALL"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightSearchTerminalSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flightSearchFlightNameView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchFlightNameTitle : UILabel = {
        let label = UILabel()
        label.text = "flight_search_flight_name".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchFlightNameLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightSearchFlightNameBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let flightSearchFlightName : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "flight_search_flight_name_hint".localized
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .search
        textField.keyboardType = .asciiCapable
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    private let flightSearchDestinationView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchDestinationTitle : UILabel = {
        let label = UILabel()
        label.text = "flight_search_destination".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchDestinationLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightSearchDestinationBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let flightSearchDestination : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "flight_search_destination_content".localized
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.isUserInteractionEnabled = false
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    private let flightSearchDestinationSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flightSearchAirlilneView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchAirlilneTitle : UILabel = {
        let label = UILabel()
        label.text = "flight_search_airlilne".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchAirlilneLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightSearchAirlilneBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let flightSearchAirlilne : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "flight_search_airlilne_content".localized
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.isUserInteractionEnabled = false
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    private let flightSearchAirlilneSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flightSearchExitdoorView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchExitdoorTitle : UILabel = {
        let label = UILabel()
        label.text = "flight_search_exitdoor".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchExitdoorLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightSearchExitdoorBorderView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayStroke).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let flightSearchExitdoor : UITextField = {
        let textField = UITextField()
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        textField.placeholder = "flight_search_choice_exitdoor".localized
        //        textField.addTarget(self, action: #selector(changedNickname), for: .editingChanged)
        textField.isUserInteractionEnabled = false
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    private let flightSearchExitdoorSearchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flight_icon_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
}
extension FlightInfoSearchSubViewController {
    func initUi(){
        
        self.view.addSubview(self.flightSearchSearchView)
        self.flightSearchSearchView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.flightSearchSearchButton.addTarget(self, action: #selector(clickSearch), for: .touchUpInside)
        self.flightSearchSearchView.addSubview(self.flightSearchSearchButton)
        self.flightSearchSearchButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.flightSearchSearchView.snp.top)
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        self.contentsView.addSubview(self.flightSearchDateView)
        self.flightSearchDateView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchDateView.addSubview(self.flightSearchDateTitle)
        self.flightSearchDateTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.flightSearchDateView.addSubview(self.flightSearchDateLineView)
        self.flightSearchDateLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDateTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.flightSearchDateBorderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightSearchDate)))
        self.flightSearchDateView.addSubview(self.flightSearchDateBorderView)
        self.flightSearchDateBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDateLineView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        if self.date != "" {
            self.flightSearchDate.text = CommonUtils.convertToStringFromStringDate(inputString: self.date, inputFormat: "yyyy-MM-dd", outputFormat: "yyyy.MM.dd (E)")
        }
        
        self.flightSearchDateBorderView.addSubview(self.flightSearchDate)
        self.flightSearchDate.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchDateBorderView.addSubview(self.flightSearchDateSearchImage)
        self.flightSearchDateSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.flightSearchTerminalView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightSearchTerminal)))
        self.contentsView.addSubview(self.flightSearchTerminalView)
        self.flightSearchTerminalView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDateView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchTerminalView.addSubview(self.flightSearchTerminalTitle)
        self.flightSearchTerminalTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.flightSearchTerminalView.addSubview(self.flightSearchTerminalLineView)
        self.flightSearchTerminalLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchTerminalTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.flightSearchTerminalView.addSubview(self.flightSearchTerminalBorderView)
        self.flightSearchTerminalBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchTerminalLineView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.flightSearchTerminalBorderView.addSubview(self.flightSearchTerminal)
        self.flightSearchTerminal.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchTerminalBorderView.addSubview(self.flightSearchTerminalSearchImage)
        self.flightSearchTerminalSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.contentsView.addSubview(self.flightSearchFlightNameView)
        self.flightSearchFlightNameView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchTerminalView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchFlightNameView.addSubview(self.flightSearchFlightNameTitle)
        self.flightSearchFlightNameTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.flightSearchFlightNameView.addSubview(self.flightSearchFlightNameLineView)
        self.flightSearchFlightNameLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchFlightNameTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.flightSearchFlightNameView.addSubview(self.flightSearchFlightNameBorderView)
        self.flightSearchFlightNameBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchFlightNameLineView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.flightSearchFlightName.delegate = self
        self.flightSearchFlightNameBorderView.addSubview(self.flightSearchFlightName)
        self.flightSearchFlightName.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        if self.type == "arr" {
            self.flightSearchDestinationTitle.text = "flight_search_origin".localized
            self.flightSearchDestination.placeholder = "flight_search_origin_content".localized
        }
        self.contentsView.addSubview(self.flightSearchDestinationView)
        self.flightSearchDestinationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchFlightNameView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchDestinationView.addSubview(self.flightSearchDestinationTitle)
        self.flightSearchDestinationTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.flightSearchDestinationView.addSubview(self.flightSearchDestinationLineView)
        self.flightSearchDestinationLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDestinationTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.flightSearchDestinationBorderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightAirports)))
        self.flightSearchDestinationView.addSubview(self.flightSearchDestinationBorderView)
        self.flightSearchDestinationBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDestinationLineView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.flightSearchDestinationBorderView.addSubview(self.flightSearchDestination)
        self.flightSearchDestination.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchDestinationBorderView.addSubview(self.flightSearchDestinationSearchImage)
        self.flightSearchDestinationSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.contentsView.addSubview(self.flightSearchAirlilneView)
        self.flightSearchAirlilneView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchDestinationView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.flightSearchAirlilneView.addSubview(self.flightSearchAirlilneTitle)
        self.flightSearchAirlilneTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.flightSearchAirlilneView.addSubview(self.flightSearchAirlilneLineView)
        self.flightSearchAirlilneLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchAirlilneTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.flightSearchAirlilneBorderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightsAirlines)))
        self.flightSearchAirlilneView.addSubview(self.flightSearchAirlilneBorderView)
        self.flightSearchAirlilneBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchAirlilneLineView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.flightSearchAirlilneBorderView.addSubview(self.flightSearchAirlilne)
        self.flightSearchAirlilne.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchAirlilneBorderView.addSubview(self.flightSearchAirlilneSearchImage)
        self.flightSearchAirlilneSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        if self.type == "dep" {
            self.flightSearchExitdoorView.isHidden = true
        }
        self.contentsView.addSubview(self.flightSearchExitdoorView)
        self.flightSearchExitdoorView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchAirlilneView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            //end scroll
            make.bottom.equalTo(self.scrollView.snp.bottom)
            if self.type == "dep" {
                make.height.equalTo(0)
            }
        }
        self.flightSearchExitdoorView.addSubview(self.flightSearchExitdoorTitle)
        self.flightSearchExitdoorTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
        }
        self.flightSearchExitdoorView.addSubview(self.flightSearchExitdoorLineView)
        self.flightSearchExitdoorLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchExitdoorTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.flightSearchExitdoorBorderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickFlightsExitdoor)))
        self.flightSearchExitdoorView.addSubview(self.flightSearchExitdoorBorderView)
        self.flightSearchExitdoorBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchExitdoorLineView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.flightSearchExitdoorBorderView.addSubview(self.flightSearchExitdoor)
        self.flightSearchExitdoor.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.flightSearchExitdoorBorderView.addSubview(self.flightSearchExitdoorSearchImage)
        self.flightSearchExitdoorSearchImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
    }
}
extension FlightInfoSearchSubViewController {
    @objc func clickFlightSearchDate(){
        print("clickFlightSearchDate")
        if self.arrayDate.count > 0 {
            self.arrayDate.removeAll()
        }
        for i in -7 ..< 7 {
            self.arrayDate.append(CommonUtils.getWantedDate(format: "yyyy.MM.dd (E)", sub: i))
        }
        
        self.openListPopup(type: CodeUtils.DATE, arrayString: arrayDate, popupTitle: "flight_search_date".localized)
        
    }
    @objc func clickFlightSearchTerminal(){
        print("clickFlightSearchTerminal")
        
        self.openListPopup(type: CodeUtils.TERMINAL, arrayString: arrayTerminal, popupTitle: "flight_search_terminal_content".localized)
    }
    @objc func clickFlightAirports(){
        print("clickFlightAirports")
        self.getFlightsAirports()

    }
    @objc func clickFlightsAirlines(){
        print("clickFlightsAirlines")
        self.getFlightsAirlines()

    }
    @objc func clickFlightsExitdoor(){
        print("clickFlightsExitdoor")
        self.openListPopup(type: CodeUtils.EXITDOOR, arrayString: arrayEntrance, popupTitle: "flight_search_choice_exitdoor".localized)

    }
    @objc func clickSearch(){
        print("clickSearch")
        
        let flightPid: String = self.flightSearchFlightName.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        let fromScheduleDate = CommonUtils.convertToStringFromStringDate(inputString: self.flightSearchDate.text, inputFormat: "yyyy.MM.dd (E)", outputFormat: "yyyyMMdd")
        
        let exitDoorNo = self.flightSearchExitdoor.text
        
        let flightSearchDetailVC = FlightSearchDetailViewController()
        
        flightSearchDetailVC.type = self.type
        flightSearchDetailVC.flightPid = flightPid
        flightSearchDetailVC.fromScheduleDate = fromScheduleDate
        flightSearchDetailVC.toScheduleDate = fromScheduleDate
        flightSearchDetailVC.originAirport = self.originAirport
        flightSearchDetailVC.airlineIataCode = self.airlineIataCode
        flightSearchDetailVC.exitDoorNo = exitDoorNo ?? ""
        flightSearchDetailVC.terminalId = self.terminalId

        self.navigationController?.pushViewController(flightSearchDetailVC, animated: true)
    }
    
    func openListPopup(type : String, arrayString : [String], popupTitle : String){
        let popupVC = PopupListViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.flightInfoSearch = self
        popupVC.type = type
        popupVC.arrayString = arrayString
        popupVC.popupTitle = popupTitle
        self.present(popupVC, animated: false, completion: nil)
    }
    
}
extension FlightInfoSearchSubViewController {
    func getFlightsAirports(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightSearchAirport")
        let apiUrl = ServerUtils.serverUrl + ServerUtils.flightsAirports
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "scheduleDate": CommonUtils.convertToStringFromStringDate(inputString: self.flightSearchDate.text, inputFormat: "yyyy.MM.dd (E)", outputFormat: "yyyyMMdd")
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
                            let result = try? JSONDecoder().decode(BaseResult<[FlightAirport]>.self, from: dataJson)

                            self.arrayAriports = result?.data as! [FlightAirport]
                        } catch {
                            print(error.localizedDescription)
                        }

                        self.arrayAriportsString.removeAll()
                        self.arrayAriportsString.append("flight_search_not_select".localized)
                        
                        for arrayAriport in self.arrayAriports {
                            self.arrayAriportsString.append(CommonUtils.getLocaleString(locale: arrayAriport.name))
                        }
                        
                        var popupTitle = "flight_search_destination_content".localized
                        if self.type == "arr" {
                            popupTitle = "flight_search_origin_content".localized
                        }
                        self.openListPopup(type: CodeUtils.ARIPORTS, arrayString: self.arrayAriportsString, popupTitle: popupTitle)

                    } else {

                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    
    func getFlightsAirlines(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightSearchAirline")
        let apiUrl = ServerUtils.serverUrl + ServerUtils.flightsAirlines
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "scheduleDate": CommonUtils.convertToStringFromStringDate(inputString: self.flightSearchDate.text, inputFormat: "yyyy.MM.dd (E)", outputFormat: "yyyyMMdd")
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
                            let result = try? JSONDecoder().decode(BaseResult<[FlightAirline]>.self, from: dataJson)

                            self.arrayArilines = result?.data as! [FlightAirline]
                        } catch {
                            print(error.localizedDescription)
                        }

                        self.arrayArilinesString.removeAll()
                        self.arrayArilinesString.append("flight_search_not_select".localized)

                        for arrayAriline in self.arrayArilines {
                            self.arrayArilinesString.append(CommonUtils.getLocaleString(locale: arrayAriline.name))
                        }

                        self.openListPopup(type: CodeUtils.ARILINES, arrayString: self.arrayArilinesString, popupTitle: "flight_search_airlilne_content".localized)

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
extension FlightInfoSearchSubViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.flightSearchFlightName {
            self.clickSearch()
        }
        
        return true
    }
}
