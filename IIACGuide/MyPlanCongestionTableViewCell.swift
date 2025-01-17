//
//  MyPlanCongestionTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/22.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Charts

class MyPlanCongestionTableViewCell: MyPlanBaseTableViewCell {
    
    var compareDate = ""
    
    var passengerInfos = [PassengerInfo]()

    var terminalId : String? {
        didSet{
//            
//            self.myplan_speech_bubble_tail.snp.remakeConstraints { (make) in
//                make.leading.equalTo(self.dot_line_view.snp.centerX).offset(-20)
//                make.bottom.equalTo(self.myplan_icon_bullet.snp.top)
//            }
////
//            self.white_background_view.snp.remakeConstraints { (make) in
//                make.top.equalTo(self.myplan_passenger_dep_con_title_1.snp.bottom).offset(SizeUtils.topMargin)
//                make.leading.equalTo(self.myplan_speech_bubble_tail.snp.trailing).offset(-10)
//                make.trailing.bottom.equalToSuperview().offset(-SizeUtils.sideMargin)
//            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_con_desc_1)
            self.myplan_passenger_dep_con_desc_1.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.white_background_view.addSubview(self.myplan_dep_chart)
            self.myplan_dep_chart.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(viewWidth * 2 / 5)
            }
            self.white_background_view.addSubview(self.myplan_passenger_dep_con_desc_2)
            self.myplan_passenger_dep_con_desc_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_dep_chart.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            self.white_background_view.addSubview(self.myplan_passenger_dep_con_desc_3)
            self.myplan_passenger_dep_con_desc_3.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_desc_2.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.white_background_view.addSubview(self.myplan_passenger_dep_con_desc_4)
            self.myplan_passenger_dep_con_desc_4.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_desc_3.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            
            self.custom_myplan_con_desc_bg.isUserInteractionEnabled = true
            self.custom_myplan_con_desc_bg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPassengerDescView)))
            self.white_background_view.addSubview(self.custom_myplan_con_desc_bg)
            self.custom_myplan_con_desc_bg.snp.makeConstraints { (make) in
                make.leading.equalTo(self.myplan_passenger_dep_con_desc_4.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.myplan_passenger_dep_con_desc_4)
                make.size.equalTo(SizeUtils.contentsBig + 2)
            }
            
            self.flight_search_title_view.isUserInteractionEnabled = true
            self.flight_search_title_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCongestionInfo)))
            self.white_background_view.addSubview(self.flight_search_title_view)
            self.flight_search_title_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_desc_4.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.viewWidth * 2 / 3)
                make.height.equalTo(35)
            }
            
            self.flight_search_title_view.addSubview(self.flight_search_title)
            self.flight_search_title.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset(-(SizeUtils.iconSize + SizeUtils.sideMargin) / 2)
                make.centerY.equalToSuperview()
            }
            self.flight_search_title_view.addSubview(self.myplan_flight_search)
            self.myplan_flight_search.snp.makeConstraints { (make) in
                make.leading.equalTo(self.flight_search_title.snp.trailing).offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSize)
            }
            
            self.white_background_view.addSubview(self.passenger_desc_view)
            self.passenger_desc_view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            self.passenger_desc_view.addSubview(self.myplan_passenger_dep_con_desc_4_2)
            self.myplan_passenger_dep_con_desc_4_2.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.centerX.equalToSuperview()
            }
            self.passenger_desc_view.addSubview(self.myplan_passenger_dep_con_desc_4_line_view)
            self.myplan_passenger_dep_con_desc_4_line_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_desc_4_2.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
            
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_1_view)
            self.passenger_t1_desc_1_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_con_desc_4_line_view.snp.bottom).offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            self.passenger_desc_view.addSubview(self.myplan_passenger_dep_con_smooth)
            self.myplan_passenger_dep_con_smooth.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_1_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_1_view)
            }
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_1)
            self.passenger_t1_desc_1.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_1_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.top.equalTo(self.myplan_passenger_dep_con_smooth.snp.bottom)
            }
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_2_view)
            self.passenger_t1_desc_2_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_t1_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            self.passenger_desc_view.addSubview(self.myplan_passenger_dep_con_ordinary)
            self.myplan_passenger_dep_con_ordinary.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_2_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_2_view)
            }
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_2)
            self.passenger_t1_desc_2.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_2_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.top.equalTo(self.myplan_passenger_dep_con_ordinary.snp.bottom)
            }
            
            
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_3_view)
            self.passenger_t1_desc_3_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_t1_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            self.passenger_desc_view.addSubview(self.myplan_passenger_dep_con_crowded)
            self.myplan_passenger_dep_con_crowded.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_3_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_3_view)
            }
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_3)
            self.passenger_t1_desc_3.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_3_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.top.equalTo(self.myplan_passenger_dep_con_crowded.snp.bottom)
            }
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_4_view)
            self.passenger_t1_desc_4_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.passenger_t1_desc_3.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            self.passenger_desc_view.addSubview(self.myplan_passenger_dep_con_very_crowded)
            self.myplan_passenger_dep_con_very_crowded.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_4_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.centerY.equalTo(self.passenger_t1_desc_4_view)
            }
            self.passenger_desc_view.addSubview(self.passenger_t1_desc_4)
            self.passenger_t1_desc_4.snp.makeConstraints { (make) in
                make.leading.equalTo(self.passenger_t1_desc_4_view.snp.trailing).offset(SizeUtils.contentsMargin)
                make.top.equalTo(self.myplan_passenger_dep_con_very_crowded.snp.bottom)
            }
            
            self.common_close.isUserInteractionEnabled = true
            self.common_close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePassengerDescView)))
            self.passenger_desc_view.addSubview(self.common_close)
            self.common_close.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(self.passenger_t1_desc_4.snp.bottom).offset(SizeUtils.verticalMargin)
            }
            
            if self.terminalId == "P03" {
                self.passenger_t1_desc_1.text = "passenger_t2_desc_1".localized
                self.passenger_t1_desc_2.text = "passenger_t2_desc_2".localized
                self.passenger_t1_desc_3.text = "passenger_t2_desc_3".localized
                self.passenger_t1_desc_4.text = "passenger_t2_desc_4".localized
            }
            
            self.passenger_desc_view.isHidden = true
            self.passenger_desc_view.snp.remakeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
            
            
            self.myplan_passenger_dep_con_desc_1.attributedText = "<span style='font-size: \(SizeUtils.contentsBig)px;'>\(String(format: "myplan_passenger_dep_con_desc_1".localized, "<b>\(self.terminalId?.convertToTerminalNoLong ?? "")</b>" as! CVarArg))</span>".htmlToAttributedString
            
            self.getPassengerMyPlan()
        }
    }
    
    private let myplan_passenger_dep_con_desc_1 : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_dep_chart : BarChartView = {
        let chart = BarChartView()
        chart.sizeToFit()
        return chart
    }()
    
    private let myplan_passenger_dep_con_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_con_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_con_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let custom_myplan_con_desc_bg : UILabel = {
        let label = UILabel()
        label.text = "!"
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.cornerRadius = (SizeUtils.contentsBig + 2) / 2
        label.layer.borderWidth = 1
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText).cgColor
        label.sizeToFit()
        return label
    }()
    private let flight_search_title_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = 35 / 2
        view.sizeToFit()
        return view
    }()
    private let flight_search_title : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_btn_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let myplan_flight_search : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_flight_search")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let passenger_desc_view : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        return view
    }()
    private let myplan_passenger_dep_con_desc_4_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_con_desc_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    
    private let myplan_passenger_dep_con_smooth: UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_smooth".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_con_ordinary: UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_ordinary".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_con_crowded: UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_crowded".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_dep_con_very_crowded: UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_con_very_crowded".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_1: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let passenger_t1_desc_2: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_3: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    private let passenger_t1_desc_4: UILabel = {
        let label = UILabel()
        label.text = "passenger_t1_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private let passenger_t1_desc_1_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blue00ABFF)
        return view
    }()
    private let passenger_t1_desc_2_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.yellowFBFE00)
        return view
    }()
    private let passenger_t1_desc_3_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeFF5800)
        return view
    }()
    private let passenger_t1_desc_4_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redFF0000)
        return view
    }()
    
    private let common_close: UILabelPadding = {
        let label = UILabelPadding()
        label.text = "common_close".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.numberOfLines = 1
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText).cgColor
        label.sizeToFit()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MyPlanCongestionTableViewCell {
    @objc func tapCongestionInfo(){
        self.delegate?.tapCongestionInfo()
    }
    
    @objc func closePassengerDescView(){
        self.passenger_desc_view.isHidden = true
        self.passenger_desc_view.snp.remakeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
    }
    @objc func openPassengerDescView(){
        self.passenger_desc_view.isHidden = false
        self.passenger_desc_view.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
extension MyPlanCongestionTableViewCell {
    //    passenger
    func getPassengerMyPlan(){

        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getMyPlanPassengerInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.passenger + self.terminalId! + "/departures"
            
            Session.default.request(
                apiUrl,
                method: .get,
                parameters:
                [
                    "startDate": "\(CommonUtils.getDatePlusSec(start: CommonUtils.convertToDateFromStringDate(inputString: self.compareDate, inputFormat: "yyyyMMddkkmm"), sec: -60 * 60 * 2, format: "yyyyMMddkk"))00",
                    "endDate": "\(CommonUtils.getDatePlusSec(start: CommonUtils.convertToDateFromStringDate(inputString: self.compareDate, inputFormat: "yyyyMMddkkmm"), sec: 60 * 60 * 2, format: "yyyyMMddkk"))00"

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
                                let result = try? JSONDecoder().decode(BaseResult<[PassengerInfo]>.self, from: dataJson)
                                
                                self.passengerInfos = result?.data as! [PassengerInfo]
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                            
                            let temp = CommonUtils.convertToStringFromStringDate(inputString: self.compareDate, inputFormat: "yyyyMMddkkmm", outputFormat: "kk")
                            
                            if temp == "22" || temp == "23" || temp == "00" || temp == "01" || temp == "02" || temp == "03" {
                                self.passengerInfos.sort { (passengerInfo_0, passengerInfo_1) -> Bool in
                                    return Int(CommonUtils.convertToStringFromStringDate(inputString: "\(passengerInfo_0.date!)\(passengerInfo_0.time!)", inputFormat: "yyyyMMddkkmm", outputFormat: "ddkk")) ?? 0 < Int(CommonUtils.convertToStringFromStringDate(inputString: "\(passengerInfo_1.date!)\(passengerInfo_1.time!)", inputFormat: "yyyyMMddkkmm", outputFormat: "ddkk")) ?? 0
                                }
                            }
                            
                            var entries = [BarChartDataEntry]()
                            var labels = [String]()
                            
                            var i = 0
                            for passengerInfo in self.passengerInfos {
                                entries.append(BarChartDataEntry(x: Double(i), y: Double(passengerInfo.totalPassengers!)))
                                labels.append(CommonUtils.convertToStringFromStringDate(inputString: passengerInfo.time, inputFormat: "kkmm", outputFormat: "kk"))
                                i += 1
                            }
                            let dataSet = BarChartDataSet(entries: entries, label: "")
                            dataSet.setColor(NSUIColor(cgColor: ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blue00ABFF).cgColor))
                            
                            
                            self.myplan_dep_chart.pinchZoomEnabled = false
                            self.myplan_dep_chart.isUserInteractionEnabled = false
                            self.myplan_dep_chart.setScaleEnabled(false)
                            
                            self.myplan_dep_chart.xAxis.labelCount = 5
                            self.myplan_dep_chart.xAxis.labelPosition = .bottom
                            self.myplan_dep_chart.rightAxis.enabled = false
                            self.myplan_dep_chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
                            
                            let chartData = BarChartData(dataSet: dataSet)
                            
                            self.myplan_dep_chart.data = chartData
                            
                        } else {
                            
                        }
                    case .failure(let error):
                        print(error)
                    }
        }
    }
}
