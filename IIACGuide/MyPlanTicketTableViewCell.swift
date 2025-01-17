//
//  MyPlanTicketTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/09/18.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanTicketTableViewCell: UITableViewCell {
    
    weak var delegate: MyPlanViewController?
    
    var viewWidth: CGFloat = 0.0
    
    var type = "dep"
        
    var flightDetail : FlightDetail?{
        didSet{
            
            self.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
            
            self.bg_schedule_passenger.isUserInteractionEnabled = true
            self.addSubview(self.bg_schedule_passenger)
            self.bg_schedule_passenger.snp.makeConstraints { (make) in
                make.top.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.bg_schedule_passenger.addSubview(self.top_view)
            self.top_view.snp.makeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(viewWidth * 55 / 375)
            }
            
            self.actionbar_reload.isUserInteractionEnabled = true
            self.actionbar_reload.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(refreshList)))
            self.top_view.addSubview(self.actionbar_reload)
            self.actionbar_reload.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            self.myplan_passenger_del.isUserInteractionEnabled = true
            self.myplan_passenger_del.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deleteList)))
            self.top_view.addSubview(self.myplan_passenger_del)
            self.myplan_passenger_del.snp.makeConstraints { (make) in
                make.trailing.equalTo(self.actionbar_reload.snp.leading).offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            self.top_view.addSubview(self.tv_myplan_passenger_arr_terminal)
            self.tv_myplan_passenger_arr_terminal.snp.makeConstraints { (make) in
                make.trailing.equalTo(self.myplan_passenger_del.snp.leading).offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
            }
            
            self.top_view.addSubview(self.tv_myplan_passenger_arr_flight_name_view)
            self.tv_myplan_passenger_arr_flight_name_view.snp.makeConstraints { (make) in
                make.leading.equalToSuperview()
                make.trailing.equalTo(self.tv_myplan_passenger_arr_terminal.snp.leading).offset(-SizeUtils.contentsMargin)
                make.centerY.equalToSuperview()
            }
            
            self.tv_myplan_passenger_arr_flight_name_view.addSubview(self.tv_myplan_passenger_arr_flight_name)
            self.tv_myplan_passenger_arr_flight_name.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.tv_myplan_passenger_arr_flight_name_view.addSubview(self.tv_myplan_passenger_arr_airline)
            self.tv_myplan_passenger_arr_airline.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_myplan_passenger_arr_flight_name.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.equalToSuperview()
            }
            
            self.bg_schedule_passenger.addSubview(self.top_2_view)
            self.top_2_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.top_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(viewWidth * 80 / 375)
            }
            
            self.top_2_view.addSubview(self.top_2_center_view)
            self.top_2_center_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            let cellSize = (viewWidth - SizeUtils.sideMargin * 2) / 5
            self.top_2_center_view.addSubview(self.myplan_passenger_incheon)
            self.myplan_passenger_incheon.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(cellSize * 2)
            }
            self.top_2_center_view.addSubview(self.ICN)
            self.ICN.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_incheon.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(cellSize * 2)
                make.bottom.equalToSuperview()
            }

            self.top_2_center_view.addSubview(self.tv_air_brs_bag_result_dest_airport_name)
            self.tv_air_brs_bag_result_dest_airport_name.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.width.equalTo(cellSize * 2)
            }
            self.top_2_center_view.addSubview(self.tv_air_brs_bag_result_dest_airport_code)
            self.tv_air_brs_bag_result_dest_airport_code.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_air_brs_bag_result_dest_airport_name.snp.bottom).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.width.equalTo(cellSize * 2)
            }
            
            self.top_2_center_view.addSubview(self.myplan_passenger_ticket_arrow_view)
            self.myplan_passenger_ticket_arrow_view.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.width.equalTo(cellSize)
            }
            self.myplan_passenger_ticket_arrow_view.addSubview(self.localedVia1Front)
            self.localedVia1Front.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.centerX.equalToSuperview()
            }
            self.myplan_passenger_ticket_arrow_view.addSubview(self.localedVia1)
            self.localedVia1.snp.makeConstraints { (make) in
                make.top.equalTo(self.localedVia1Front.snp.bottom)
                make.centerX.equalToSuperview()
            }
            self.myplan_passenger_ticket_arrow_view.addSubview(self.myplan_passenger_ticket_arrow)
            self.myplan_passenger_ticket_arrow.snp.makeConstraints { (make) in
                make.top.equalTo(self.localedVia1.snp.bottom)
                make.centerX.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeSmall)
                make.bottom.equalToSuperview()
            }
           
            
            self.bg_schedule_passenger.addSubview(self.top_3_view)
            self.top_3_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.top_2_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(viewWidth * 90 / 375)
            }
            self.bg_schedule_passenger.addSubview(self.top_4_view)
            self.top_4_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.top_3_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(viewWidth * 120 / 375)
            }
            
            self.top_3_view.addSubview(self.top_3_center_view)
            self.top_3_center_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            self.top_3_center_view.addSubview(self.myplan_card_header_arr_date)
            self.myplan_card_header_arr_date.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.top_3_center_view.addSubview(self.tv_myplan_passenger_arr_sch_time)
            self.tv_myplan_passenger_arr_sch_time.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_card_header_arr_date.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.top_3_center_view.addSubview(self.tv_myplan_passenger_arr_est_time)
            self.tv_myplan_passenger_arr_est_time.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_myplan_passenger_arr_sch_time.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.equalToSuperview()
            }
            
            self.top_3_center_view.addSubview(self.flight_detail_flight_time)
            self.flight_detail_flight_time.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.centerX.equalTo(self.tv_air_brs_bag_result_dest_airport_name)
            }
            self.top_3_center_view.addSubview(self.tv_myplan_passenger_arr_elapse_time)
            self.tv_myplan_passenger_arr_elapse_time.snp.makeConstraints { (make) in
                make.top.equalTo(self.flight_detail_flight_time.snp.bottom)
                make.centerX.equalTo(self.tv_air_brs_bag_result_dest_airport_name)
            }
            
            self.top_4_view.addSubview(self.top_4_center_view)
            self.top_4_center_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(-5)
                make.leading.trailing.equalToSuperview()
            }
            
            self.top_4_view.addSubview(self.top_4_center_view)
            self.top_4_center_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            self.top_4_center_view.addSubview(self.flights_list_header_gate)
            self.flights_list_header_gate.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.top_4_center_view.addSubview(self.tv_myplan_passenger_arr_gate)
            self.tv_myplan_passenger_arr_gate.snp.makeConstraints { (make) in
                make.top.equalTo(self.flights_list_header_gate.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.top_4_center_view.addSubview(self.myplan_passenger_locate_1)
            self.myplan_passenger_locate_1.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.tv_myplan_passenger_arr_gate)
                make.leading.equalTo(self.tv_myplan_passenger_arr_gate.snp.trailing).offset(SizeUtils.contentsMargin)
            }
            self.top_4_center_view.addSubview(self.myplan_card_header_carousel)
            self.myplan_card_header_carousel.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_myplan_passenger_arr_gate.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.top_4_center_view.addSubview(self.tv_myplan_passenger_arr_carousel)
            self.tv_myplan_passenger_arr_carousel.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_card_header_carousel.snp.bottom)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.equalToSuperview()
            }
            
            self.top_4_center_view.addSubview(self.myplan_card_header_exit)
            self.myplan_card_header_exit.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalTo(self.flights_list_header_gate)
            }
            self.top_4_center_view.addSubview(self.tv_myplan_passenger_arr_exit)
            self.tv_myplan_passenger_arr_exit.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_card_header_exit.snp.bottom)
                make.centerX.equalToSuperview()
            }
            self.top_4_center_view.addSubview(self.myplan_passenger_locate_2)
            self.myplan_passenger_locate_2.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.tv_myplan_passenger_arr_exit)
                make.leading.equalTo(self.tv_myplan_passenger_arr_exit.snp.trailing).offset(SizeUtils.contentsMargin)
            }
            
            self.top_4_center_view.addSubview(self.flights_list_header_status)
            self.flights_list_header_status.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.centerX.equalTo(self.tv_air_brs_bag_result_dest_airport_name).offset(SizeUtils.sideMargin)
            }
            self.top_4_center_view.addSubview(self.tv_myplan_passenger_arr_status)
            self.tv_myplan_passenger_arr_status.snp.makeConstraints { (make) in
                make.top.equalTo(self.flights_list_header_status.snp.bottom)
                make.centerX.equalTo(self.tv_air_brs_bag_result_dest_airport_name).offset(SizeUtils.sideMargin)
            }
            self.top_4_center_view.addSubview(self.myplan_passenger_arr_weather)
            self.myplan_passenger_arr_weather.snp.makeConstraints { (make) in
                make.top.equalTo(self.tv_myplan_passenger_arr_status.snp.bottom).offset(SizeUtils.contentsMargin)
                make.centerX.equalTo(self.tv_air_brs_bag_result_dest_airport_name).offset(SizeUtils.sideMargin)
            }
            self.top_4_center_view.addSubview(self.tv_myplan_passenger_arr_weather)
            self.tv_myplan_passenger_arr_weather.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_arr_weather.snp.bottom)
                make.centerX.equalTo(self.tv_air_brs_bag_result_dest_airport_name).offset(SizeUtils.sideMargin)
            }
            
            
            self.tv_myplan_passenger_arr_flight_name.text = self.flightDetail?.suffixedFlightPid
            self.tv_myplan_passenger_arr_airline.text = CommonUtils.getLocaleString(locale: self.flightDetail?.localedAirline)
            
            if self.flightDetail?.terminalNo == "P03" {
                self.tv_myplan_passenger_arr_terminal.text = "T2"
            }
            
            if self.flightDetail?.localedVia1 != nil {
                self.localedVia1.text = CommonUtils.getLocaleString(locale: self.flightDetail?.localedVia1)
                self.localedVia1Front.text = "myplan_passenger_via".localized
            }
            
            
            if self.type == "arr" {
                self.tv_air_brs_bag_result_dest_airport_name.text = "myplan_passenger_incheon".localized
                self.tv_air_brs_bag_result_dest_airport_code.text = "ICN"
                
                self.myplan_passenger_incheon.text = CommonUtils.getLocaleString(locale: self.flightDetail?.localedOriginAirport)
                self.ICN.text = self.flightDetail?.originAirportCode

            }else {
                self.tv_air_brs_bag_result_dest_airport_name.text = CommonUtils.getLocaleString(locale: self.flightDetail?.localedDestinationAirport)
                self.tv_air_brs_bag_result_dest_airport_code.text = self.flightDetail?.destinationAirportCode
            }
            
            if self.type == "dep"{
                self.myplan_card_header_arr_date.text = "myplan_card_header_dep_date".localized
            }
            
            if self.flightDetail?.estimateTime != nil {
                self.tv_myplan_passenger_arr_sch_time.attributedText = CommonUtils.convertToStringFromStringDate(inputString: "\((self.flightDetail?.scheduleDate)!)\((self.flightDetail?.scheduleTime)!)", inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy/MM/dd/kk:mm").strikeThrough()
                tv_myplan_passenger_arr_est_time.text = CommonUtils.convertToStringFromStringDate(inputString: "\((self.flightDetail?.estimateDate)!)\((self.flightDetail?.estimateTime)!)", inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy/MM/dd/kk:mm")
                
            }else{
                tv_myplan_passenger_arr_est_time.text = ""
                self.tv_myplan_passenger_arr_sch_time.text = CommonUtils.convertToStringFromStringDate(inputString: "\((self.flightDetail?.scheduleDate)!)\((self.flightDetail?.scheduleTime)!)", inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy/MM/dd/kk:mm")
            }
            
            if self.flightDetail?.elapseTime != nil {
                self.tv_myplan_passenger_arr_elapse_time.text = String(format: "flight_detail_elapse_time".localized, self.flightDetail?.elapseTime?.convertToHH as! CVarArg, self.flightDetail?.elapseTime?.convertTomm as! CVarArg)
            }else{
                self.tv_myplan_passenger_arr_elapse_time.text = "-"
            }
        
            if self.flightDetail?.localedGeneralRemark != nil {
                self.tv_myplan_passenger_arr_status.text = CommonUtils.getLocaleString(locale: self.flightDetail?.localedGeneralRemark)
            }
            
            
            if self.type == "dep" {
                self.flights_list_header_gate.text = "flights_list_header_checkin".localized
                self.myplan_card_header_carousel.text = "flight_detail_walk_time".localized
                self.myplan_card_header_exit.text = "flights_list_header_gate".localized
                self.myplan_passenger_arr_weather.text = "myplan_passenger_dep_weather".localized
                
                if self.flightDetail?.counterNoRange != nil {
                    self.tv_myplan_passenger_arr_gate.text = self.flightDetail?.counterNoRange
                }
                if self.flightDetail?.counterUsid == nil {
                    self.myplan_passenger_locate_1.isHidden = true
                }
                self.tv_myplan_passenger_arr_exit.text = self.flightDetail?.gateNo
                if self.flightDetail?.gateUsid == nil {
                    self.myplan_passenger_locate_2.isHidden = true
                }

                
                if self.flightDetail?.walkingTime == nil {
                    self.tv_myplan_passenger_arr_carousel.text = "-"
                }else{
                    self.tv_myplan_passenger_arr_carousel.text = "\(self.flightDetail?.walkingTime ?? 0)\("flight_detail_walk_time_1".localized) \("flight_detail_walk_time_2".localized)"
                }
                
                if self.flightDetail?.destinationLowTemperature != nil {
                    self.tv_myplan_passenger_arr_weather.text = "\(CommonUtils.getTemperature(temperature: self.flightDetail?.destinationLowTemperature))/\(CommonUtils.getTemperature(temperature:self.flightDetail?.destinationHighTemperature))"
                }
            }else{
                
                if self.flightDetail?.gateNo != nil {
                    self.tv_myplan_passenger_arr_gate.text = self.flightDetail?.gateNo
                }
                self.myplan_passenger_locate_1.isHidden = true
                
                self.tv_myplan_passenger_arr_exit.text = self.flightDetail?.exitDoorNo
                if self.flightDetail?.exitDoorUsid == nil {
                    self.myplan_passenger_locate_2.isHidden = true
                }
               
                
                if self.flightDetail?.carouselNo == nil {
                    self.tv_myplan_passenger_arr_carousel.text = "-"
                }else{
                    self.tv_myplan_passenger_arr_carousel.text = self.flightDetail?.carouselNo
                }
                
                if self.flightDetail?.originLowTemperature != nil {
                    self.tv_myplan_passenger_arr_weather.text = "\(CommonUtils.getTemperature(temperature: self.flightDetail?.originLowTemperature))/\(CommonUtils.getTemperature(temperature:self.flightDetail?.originLowTemperature))"
                }
                
            }
            
        }
    }
    
    private let bg_schedule_passenger : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_schedule_passenger")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let top_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let tv_myplan_passenger_arr_flight_name_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let tv_myplan_passenger_arr_flight_name : UILabel = {
        let label = UILabel()
        label.text = "OZ7031"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_airline : UILabel = {
        let label = UILabel()
        label.text = "아시아나항공1"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let tv_myplan_passenger_arr_terminal : UILabelPadding = {
        let label = UILabelPadding()
        label.text = "T1"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white).cgColor
        label.layer.cornerRadius = 10
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_del : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_passenger_del")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    private let actionbar_reload : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "actionbar_reload")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let top_2_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let top_2_center_view : UIView = {
        let view = UIView()
        view.sizeToFit()
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
    
    private let myplan_passenger_ticket_arrow_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let localedVia1Front : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenBackground).cgColor
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = false
        label.sizeToFit()
        return label
    }()
    private let localedVia1 : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.textAlignment = .center
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
    
    private let top_3_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let top_3_center_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let myplan_card_header_arr_date : UILabel = {
        let label = UILabel()
        label.text = "myplan_card_header_arr_date".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_sch_time : UILabel = {
        let label = UILabel()
        label.text = "2020/09/21/19:00".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_est_time : UILabel = {
        let label = UILabel()
        label.text = "2020/09/21/19:00".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let flight_detail_flight_time : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_flight_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_elapse_time : UILabel = {
        let label = UILabel()
        label.text = "03 시간 19 분".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let top_4_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let top_4_center_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let flights_list_header_gate : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_gate".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_gate : UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_locate_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_passenger_locate")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let myplan_card_header_carousel : UILabel = {
        let label = UILabel()
        label.text = "myplan_card_header_carousel".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_carousel : UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_card_header_exit : UILabel = {
        let label = UILabel()
        label.text = "myplan_card_header_exit".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_exit : UILabel = {
        let label = UILabel()
        label.text = "27"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let myplan_passenger_locate_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_passenger_locate")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flights_list_header_status : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_status".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_status : UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let myplan_passenger_arr_weather : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_arr_weather".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tv_myplan_passenger_arr_weather : UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
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
extension MyPlanTicketTableViewCell {
    @objc func refreshList(){
        self.delegate?.refreshList()
    }
    @objc func deleteList(){
        self.delegate?.deleteList()
    }
}
