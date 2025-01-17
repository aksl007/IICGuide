//
//  ParkingFeePaymentViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ParkingFeePaymentViewController: BaseViewController {
    
    var terminalType = "T1"
    var isMyCarLocation = false
    var parkingPaymentCars = [String]()
    var parkingLocationInfos = [ParkingLocationInfo]()
    var parkingLocationInfosString = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingFeePaymentViewController.self))
        initUi()
    }
    
    private let parking_car_info_title_1 : UILabel = {
        let label = UILabel()
        label.text = "parking_car_info_title_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let parking_car_info_title_2 : UILabel = {
        let label = UILabel()
        label.text = "parking_car_info_title_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let etCarNumberView: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var etCarNumber_0 : UITextField = {
        let textField = UITextField()
        return textField
    }()
    private var etCarNumber_1 : UITextField = {
        let textField = UITextField()
        return textField
    }()
    private var etCarNumber_2 : UITextField = {
        let textField = UITextField()
        return textField
    }()
    private var etCarNumber_3 : UITextField = {
        let textField = UITextField()
        return textField
    }()
    private let parking_car_info_btn : UIButton = {
        let button = UIButton()
        button.setTitle("parking_car_info_btn".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let my_car_location_view: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let car_number_h_line_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let car_number : UILabel = {
        let label = UILabel()
        label.text = "27라1237"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let car_location_lot_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let car_location_lot_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let car_location_lot : UILabel = {
        let label = UILabel()
        label.text = "car_location_lot".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let car_location_lot_result : UILabel = {
        let label = UILabel()
        label.text = "제1여객터미널 단기주차장"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let car_location_lane_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let car_location_lane_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let car_location_lane : UILabel = {
        let label = UILabel()
        label.text = "car_location_lane".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let car_location_lane_result : UILabel = {
        let label = UILabel()
        label.text = "지상 1층, C09구역"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let car_location_parking_time_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let car_location_parking_time_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let car_location_parking_time : UILabel = {
        let label = UILabel()
        label.text = "car_location_parking_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let car_location_parking_time_result : UILabel = {
        let label = UILabel()
        label.text = "2020.08.22. 19:57"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()


}
extension ParkingFeePaymentViewController {
    func initUi(){
        self.view.addSubview(self.parking_car_info_title_1)
        self.parking_car_info_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin * 2)
            make.centerX.equalToSuperview()
        }
        self.view.addSubview(self.parking_car_info_title_2)
        self.parking_car_info_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_car_info_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(self.etCarNumberView)
        self.etCarNumberView.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_car_info_title_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width / 2)
        }
        
        self.etCarNumber_0 = self.makeTextField(textField: self.etCarNumber_0, tag: 0)
        self.etCarNumber_1 = self.makeTextField(textField: self.etCarNumber_1, tag: 1)
        self.etCarNumber_2 = self.makeTextField(textField: self.etCarNumber_2, tag: 2)
        self.etCarNumber_3 = self.makeTextField(textField: self.etCarNumber_3, tag: 3)
        
        self.etCarNumber_0.delegate = self
        self.etCarNumber_1.delegate = self
        self.etCarNumber_2.delegate = self
        self.etCarNumber_3.delegate = self
        
        self.etCarNumberView.addSubview(self.etCarNumber_0)
        self.etCarNumber_0.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(((self.view.frame.width / 2) - SizeUtils.contentsMargin * 3) / 4)
            make.bottom.equalToSuperview()
        }
        self.etCarNumberView.addSubview(self.etCarNumber_1)
        self.etCarNumber_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.etCarNumber_0.snp.trailing).offset(SizeUtils.contentsMargin)
            make.width.height.equalTo(((self.view.frame.width / 2) - SizeUtils.contentsMargin * 3) / 4)
        }
        self.etCarNumberView.addSubview(self.etCarNumber_2)
        self.etCarNumber_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.etCarNumber_1.snp.trailing).offset(SizeUtils.contentsMargin)
            make.width.height.equalTo(((self.view.frame.width / 2) - SizeUtils.contentsMargin * 3) / 4)
        }
        self.etCarNumberView.addSubview(self.etCarNumber_3)
        self.etCarNumber_3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.etCarNumber_2.snp.trailing).offset(SizeUtils.contentsMargin)
            make.width.height.equalTo(((self.view.frame.width / 2) - SizeUtils.contentsMargin * 3) / 4)
        }
        
        self.parking_car_info_btn.addTarget(self, action: #selector(clickSearch), for: .touchUpInside)
        self.view.addSubview(self.parking_car_info_btn)
        self.parking_car_info_btn.snp.makeConstraints { (make) in
            make.top.equalTo(self.etCarNumberView.snp.bottom).offset(SizeUtils.verticalMargin * 2)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.my_car_location_view.isHidden = true
        self.view.addSubview(self.my_car_location_view)
        self.my_car_location_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_car_info_btn.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.my_car_location_view.addSubview(self.car_number_h_line_view)
        self.car_number_h_line_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_number)
        self.car_number.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.my_car_location_view.addSubview(self.car_location_lot_h_line_view)
        self.car_location_lot_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_number.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_location_lot)
        self.car_location_lot.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_location_lot_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.my_car_location_view.addSubview(self.car_location_lot_v_line_view)
        self.car_location_lot_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.car_location_lot)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_location_lot_result)
        self.car_location_lot_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.car_location_lot)
            make.leading.equalTo(self.car_location_lot_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.my_car_location_view.addSubview(self.car_location_lane_h_line_view)
        self.car_location_lane_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_location_lot.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_location_lane)
        self.car_location_lane.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_location_lane_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.my_car_location_view.addSubview(self.car_location_lane_v_line_view)
        self.car_location_lane_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.car_location_lane)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_location_lane_result)
        self.car_location_lane_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.car_location_lane)
            make.leading.equalTo(self.car_location_lane_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.my_car_location_view.addSubview(self.car_location_parking_time_h_line_view)
        self.car_location_parking_time_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_location_lane.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_location_parking_time)
        self.car_location_parking_time.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_location_parking_time_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.bottom.equalToSuperview()
        }
        self.my_car_location_view.addSubview(self.car_location_parking_time_v_line_view)
        self.car_location_parking_time_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.car_location_parking_time)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.my_car_location_view.addSubview(self.car_location_parking_time_result)
        self.car_location_parking_time_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.car_location_parking_time)
            make.leading.equalTo(self.car_location_parking_time_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
    }
    
    func makeTextField(textField: UITextField, tag: Int) -> UITextField {
        textField.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        textField.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.bold)
        textField.textAlignment = .center
        textField.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        textField.layer.borderWidth = 1.0
        
        //        textField.placeholder = "flight_search_flight_name_hint".localized
        textField.tag = tag
        textField.addTarget(self, action: #selector(changedCarNumber(_:)), for: .editingChanged)
        textField.clearButtonMode = .never
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        textField.addDoneButtonOnKeyboard()
        return textField
    }
    
    func moveParkingFeePaymentDetail(row: Int){
        
        if self.isMyCarLocation {
            self.my_car_location_view.isHidden = false
            self.car_number.text = self.parkingLocationInfos[row].carNo
            
            var parkingLot = "flights_list_t1".localized
            if self.terminalType == "T2" {
                parkingLot = "flights_list_t2".localized
            }
            
            if self.parkingLocationInfos[row].parkingLotName == "단기주차장" {
                parkingLot += " " + "real_time_info_parking_short_term".localized
            }else{
                parkingLot += " " + "real_time_info_parking_long_term".localized
            }
            
            self.car_location_lot_result.text = parkingLot
            
            var parkingLane = ""
            
            if self.parkingLocationInfos[row].parkingLaneName != nil && self.parkingLocationInfos[row].parkingLaneName != "" {
                let zoneName: String = self.parkingLocationInfos[row].parkingZoneName ?? ""
                
                let zoneNameIdx: String.Index = zoneName.index(zoneName.startIndex, offsetBy: 6)
                let zoneNameResult = String(zoneName[zoneNameIdx...])
                
                let laneName: String = self.parkingLocationInfos[row].parkingLaneName ?? ""
                let laneNameIdx: String.Index = laneName.index(laneName.startIndex, offsetBy: 5)
                let laneNameResult = String(laneName[...laneNameIdx])
                
                parkingLane = zoneNameResult + ", " + laneNameResult
                
                //TODO MAP
            }
            
            self.car_location_lane_result.text = parkingLane
            
            self.car_location_parking_time_result.text = CommonUtils.convertToStringFromStringDate(inputString: self.parkingLocationInfos[row].parkingDateTime, inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy.MM.dd. kk:mm")
        }else{
            let parkingFeePaymentDetailVC = ParkingFeePaymentDetailViewController()
            parkingFeePaymentDetailVC.terminalType = self.terminalType
            parkingFeePaymentDetailVC.carNumber = parkingPaymentCars[row]
            self.navigationController?.pushViewController(parkingFeePaymentDetailVC, animated: true)
        }
    }
}
extension ParkingFeePaymentViewController {
    @objc func clickSearch(){
        let carNumber = "\(self.etCarNumber_0.text ?? "")\(self.etCarNumber_1.text ?? "")\(self.etCarNumber_2.text ?? "")\(self.etCarNumber_3.text ?? "")"
        
        print("\(carNumber)")
        
        if self.isMyCarLocation {
            self.getParkingCars(carNumber)
        }else{
            self.getParkingPaymentCars(carNumber)
        }
        
    }
    @objc func changedCarNumber(_ sender: UITextField){
        if sender.text?.count ?? 0 > 0 {
            if sender.tag == 0 {
                self.etCarNumber_1.becomeFirstResponder()
            }else if sender.tag == 1 {
                self.etCarNumber_2.becomeFirstResponder()
            }else if sender.tag == 2 {
                self.etCarNumber_3.becomeFirstResponder()
            }else if sender.tag == 3 {
                self.etCarNumber_3.resignFirstResponder()
            }
        }
    }
}
extension ParkingFeePaymentViewController {
    func getParkingPaymentCars(_ carNumber: String){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getParkingFeeCarNoInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.parkingPaymentCars + terminalId

        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "carNo": carNumber
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
                            var result = try? JSONDecoder().decode(BaseResult<[String]>.self, from: dataJson)
                            self.parkingPaymentCars = result?.data ?? [String]()
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        if self.parkingPaymentCars.count == 0 {
                            let popupVC = PopupViewController()
                            popupVC.modalPresentationStyle = .overFullScreen
                            popupVC.modalTransitionStyle = .crossDissolve
                            
                            popupVC.popupTitle = "parking_fee_number_popup_title".localized
                            popupVC.popupContents = "parking_fee_number_no_result".localized
                            self.present(popupVC, animated: false, completion: nil)
                        }else {
                            let popupVC = PopupListViewController()
                            popupVC.modalPresentationStyle = .overFullScreen
                            popupVC.modalTransitionStyle = .crossDissolve
                            
                            popupVC.parkingFeePayment = self
                            popupVC.arrayString = self.parkingPaymentCars
                            popupVC.popupTitle = "parking_fee_number_popup_title".localized
                            self.present(popupVC, animated: false, completion: nil)
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
    
    func getParkingCars(_ carNumber: String){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getParkingLocationInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.parkingCars + terminalId + "/" + carNumber
        
        Session.default.request(
            apiUrl,
            method: .get,
//            parameters:
//            [
//                "carNo": carNumber
//            ],
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
                            var result = try? JSONDecoder().decode(BaseResult<[ParkingLocationInfo]>.self, from: dataJson)
                            self.parkingLocationInfos = result?.data ?? [ParkingLocationInfo]()
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        if self.parkingLocationInfos.count == 0 {
                            let popupVC = PopupViewController()
                            popupVC.modalPresentationStyle = .overFullScreen
                            popupVC.modalTransitionStyle = .crossDissolve
                            
                            popupVC.popupTitle = "parking_fee_number_popup_title".localized
                            popupVC.popupContents = "parking_fee_number_no_result".localized
                            self.present(popupVC, animated: false, completion: nil)
                        }else {
                            let popupVC = PopupListViewController()
                            popupVC.modalPresentationStyle = .overFullScreen
                            popupVC.modalTransitionStyle = .crossDissolve
                            
                            self.parkingLocationInfosString.removeAll()
                            for parkingLocationInfo in self.parkingLocationInfos {
                                self.parkingLocationInfosString.append(parkingLocationInfo.carNo ?? "")
                            }
                            
                            popupVC.parkingFeePayment = self
                            popupVC.arrayString = self.parkingLocationInfosString
                            popupVC.popupTitle = "parking_fee_number_popup_title".localized
                            self.present(popupVC, animated: false, completion: nil)
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
extension ParkingFeePaymentViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.text?.count ?? 0 != 0 {
            textField.text = ""
        }
        return true
    }
}
