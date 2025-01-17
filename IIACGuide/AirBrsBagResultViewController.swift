//
//  AirBrsBagResultViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AirBrsBagResultViewController: BaseViewController {
    
    var airBrsBagData : AirBrsBagData?

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirBrsBagResultViewController.self))
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
    
    private let air_brs_bag_result_flight : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_result_flight".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_air_brs_bag_flight : UILabel = {
        let label = UILabel()
        label.text = "KF909"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let air_brs_bag_result_barcode : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_result_barcode".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_air_brs_bag_barcode : UILabel = {
        let label = UILabel()
        label.text = "123456"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_incheon_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let myplan_passenger_incheon : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_incheon".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let ICN : UILabel = {
        let label = UILabel()
        label.text = "ICN"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let tv_air_brs_bag_result_dest_airport_name : UILabel = {
        let label = UILabel()
        label.text = "DOKYO"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_air_brs_bag_result_dest_airport_code : UILabel = {
        let label = UILabel()
        label.text = "DOK"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_ticket_arrow : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_passenger_ticket_arrow")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let iv_air_brs_result_status_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let iv_air_brs_result_status : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air_brs_icon_bag_move")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let tv_air_brs_bag_result_date : UILabel = {
        let label = UILabel()
        label.text = CommonUtils.getTodayDate(format: "yyyy/MM/dd kk:mm")
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let air_brs_bag_result_status_1_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let air_brs_bag_result_status_1 : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_result_status_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleNumber, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let air_brs_bag_result_status_desc_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let air_brs_bag_result_status_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_result_status_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let air_brs_bag_result_status_call_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let air_brs_bag_result_status_call : UILabel = {
        let label = UILabel()
        label.text = "air_brs_bag_result_status_call".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let air_brs_bag_result_status_call_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let air_brs_bag_result_re_search : UIButton = {
        let button = UIButton()
        button.setTitle("air_brs_bag_result_re_search".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let icon_home_search : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_home_search")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
}
extension AirBrsBagResultViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "air_brs_bag_result_title".localized)
        
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
        
        let cellSize = (self.view.frame.width - SizeUtils.sideMargin * 2) / 5
        
        self.contentsView.addSubview(self.air_brs_bag_result_flight)
        self.air_brs_bag_result_flight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        self.contentsView.addSubview(self.tv_air_brs_bag_flight)
        self.tv_air_brs_bag_flight.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_flight.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        
        self.contentsView.addSubview(self.air_brs_bag_result_barcode)
        self.air_brs_bag_result_barcode.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        self.contentsView.addSubview(self.tv_air_brs_bag_barcode)
        self.tv_air_brs_bag_barcode.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_barcode.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        
        self.contentsView.addSubview(self.myplan_passenger_incheon_line_view)
        self.myplan_passenger_incheon_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_air_brs_bag_flight.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.myplan_passenger_incheon)
        self.myplan_passenger_incheon.snp.makeConstraints { (make) in
            make.top.equalTo(self.myplan_passenger_incheon_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        self.contentsView.addSubview(self.ICN)
        self.ICN.snp.makeConstraints { (make) in
            make.top.equalTo(self.myplan_passenger_incheon.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        
        self.contentsView.addSubview(self.tv_air_brs_bag_result_dest_airport_name)
        self.tv_air_brs_bag_result_dest_airport_name.snp.makeConstraints { (make) in
            make.top.equalTo(self.myplan_passenger_incheon_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        self.contentsView.addSubview(self.tv_air_brs_bag_result_dest_airport_code)
        self.tv_air_brs_bag_result_dest_airport_code.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_air_brs_bag_result_dest_airport_name.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo(cellSize * 2)
        }
        
        self.contentsView.addSubview(self.myplan_passenger_ticket_arrow)
        self.myplan_passenger_ticket_arrow.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerY.equalTo(self.ICN)
        }
        
        self.contentsView.addSubview(self.air_brs_bag_result_status_1_view)
        self.air_brs_bag_result_status_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.ICN.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.trailing.equalToSuperview()
        }
        
        self.air_brs_bag_result_status_1_view.addSubview(self.iv_air_brs_result_status_line_view)
        self.iv_air_brs_result_status_line_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.air_brs_bag_result_status_1_view.addSubview(self.iv_air_brs_result_status)
        self.iv_air_brs_result_status.snp.makeConstraints { (make) in
            make.top.equalTo(self.iv_air_brs_result_status_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalTo(self.ICN)
            make.height.equalTo(SizeUtils.iconSizeBig)
        }
        
        self.air_brs_bag_result_status_1_view.addSubview(self.tv_air_brs_bag_result_date)
        self.tv_air_brs_bag_result_date.snp.makeConstraints { (make) in
            make.top.equalTo(self.iv_air_brs_result_status.snp.top)
            make.leading.equalToSuperview().offset(cellSize * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
      
        self.air_brs_bag_result_status_1_view.addSubview(self.air_brs_bag_result_status_1)
        self.air_brs_bag_result_status_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_air_brs_bag_result_date.snp.bottom)
            make.leading.equalToSuperview().offset(cellSize * 2)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.air_brs_bag_result_status_desc_1_line_view)
        self.air_brs_bag_result_status_desc_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_status_1_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.air_brs_bag_result_status_desc_1)
        self.air_brs_bag_result_status_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_status_desc_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.air_brs_bag_result_status_call_line_view)
        self.air_brs_bag_result_status_call_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_status_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.air_brs_bag_result_status_call.isHidden = true
        self.air_brs_bag_result_status_call.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callAirBrsBag)))
        self.air_brs_bag_result_status_call.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.air_brs_bag_result_status_call)
        self.air_brs_bag_result_status_call.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_status_call_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(0)
        }
        self.air_brs_bag_result_status_call.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.air_brs_bag_result_status_call_end_line_view.isHidden = true
        self.contentsView.addSubview(self.air_brs_bag_result_status_call_end_line_view)
        self.air_brs_bag_result_status_call_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_status_call.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(0)
        }
        
        self.air_brs_bag_result_re_search.addTarget(self, action: #selector(closeThisPage), for: .touchUpInside)
        self.contentsView.addSubview(self.air_brs_bag_result_re_search)
        self.air_brs_bag_result_re_search.snp.makeConstraints { (make) in
            make.top.equalTo(self.air_brs_bag_result_status_call_end_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
        self.air_brs_bag_result_re_search.addSubview(self.icon_home_search)
        self.icon_home_search.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
    }
    func setData(){
        self.tv_air_brs_bag_flight.text = airBrsBagData?.fltIden ?? ""
        self.tv_air_brs_bag_barcode.text = airBrsBagData?.bagTagNum ?? ""
        self.tv_air_brs_bag_result_dest_airport_name.text = CommonUtils.getLocaleString(locale: airBrsBagData?.localedDestinationAirport)
        self.tv_air_brs_bag_result_dest_airport_code.text = airBrsBagData?.destinationAirportCode ?? ""
        
        var isMyPlan = false
        
        if self.airBrsBagData?.remark != nil && self.airBrsBagData?.remark != "" && self.airBrsBagData?.remark != "GTC" && self.airBrsBagData?.remark != "DEP" && self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "usid == %@", self.airBrsBagData?.usid! as! CVarArg)) != nil{
            
            isMyPlan = true
            
        }
        
        if self.airBrsBagData?.transactId == "03" {
            
            self.iv_air_brs_result_status.image = UIImage(named: "air_brs_icon_bag_finish")
            
            self.air_brs_bag_result_status_1.text = "air_brs_bag_result_status_2".localized
            self.air_brs_bag_result_status_desc_1.text = ""
            self.air_brs_bag_result_status_desc_1_line_view.isHidden = true
            
            if self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "usid == %@", self.airBrsBagData?.usid! as! CVarArg)) != nil {
                updateBagBookmark(usid: self.airBrsBagData?.usid, fltNum: self.airBrsBagData?.fltIden, scheduleDt: self.airBrsBagData?.sdtDateFlt, bagTagNum: self.airBrsBagData?.bagTagNum, seatNo: self.airBrsBagData?.seatNo, isLoad: "Y")
                isMyPlan = false
            }
            
        }else if self.airBrsBagData?.transactId == "02" {
            
            self.iv_air_brs_result_status.image = UIImage(named: "air_brs_icon_bag_open")
            
            self.air_brs_bag_result_status_1.text = "air_brs_bag_result_status_3".localized
            self.air_brs_bag_result_status_desc_1.text = "air_brs_bag_result_status_desc_1".localized
        }else if self.airBrsBagData?.transactId == "04" || self.airBrsBagData?.transactId == "05" {
            self.iv_air_brs_result_status.image = UIImage(named: "air_brs_icon_bag_not_verify")
            
            self.air_brs_bag_result_status_1.text = ""
            if let remark = self.airBrsBagData?.remark, remark == "DEP" {
                self.air_brs_bag_result_status_desc_1.text = "air_brs_bag_result_status_desc_3".localized
            }else{
                self.air_brs_bag_result_status_desc_1.text = "air_brs_bag_result_status_desc_2".localized
            }
            
            self.air_brs_bag_result_status_1_view.isHidden = true
            self.air_brs_bag_result_status_1_view.snp.remakeConstraints { (make) in
                make.top.equalTo(self.ICN.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
            
        }
        
        if isMyPlan {
            updateBagBookmark(usid: self.airBrsBagData?.usid, fltNum: self.airBrsBagData?.fltIden, scheduleDt: self.airBrsBagData?.sdtDateFlt, bagTagNum: self.airBrsBagData?.bagTagNum, seatNo: self.airBrsBagData?.seatNo, isLoad: "N")
        }
        
    }
}
extension AirBrsBagResultViewController {
    @objc func callAirBrsBag(){
        
    }
    @objc func closeThisPage(){
        self.navigationController?.popViewController(animated: true)
    }
}
extension AirBrsBagResultViewController {
    func updateBagBookmark(usid: String?, fltNum: String?, scheduleDt: String?, bagTagNum: String?, seatNo: String?, isLoad: String?){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "updateBagBookmark")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.updateBagBookmark
        
        Session.default.request(
            apiUrl,
            method: .post,
            parameters: [
                "usid": usid ?? "",
                "fltNum": fltNum ?? "",
                "scheduleDt": scheduleDt ?? "",
                "bagTagNum": bagTagNum ?? "",
                "seatNo": seatNo ?? "",
                "isLoad": isLoad ?? ""
            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey, "deviceId": UserDefaultsUtils.getDeviceId()]
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
                        //                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        //                            let result = try? JSONDecoder().decode(BaseResult<[Notice]>.self, from: dataJson)
                        //
                        //                            self.notices = result?.data as! [Notice]
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                } else {
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
