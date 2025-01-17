//
//  FlightCardTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/10/06.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightCardTableViewCell: UITableViewCell {
    
    var viewWidth: CGFloat = 0.0
    
    var isMyPlan = false
    var isDeleteMode = false
    
    var type = "dep"
    var terminalType = "all"
    
    var flightDeparture : FlightDeparture? {
        didSet{
            
            self.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
            
            
            
            if self.type == "arr" {
                self.bg_schedule_list_dep.image = UIImage(named: "bg_schedule_list_arr")
                self.air4.image = UIImage(named: "air5")
                self.flights_departure_info_title.text = "flights_arrival_info_title".localized
                self.myplan_card_header_dep_date.text = "myplan_card_header_arr_date".localized
                
                self.flights_list_header_dest.text = "flights_list_header_origin".localized
                
                self.localedDestinationAirport.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedOriginAirport))
                self.counterNoRange.text = flightDeparture?.gateNo ?? "-"
                
                self.flights_list_header_gate.text = "flight_detail_arrival_exit".localized
                
                self.gateNo.text = flightDeparture?.exitDoorNo
                
                self.myplan_card_header_carousel.isHidden = false
                self.carouselNo.isHidden = false
                
                self.carouselNo.text = flightDeparture?.carouselNo
                
            }else{
                self.bg_schedule_list_dep.image = UIImage(named: "bg_schedule_list_dep")
                self.air4.image = UIImage(named: "air4")
                self.flights_departure_info_title.text = "flights_departure_info_title".localized
                self.myplan_card_header_dep_date.text = "myplan_card_header_dep_date".localized
                
                self.flights_list_header_dest.text = "flights_list_header_dest".localized

                self.localedDestinationAirport.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedDestinationAirport))
                self.counterNoRange.text = flightDeparture?.counterNoRange ?? "-"
                
                self.flights_list_header_gate.text = "flights_list_header_gate".localized
                
                self.gateNo.text = flightDeparture?.gateNo
                
                self.myplan_card_header_carousel.isHidden = true
                self.carouselNo.isHidden = true
            }

            
            if (flightDeparture?.estimateTime == nil || flightDeparture?.estimateTime == flightDeparture?.scheduleTime) {
                self.scheduleTime.attributedText = "\(CommonUtils.convertToStringFromStringDate(inputString: flightDeparture?.scheduleDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy/MM/dd/"))\(flightDeparture?.scheduleTime?.convertToTime ?? "")".noStrikeThrough()
                self.estimateTime.text = ""
            }else{
                self.scheduleTime.attributedText = "\(CommonUtils.convertToStringFromStringDate(inputString: flightDeparture?.scheduleDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy/MM/dd/"))\(flightDeparture?.scheduleTime?.convertToTime ?? "")".strikeThrough()
                self.estimateTime.text = "\(CommonUtils.convertToStringFromStringDate(inputString: flightDeparture?.estimateDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy/MM/dd/"))\( flightDeparture?.estimateTime?.convertToTime ?? "")"
            }

            self.suffixedFlightPid.text = flightDeparture?.suffixedFlightPid
            
            
            self.localedGeneralRemark.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedGeneralRemark))
            
            
            self.complete_view.isHidden = true
            if flightDeparture?.generalRemarkCode == "GTO" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeGTO)
            }else if flightDeparture?.generalRemarkCode == "BOR" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeBOR)
            }else if flightDeparture?.generalRemarkCode == "FIN" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeFIN)
            }else if flightDeparture?.generalRemarkCode == "GTC" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeGTC)
            }else if flightDeparture?.generalRemarkCode == "DEP" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeDEP)
                
                if isMyPlan {
                    self.complete_view.isHidden = false
                }else{
                    self.complete_view.isHidden = true
                }
            }else if flightDeparture?.generalRemarkCode == "DEL" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeDEL)
            }else if flightDeparture?.generalRemarkCode == "CNL" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeCNL)
            }else if flightDeparture?.generalRemarkCode == "DIV" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeDIV)
            }else if flightDeparture?.generalRemarkCode == "LND" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeLND)
            }else if flightDeparture?.generalRemarkCode == "ARR" {
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeARR)
                if isMyPlan {
                    self.complete_view.isHidden = false
                }else{
                    self.complete_view.isHidden = true
                }
            }else{
                self.localedGeneralRemark.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.codeARR)
            }
            
            
            self.addSubview(self.bg_schedule_list_dep)
            self.bg_schedule_list_dep.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.bottom.equalToSuperview().offset(-(SizeUtils.sideMargin - SizeUtils.contentsMargin))
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            }
            
            self.bg_schedule_list_dep.addSubview(self.cell0View)
            self.cell0View.snp.makeConstraints { (make) in
                make.top.leading.bottom.equalToSuperview()
                make.width.equalTo((self.viewWidth - SizeUtils.sideMargin * 2)/5)
            }
            
          
            self.cell0View.addSubview(self.flights_departure_info_title)
            self.flights_departure_info_title.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(SizeUtils.contentsMargin)
                make.centerX.equalToSuperview()
            }
            
            self.cell0View.addSubview(self.terminalNo)
            self.terminalNo.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(self.flights_departure_info_title.snp.bottom).offset(SizeUtils.contentsMargin)
            }
            self.cell0View.addSubview(self.air4)
            self.air4.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.flights_departure_info_title.snp.top).offset(-SizeUtils.contentsMargin)
                make.size.equalTo(SizeUtils.iconSize)
            }
            
            self.noShowCheckBox.isHidden = true
            self.cell0View.addSubview(self.noShowCheckBox)
            self.noShowCheckBox.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.air4.snp.top).offset(-SizeUtils.contentsMargin)
                make.size.equalTo(0)
            }
            
            self.bg_schedule_list_dep.addSubview(self.cell1View)
            self.cell1View.snp.makeConstraints { (make) in
                make.leading.equalTo(self.cell0View.snp.trailing)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview().dividedBy(2.3)
            }
            
            self.cell1View.addSubview(self.myplan_card_header_dep_date)
            self.myplan_card_header_dep_date.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            
            self.cell1View.addSubview(self.scheduleTime)
            self.scheduleTime.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_card_header_dep_date.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.cell1View.addSubview(self.estimateTime)
            self.estimateTime.snp.makeConstraints { (make) in
                make.top.equalTo(self.scheduleTime.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.equalToSuperview()
            }
            self.cell1View.addSubview(self.flight_search_flight_name)
            self.flight_search_flight_name.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(viewWidth / 2)
            }
            self.cell1View.addSubview(self.suffixedFlightPid)
            self.suffixedFlightPid.snp.makeConstraints { (make) in
                make.top.equalTo(self.flight_search_flight_name.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(viewWidth / 2)
            }
            
            self.bg_schedule_list_dep.addSubview(self.cell2View)
            self.cell2View.snp.makeConstraints { (make) in
                make.leading.equalTo(self.cell0View.snp.trailing)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview().multipliedBy(1.05)
            }
            
            self.cell2View.addSubview(self.flights_list_header_dest)
            self.flights_list_header_dest.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.cell2View.addSubview(self.localedDestinationAirport)
            self.localedDestinationAirport.snp.makeConstraints { (make) in
                make.top.equalTo(self.flights_list_header_dest.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.equalToSuperview()
            }
            
            self.cell2View.addSubview(self.flights_list_header_checkin)
            self.flights_list_header_checkin.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(viewWidth / 2)
            }
            self.cell2View.addSubview(self.counterNoRange)
            self.counterNoRange.snp.makeConstraints { (make) in
                make.top.equalTo(self.flights_list_header_checkin.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(viewWidth / 2)
            }
            
            self.bg_schedule_list_dep.addSubview(self.cell3View)
            self.cell3View.snp.makeConstraints { (make) in
                make.leading.equalTo(self.cell0View.snp.trailing)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview().multipliedBy(1.65)
            }
            self.cell3View.addSubview(self.flights_list_header_status)
            self.flights_list_header_status.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            self.cell3View.addSubview(self.localedGeneralRemark)
            self.localedGeneralRemark.snp.makeConstraints { (make) in
                make.top.equalTo(self.flights_list_header_status.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.bottom.equalToSuperview()
            }
            
            self.cell3View.addSubview(self.flights_list_header_gate)
            self.flights_list_header_gate.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(viewWidth / 2)
            }
            self.cell3View.addSubview(self.gateNo)
            self.gateNo.snp.makeConstraints { (make) in
                make.top.equalTo(self.flights_list_header_gate.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(viewWidth / 2)
            }
            
            self.cell3View.addSubview(self.myplan_card_header_carousel)
            self.myplan_card_header_carousel.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(viewWidth / 2 - 50)
            }
            self.cell3View.addSubview(self.carouselNo)
            self.carouselNo.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_card_header_carousel.snp.bottom).offset(2)
                make.leading.equalToSuperview().offset(viewWidth / 2 - 50)
            }
            
            self.bg_schedule_list_dep.addSubview(self.complete_view)
            self.complete_view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            self.complete_view.addSubview(self.myplan_card_close)
            self.myplan_card_close.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
            
            if isDeleteMode {
                self.noShowCheckBox.isSelected = flightDeparture!.isCheckDelete
                self.noShowCheckBox.isHidden = false
                self.noShowCheckBox.snp.remakeConstraints { (make) in
                    make.centerX.equalToSuperview()
                    make.bottom.equalTo(self.air4.snp.top).offset(-SizeUtils.contentsMargin)
                    make.size.equalTo(SizeUtils.iconSizeVerySmall)
                }
            }else{
                self.noShowCheckBox.isHidden = true
                self.noShowCheckBox.snp.remakeConstraints { (make) in
                    make.centerX.equalToSuperview()
                    make.bottom.equalTo(self.air4.snp.top).offset(-SizeUtils.contentsMargin)
                    make.size.equalTo(0)
                }
            }
        }
    }

    private let bg_schedule_list_dep : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_schedule_list_dep")
        imageView.contentMode = .scaleToFill
        imageView.sizeToFit()
        return imageView
    }()
    
    private let cell0View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let air4 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air4")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.black, alphaValue: 0.2).cgColor
        imageView.layer.cornerRadius = SizeUtils.iconSize / 2
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flights_departure_info_title : UILabel = {
        let label = UILabel()
        label.text = "flights_departure_info_title".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let terminalNo : UILabel = {
        let label = UILabel()
        label.text = "T1"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let cell1View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let myplan_card_header_dep_date : UILabel = {
        let label = UILabel()
        label.text = "myplan_card_header_dep_date".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let scheduleTime : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let estimateTime : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let flight_search_flight_name : UILabel = {
        let label = UILabel()
        label.text = "flight_search_flight_name".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let suffixedFlightPid : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let cell2View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let flights_list_header_dest : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_dest".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let localedDestinationAirport : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let flights_list_header_checkin : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_checkin".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let counterNoRange : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let cell3View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let flights_list_header_status : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_status".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let localedGeneralRemark : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let flights_list_header_gate : UILabel = {
        let label = UILabel()
        label.text = "flights_list_header_gate".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let gateNo : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let complete_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.black, alphaValue: 0.6)
        view.sizeToFit()
        return view
    }()
    
    private let myplan_card_close : UILabel = {
        let label = UILabel()
        label.text = "myplan_card_close".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let myplan_card_header_carousel : UILabel = {
        let label = UILabel()
        label.text = "myplan_card_header_carousel".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let carouselNo : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let noShowCheckBox : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_checkbox_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_checkbox_rel"), for: .selected)
        button.isSelected = false
//        button.addTarget(self, action: #selector(toggleChecker(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    
}
