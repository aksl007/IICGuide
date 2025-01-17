//
//  FlightSearchDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightSearchDetailViewController: BaseViewController {
    
    var type = "dep" // dep, arr
    
    var flightPid = ""
    
    var fromScheduleDate = ""
    var toScheduleDate = ""
    
    var originAirport = ""
    var airlineIataCode = ""
    var exitDoorNo = ""
    
    var terminalId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightSearchDetailViewController.self))
        self.initUi()
    }

    private let flightSearchSubTitleView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightSearchSubTitleImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let flightSearchSubTitle : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    private let flightSearchSubListView : UIView = {
        let view = UIView()
        view.sizeToFit()
        view.backgroundColor = .yellow
        return view
    }()
}
extension FlightSearchDetailViewController {
    
    func initUi(){
        setNavigationItems()

        self.view.addSubview(self.flightSearchSubTitleView)
        self.flightSearchSubTitleView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        self.flightSearchSubTitleView.addSubview(self.flightSearchSubTitleImage)
        self.flightSearchSubTitleImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.flightSearchSubTitle.text = "\("flights_departure_info_title".localized) (\(CommonUtils.convertToStringFromStringDate(inputString: self.fromScheduleDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy-MM-dd")))"
        if type == "arr" {
            self.flightSearchSubTitle.text = "\("flights_arrival_info_title".localized) (\(CommonUtils.convertToStringFromStringDate(inputString: self.fromScheduleDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy-MM-dd")))"
            self.flightSearchSubTitleImage.image = UIImage(named: "arrival_icon")
        }
        self.flightSearchSubTitleView.addSubview(self.flightSearchSubTitle)
        self.flightSearchSubTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.flightSearchSubTitleImage.snp.trailing).offset(SizeUtils.contentsMargin)
            make.centerY.equalToSuperview()
        }
        
        self.view.addSubview(self.flightSearchSubListView)
        self.flightSearchSubListView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightSearchSubTitleView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        let flightDepartureSubVC = FlightDepartureSubViewController()
        flightDepartureSubVC.isSearch = true
        flightDepartureSubVC.flightPid = self.flightPid
        flightDepartureSubVC.fromScheduleDate = self.fromScheduleDate
        flightDepartureSubVC.toScheduleDate = self.toScheduleDate
        flightDepartureSubVC.originAirport = self.originAirport
        flightDepartureSubVC.airlineIataCode = self.airlineIataCode
        flightDepartureSubVC.exitDoorNo = self.exitDoorNo
        flightDepartureSubVC.terminalId = self.terminalId
        flightDepartureSubVC.type = self.type
   

        addChild(flightDepartureSubVC)
        flightDepartureSubVC.view.frame = CGRect(x: 0, y: 0, width: self.flightSearchSubListView.frame.width, height: self.flightSearchSubListView.frame.height)
        self.flightSearchSubListView.addSubview(flightDepartureSubVC.view)
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "flight_search_title".localized)
        
    }
    
}
