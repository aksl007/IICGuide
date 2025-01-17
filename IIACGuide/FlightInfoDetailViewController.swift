//
//  FlightInfoDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FlightInfoDetailViewController: BaseViewController {
    
    var type = "dep"
    var fimsFlightId = ""
    
    var data : FlightDetail?
    
    var shareTab = "";
    var shareSchedule = "";
    var shareEstimate = "";
    var shareFlight = "";
    var shareAirport = "";
    var shareCarousel = "";
    var shareGate = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightInfoDetailViewController.self))
        initUi()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getFlightsDeparturesDetail()
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let cell0View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let flightDetailReservedView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightDetailActualView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let flightDetailReserved : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_reserved".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightDetailActual : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_actual".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightDetailReservedImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure_icon")
        imageView.sizeToFit()
        return imageView
    }()
    private let flightDetailActualImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure_icon")
        imageView.sizeToFit()
        return imageView
    }()
    private let suffixedFlightPid : UILabel = {
        let label = UILabel()
        label.text = "KE925"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let masterFlightPid : UILabel = {
        let label = UILabel()
        label.text = "KE925"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let localedAirline : UILabel = {
        let label = UILabel()
        label.text = "대한항공"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let localedMasterAirline : UILabel = {
        let label = UILabel()
        label.text = "대한항공"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let cell0LineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightDetailCodeshareInfo : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_codeshare_info".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let cell0EndLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let cell1View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightDetailIncheon : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_incheon".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let flightDetailIncheonDivide : UILabel = {
        let label = UILabel()
        label.text = "/"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let terminalNo : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let localedGeneralRemark : UILabelPadding = {
        let label = UILabelPadding()
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: .bold)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenBackground).cgColor
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = false
        label.sizeToFit()
        return label
    }()
    private let scheduleDate : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let scheduleTime : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let estimateDate : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let estimateTime : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let cell1EndLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let cell2View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let cell2StartLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let flightDetailFlightTimeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aftn_time_icon")
        imageView.sizeToFit()
        return imageView
    }()
    private let flightDetailFlightTime : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_flight_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let elapseTime : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let myplanPassengerVia : UILabelPadding = {
        let label = UILabelPadding()
        label.text = "myplan_passenger_via".localized
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .bold)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenBackground).cgColor
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = false
        label.sizeToFit()
        return label
    }()
    private let localedVia1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let cell2EndLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let cell3View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let cellOverseasView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let localedDestinationAirport : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.bold)
        label.sizeToFit()
        return label
    }()
    private let destinationTemperature : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let destinationWeatherCodeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "weather_icon_01")
        imageView.sizeToFit()
        return imageView
    }()
    private let arrivalDate : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let arrivalTime : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightDetailRoute1View : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    private let flightDetailCounter : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_counter".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let counterNoRange : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let counterUsidButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_position"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    private let flightDetailRoute2View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightDetailRoute2DotLine : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "info_dot_line02")
        imageView.sizeToFit()
        return imageView
    }()
    private let walkingTime : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightDetailRoute2ArriveView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    private let flightDetailArrivalCarousel : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_arrival_carousel".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let carouselNo : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let carouselUsidButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_position"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.clipsToBounds = true
        return button
    }()
    private let flightDetailBaggageView : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightDetailArrivalBaggageImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arr_baggage_finish")
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        return imageView
    }()
    private let flightDetailArrivalBaggage : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_arrival_baggage_finish".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let flightDetailRoute3View : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        view.sizeToFit()
        return view
    }()
    private let flightDetailArrivalGate : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_gate".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let gateNo : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let gateUsidButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_position"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.clipsToBounds = true
        return button
    }()
    private let cell3EndLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let cell4View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightDetailRegisterSchedule : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_register_schedule".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let registerScheduleButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_checkpng"), for: .normal)
        button.setImage(UIImage(named: "icon_schedule_delete"), for: .selected)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.clipsToBounds = true
        return button
    }()
    private let cell4EndLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let cell5View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let flightDetailShare : UILabel = {
        let label = UILabel()
        label.text = "flight_detail_share".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let shareButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_list_share"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.clipsToBounds = true
        return button
    }()
    private let cell5EndLineView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
}
extension FlightInfoDetailViewController {
    func initUi(){
        
        if self.type == "dep" {
            shareTab = "flights_departure_info_title".localized
        }else {
            shareTab = "flights_arrival_info_title".localized
        }
        self.setNavigationItemTitle(title: shareTab)
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getBottomPadding() - SizeUtils.tabHeight - 1)
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        self.contentsView.addSubview(self.cell0View)
        self.cell0View.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.cell0View.addSubview(self.flightDetailReservedView)
        self.flightDetailReservedView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(((self.view.frame.width - (SizeUtils.sideMargin * 2)) / 2))
        }
        self.cell0View.addSubview(self.flightDetailActualView)
        self.flightDetailActualView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(self.flightDetailReservedView.snp.trailing)
        }
        
        self.flightDetailReservedView.addSubview(self.flightDetailReserved)
        self.flightDetailReserved.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.width.equalTo((self.view.frame.width/2) - SizeUtils.sideMargin)
        }
        self.flightDetailActualView.addSubview(self.flightDetailActual)
        self.flightDetailActual.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.width.equalTo((self.view.frame.width/2) - SizeUtils.sideMargin)
        }
        self.flightDetailReservedView.addSubview(self.flightDetailReservedImage)
        self.flightDetailReservedImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailReserved.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.flightDetailReserved.snp.leading)
            make.size.equalTo(SizeUtils.iconSize)
            make.bottom.equalToSuperview()
        }
        self.flightDetailActualView.addSubview(self.flightDetailActualImage)
        self.flightDetailActualImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailActual.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.flightDetailActual.snp.leading)
            make.size.equalTo(SizeUtils.iconSize)
            make.bottom.equalToSuperview()
        }
        self.flightDetailReservedView.addSubview(self.suffixedFlightPid)
        self.suffixedFlightPid.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailReservedImage.snp.top)
            make.leading.equalTo(self.flightDetailReservedImage.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.flightDetailActualView.addSubview(self.masterFlightPid)
        self.masterFlightPid.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailActualImage.snp.top)
            make.leading.equalTo(self.flightDetailActualImage.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.flightDetailReservedView.addSubview(self.localedAirline)
        self.localedAirline.snp.makeConstraints { (make) in
            make.top.equalTo(self.suffixedFlightPid.snp.bottom)
            make.leading.equalTo(self.flightDetailReservedImage.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.flightDetailActualView.addSubview(self.localedMasterAirline)
        self.localedMasterAirline.snp.makeConstraints { (make) in
            make.top.equalTo(self.masterFlightPid.snp.bottom)
            make.leading.equalTo(self.flightDetailActualImage.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.cell0View.addSubview(self.cell0LineView)
        self.cell0LineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailReservedView.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.cell0View.addSubview(self.flightDetailCodeshareInfo)
        self.flightDetailCodeshareInfo.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell0LineView.snp.bottom).offset(SizeUtils.sideMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin * 2))
            
        }
        self.cell0View.addSubview(self.cell0EndLineView)
        self.cell0EndLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailCodeshareInfo.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.cell1View)
        self.cell1View.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell0View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        
        self.cell1View.addSubview(self.flightDetailIncheon)
        self.flightDetailIncheon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
        }
        self.cell1View.addSubview(self.flightDetailIncheonDivide)
        self.flightDetailIncheonDivide.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailIncheon)
            make.leading.equalTo(self.flightDetailIncheon.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.cell1View.addSubview(self.terminalNo)
        self.terminalNo.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailIncheon)
            make.leading.equalTo(self.flightDetailIncheonDivide.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.cell1View.addSubview(self.localedGeneralRemark)
        self.localedGeneralRemark.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailIncheon)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.cell1View.addSubview(self.scheduleDate)
        self.scheduleDate.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailIncheon.snp.bottom)
            make.leading.equalTo(self.flightDetailIncheon.snp.leading)
        }
        self.cell1View.addSubview(self.scheduleTime)
        self.scheduleTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.scheduleDate.snp.bottom)
            make.leading.equalTo(self.flightDetailIncheon.snp.leading)
            
        }
        self.cell1View.addSubview(self.estimateDate)
        self.estimateDate.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailIncheon.snp.bottom)
            make.leading.equalTo(self.scheduleDate.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.cell1View.addSubview(self.estimateTime)
        self.estimateTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.scheduleDate.snp.bottom)
            make.leading.equalTo(self.scheduleTime.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.cell1View.addSubview(self.cell1EndLineView)
        self.cell1EndLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.scheduleTime.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.cell2View)
        self.cell2View.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell1View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        
        self.cell2View.addSubview(self.cell2StartLineView)
        self.cell2StartLineView.isHidden = true
        self.cell2StartLineView.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.cell2View.addSubview(self.flightDetailFlightTimeImage)
        self.flightDetailFlightTimeImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSizeBig)
            
        }
        self.cell2View.addSubview(self.flightDetailFlightTime)
        self.flightDetailFlightTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailFlightTimeImage.snp.top)
            make.leading.equalTo(self.flightDetailFlightTimeImage.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.cell2View.addSubview(self.elapseTime)
        self.elapseTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailFlightTime.snp.bottom)
            make.leading.equalTo(self.flightDetailFlightTimeImage.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.cell2View.addSubview(self.localedVia1)
        self.localedVia1.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailFlightTime.snp.centerY)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.cell2View.addSubview(self.myplanPassengerVia)
        self.myplanPassengerVia.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailFlightTime.snp.centerY)
            make.trailing.equalTo(self.localedVia1.snp.leading).offset(-SizeUtils.contentsMargin)
        }
        self.cell2View.addSubview(self.cell2EndLineView)
        self.cell2EndLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailFlightTimeImage.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.cellOverseasView)
        self.cellOverseasView.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell2View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        self.cellOverseasView.addSubview(self.localedDestinationAirport)
        self.localedDestinationAirport.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
        }
        self.cellOverseasView.addSubview(self.destinationTemperature)
        self.destinationTemperature.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.localedDestinationAirport.snp.centerY)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        self.cellOverseasView.addSubview(self.destinationWeatherCodeImage)
        self.destinationWeatherCodeImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.localedDestinationAirport.snp.centerY)
            make.trailing.equalTo(self.destinationTemperature.snp.leading)
        }
        self.cellOverseasView.addSubview(self.arrivalDate)
        self.arrivalDate.snp.makeConstraints { (make) in
            make.top.equalTo(self.localedDestinationAirport.snp.bottom)
            make.leading.equalTo(self.localedDestinationAirport.snp.leading)
        }
        self.cellOverseasView.addSubview(self.arrivalTime)
        self.arrivalTime.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.arrivalDate)
            make.leading.equalTo(self.arrivalDate.snp.trailing).offset(SizeUtils.contentsMargin)
            make.bottom.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.cell3View)
        self.cell3View.snp.makeConstraints { (make) in
            make.top.equalTo(self.cellOverseasView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        
        self.cell3View.addSubview(self.flightDetailRoute1View)
        self.flightDetailRoute1View.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.flightDetailRouteHeight)
        }
        self.flightDetailRoute1View.addSubview(self.flightDetailCounter)
        self.flightDetailCounter.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        self.counterUsidButton.addTarget(self, action: #selector(self.clickCounterUsid(_:)), for: .touchUpInside)
        self.flightDetailRoute1View.addSubview(self.counterUsidButton)
        self.counterUsidButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.flightDetailRoute1View.addSubview(self.counterNoRange)
        self.counterNoRange.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.counterUsidButton.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        self.cell3View.addSubview(self.flightDetailRoute2View)
        self.flightDetailRoute2View.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailRoute1View.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.flightDetailRouteHeight)
        }
        self.flightDetailRoute2View.addSubview(self.flightDetailRoute2DotLine)
        self.flightDetailRoute2DotLine.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        self.flightDetailRoute2View.addSubview(self.walkingTime)
        self.walkingTime.snp.makeConstraints { (make) in
            make.leading.equalTo(self.flightDetailRoute2DotLine.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
        }
        self.cell3View.addSubview(self.flightDetailRoute2ArriveView)
        self.flightDetailRoute2ArriveView.isHidden = true
        self.flightDetailRoute2ArriveView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailRoute1View.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
        self.flightDetailRoute2ArriveView.addSubview(self.flightDetailArrivalCarousel)
        self.flightDetailArrivalCarousel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        
        self.flightDetailRoute2ArriveView.addSubview(self.carouselUsidButton)
        self.carouselUsidButton.isHidden = true
        self.carouselUsidButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.flightDetailRoute2ArriveView.addSubview(self.carouselNo)
        self.carouselNo.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.carouselUsidButton.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        self.flightDetailRoute2ArriveView.addSubview(self.flightDetailBaggageView)
        self.flightDetailBaggageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.flightDetailArrivalCarousel.snp.trailing).offset(SizeUtils.contentsMargin)
            make.trailing.equalTo(self.carouselNo.snp.leading).offset(-SizeUtils.contentsMargin)
            make.top.bottom.equalToSuperview()
        }
        self.flightDetailBaggageView.addSubview(self.flightDetailArrivalBaggageImage)
        self.flightDetailArrivalBaggageImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.flightDetailBaggageView.addSubview(self.flightDetailArrivalBaggage)
        self.flightDetailArrivalBaggage.snp.makeConstraints { (make) in
            make.leading.equalTo(self.flightDetailArrivalBaggageImage.snp.trailing).offset(SizeUtils.contentsMargin)
            make.centerY.equalToSuperview()
        }
        self.cell3View.addSubview(self.flightDetailRoute3View)
        self.flightDetailRoute3View.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailRoute2View.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.flightDetailRouteHeight)
        }
        self.flightDetailRoute3View.addSubview(self.flightDetailArrivalGate)
        self.flightDetailArrivalGate.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        self.gateUsidButton.addTarget(self, action: #selector(clickGateUsid(_:)), for: .touchUpInside)
        self.flightDetailRoute3View.addSubview(self.gateUsidButton)
        self.gateUsidButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.flightDetailRoute3View.addSubview(self.gateNo)
        self.gateNo.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.gateUsidButton.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        self.cell3View.addSubview(self.cell3EndLineView)
        self.cell3EndLineView.snp.makeConstraints { (make) in
            make.top.equalTo(flightDetailRoute3View.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.cell4View)
        self.cell4View.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell3View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        self.cell4View.addSubview(self.flightDetailRegisterSchedule)
        self.flightDetailRegisterSchedule.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
        }
        self.registerScheduleButton.addTarget(self, action: #selector(clickRegisterSchedule(_:)), for: .touchUpInside)
        self.cell4View.addSubview(self.registerScheduleButton)
        self.registerScheduleButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailRegisterSchedule)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.cell4View.addSubview(self.cell4EndLineView)
        self.cell4EndLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailRegisterSchedule.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }

        self.contentsView.addSubview(self.cell5View)
        self.cell5View.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell4View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
            make.bottom.equalTo(self.scrollView.snp.bottom)
        }

        self.cell5View.addSubview(self.flightDetailShare)
        self.flightDetailShare.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.sideMargin)
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
        }
        self.shareButton.addTarget(self, action: #selector(clickShare(_:)), for: .touchUpInside)
        self.cell5View.addSubview(self.shareButton)
        self.shareButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.flightDetailShare)
            make.trailing.equalToSuperview().offset(-SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.cell5View.addSubview(self.cell5EndLineView)
        self.cell5EndLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.flightDetailShare.snp.bottom).offset(SizeUtils.sideMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
    }
}
extension FlightInfoDetailViewController {
    @objc func clickCounterUsid(_ sender : UIButton){
        sender.preventRepeatedPresses()
        print("clickCounterUsid")
    }
    @objc func clickGateUsid(_ sender : UIButton){
        sender.preventRepeatedPresses()
        print("clickGateUsid")
    }
    @objc func clickRegisterSchedule(_ sender : UIButton){
//        sender.preventRepeatedPresses(inNext: 2)
        print("clickRegisterSchedule")
        Loading.show()
        
        var isRegister = false
        
        if CommonUtils.isPassenger() {
            
            let result = Array(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "flightType == %@ AND scheduleDate LIKE '*\(self.data!.scheduleDate!)*'", self.type)))
            
            if result.count > 0 {
                isRegister = true
            }
        }
        
        if sender.isSelected {
            try! self.realm.write {
                self.realm.delete(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "usid == %@", self.data!.usid!)))
            }
            sender.isSelected = !sender.isSelected
            
            self.deleteBookmark()
        }else{
            
            if isRegister {
                //등록 불가
                self.openOneButtonPopup(title: "home_bottom_menu_3".localized, contents: "myplan_passenger_register_warning".localized)
                Loading.hide()
            }else{
                //등록 가능
                //TODO PUSH
                try! self.realm.write {
                    self.data!.flightType = self.type
                    self.realm.add(self.data!)
                }
                sender.isSelected = !sender.isSelected
                
                self.registerBookmark()
            }
        }
        
        
    }
    @objc func clickShare(_ sender : UIButton){
        sender.preventRepeatedPresses()
        print("clickShare")
        
        var shareString = "[" + shareTab + "] " + shareSchedule + ", "
        if self.shareEstimate != "" {
            shareString += "flight_detail_share_msg_1".localized + " " + self.shareEstimate + " "
        }
        shareString += shareFlight + " "
        if self.type == "arr" {
            shareString += "From " + shareAirport
            if self.shareCarousel != "" {
                shareString += "flight_detail_share_msg_2".localized + shareCarousel
            }
            if self.shareGate != "" {
                shareString += "flight_detail_share_msg_3".localized + shareGate
            }
        }else{
            shareString += "To " + shareAirport
            if self.shareGate != "" {
                shareString += "flight_detail_share_msg_4".localized + shareGate
            }
        }
//        print("shareString: \(shareString)")
        let textToShare = [shareString]
        
        let shareVC = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        self.present(shareVC, animated: true, completion: nil)
    }
}
extension FlightInfoDetailViewController {
    func getFlightsDeparturesDetail(){
        
        Loading.show()
        
        
        
        var apiUrl = ServerUtils.serverUrl + ServerUtils.flightsDeparturesDetail + self.fimsFlightId
        if self.type == "arr" {
            apiUrl = ServerUtils.serverUrl + ServerUtils.flightsArrivalsDetail + self.fimsFlightId
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightArrDetail")
        }else{
            FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getFlightDepDetail")
        }
        
        Session.default.request(
            apiUrl,
            method: .get,
//            parameters:
//            [
//                "fromScheduleDate": CommonUtils.getTodayDate(format: "yyyyMMdd"),
//                "fromScheduleTime": "0000"
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
                            let result = try JSONDecoder().decode(BaseResult<FlightDetail>.self, from: dataJson)
                            
                            self.data = result.data
                        
                            
                        } catch {
                            print(error)
                            print(error.localizedDescription)
                        }
                        
                        self.setData()
                        
                    } else {
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
    
    func setData(){
        
        if Array(self.realm.objects(FlightDetail.self).filter(NSPredicate(format: "usid == %@", self.data!.usid!))).count > 0 {
            self.registerScheduleButton.isSelected = true
        }else{
            self.registerScheduleButton.isSelected = false
        }
        
        self.shareFlight = (self.data!.suffixedFlightPid)!
        self.suffixedFlightPid.text = self.shareFlight
        self.localedAirline.text = CommonUtils.getLocaleString(locale: self.data?.localedAirline)
        
        if self.data?.codeShareValue == "SL" && self.type == "dep" {
            self.masterFlightPid.text = self.data?.masterFlightPid
            self.localedMasterAirline.text = CommonUtils.getLocaleString(locale: self.data?.localedMasterAirline)
        }else{
            self.flightDetailReserved.text = ""
            self.flightDetailActual.text = ""
            self.flightDetailActualView.isHidden = true
            self.flightDetailCodeshareInfo.text = ""
            self.cell0LineView.isHidden = true
            
            self.flightDetailCodeshareInfo.snp.updateConstraints{ (make) in
                make.top.equalTo(self.cell0LineView.snp.bottom)
            }
            self.cell0EndLineView.snp.updateConstraints{ (make) in
                make.top.equalTo(self.flightDetailCodeshareInfo.snp.bottom)
            }
        }
        
        self.terminalNo.text = self.data?.terminalNo?.convertToTerminalNoLong
        if self.data?.generalRemarkCode == nil {
            self.localedGeneralRemark.isHidden = true
        }else{
            self.localedGeneralRemark.text = CommonUtils.getLocaleString(locale: self.data?.localedGeneralRemark)
        }
        
        self.scheduleDate.text = self.data?.scheduleDate?.convertToDate
        self.scheduleTime.text = self.data?.scheduleTime?.convertToTime
        
        self.shareSchedule = (self.data?.scheduleDate!.convertToDate)! + " " + (self.data?.scheduleTime!.convertToTime)!
        if self.data?.scheduleDate != self.data?.estimateDate && self.data?.estimateDate != nil {
            self.estimateDate.text = self.data?.estimateDate?.convertToDate
            self.scheduleDate.attributedText = self.data?.scheduleDate?.convertToDate.strikeThrough()
            self.shareEstimate = (self.data?.estimateDate!.convertToDate)!
        }
        if self.data?.scheduleTime != self.data?.estimateTime && self.data?.estimateTime != nil {
            self.estimateTime.text = self.data?.estimateTime?.convertToTime
            self.scheduleTime.attributedText = self.data?.scheduleTime?.convertToTime.strikeThrough()
            if self.shareEstimate == "" {
                self.shareEstimate = (self.data?.estimateTime!.convertToTime)!
            }else{
                self.shareEstimate += " " + (self.data?.estimateTime!.convertToTime)!
            }
            
        }
        
        if self.data?.via1IataCode == nil && self.data?.elapseTime == nil {
            self.cell2View.snp.remakeConstraints { (make) in
                make.top.equalTo(self.cell1View.snp.bottom)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
                make.height.equalTo(0)
            }
            self.cell2View.isHidden = true
        }else {
            self.localedVia1.text = CommonUtils.getLocaleString(locale: self.data?.localedVia1)
            if self.data?.via1IataCode == nil {
                self.myplanPassengerVia.isHidden = true
            }
            if self.data?.elapseTime != nil {
                self.elapseTime.text = String(format: "flight_detail_elapse_time".localized, self.data?.elapseTime?.convertToHH as! CVarArg, self.data?.elapseTime?.convertTomm as! CVarArg)
            }
        }
        
        if self.type == "arr"{
            self.setArrData()
        }else{
            self.setDepData()
        }
        
    }
    func setDepData(){
        self.shareAirport = CommonUtils.getLocaleString(locale: self.data?.localedDestinationAirport)
        self.localedDestinationAirport.text = CommonUtils.getLocaleString(locale: self.data?.localedDestinationAirport)
        self.arrivalDate.text = self.data?.arrivalDate?.convertToDate
        self.arrivalTime.text = self.data?.arrivalTime?.convertToTime
        self.destinationWeatherCodeImage.isHidden = true
        if self.data?.destinationLowTemperature != nil {
            self.destinationTemperature.text = "| \(CommonUtils.getTemperature(temperature: self.data?.destinationLowTemperature)), \(CommonUtils.getTemperature(temperature:self.data?.destinationHighTemperature))"
            self.destinationWeatherCodeImage.isHidden = false
            self.destinationWeatherCodeImage.image = CommonUtils.getWeatherImageByCode(code: self.data?.destinationWeatherCode)
        }
        
        if self.data?.counterNoRange == nil {
            self.flightDetailRoute1View.isHidden = true
            self.flightDetailRoute1View.snp.remakeConstraints{ (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.counterNoRange.text = self.data?.counterNoRange
            if self.data?.counterUsid == nil {
                self.counterUsidButton.isHidden = true
            }
        }
        
        self.walkingTime.text = "\("flight_detail_walk_time".localized) : \(self.data?.walkingTime ?? 0)\("flight_detail_walk_time_1".localized) \("flight_detail_walk_time_2".localized)"
        if self.data?.walkingTime == nil {
            self.flightDetailRoute2View.isHidden = true
            self.flightDetailRoute2View.snp.remakeConstraints { (make) in
                make.top.equalTo(self.flightDetailRoute1View.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }
        
        if self.data?.gateNo == nil {
            self.flightDetailRoute3View.isHidden = true
            self.flightDetailRoute3View.snp.remakeConstraints { (make) in
                make.top.equalTo(self.flightDetailRoute2View.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.shareGate = (self.data!.gateNo)!
            self.gateNo.text = self.data?.gateNo
            if self.data?.gateUsid == nil {
                self.gateUsidButton.isHidden = true
            }
        }
    }
    func setArrData(){
        self.flightDetailReservedImage.image = UIImage(named: "arrival_icon")
        self.shareAirport = CommonUtils.getLocaleString(locale: self.data?.localedOriginAirport)
        self.localedDestinationAirport.text = CommonUtils.getLocaleString(locale: self.data?.localedOriginAirport)
        self.arrivalDate.text = self.data?.departureDate?.convertToDate
        self.arrivalTime.text = self.data?.departureTime?.convertToTime
        
        self.destinationWeatherCodeImage.isHidden = true
        if self.data?.originLowTemperature != nil {
            self.destinationTemperature.text = "| \(CommonUtils.getTemperature(temperature: self.data?.originLowTemperature)), \(CommonUtils.getTemperature(temperature:self.data?.originHighTemperature))"
            self.destinationWeatherCodeImage.isHidden = false
            self.destinationWeatherCodeImage.image = CommonUtils.getWeatherImageByCode(code: self.data?.originWeatherCode)
        }

        self.cellOverseasView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.cell0View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        self.cell2View.snp.remakeConstraints { (make) in
            make.top.equalTo(self.cellOverseasView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        self.cell1View.snp.remakeConstraints { (make) in
            make.top.equalTo(self.cell2View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        self.cell3View.snp.remakeConstraints { (make) in
            make.top.equalTo(self.cell1View.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width - (SizeUtils.sideMargin) * 2)
        }
        self.cell1EndLineView.isHidden = true
        self.cell2StartLineView.isHidden = false

        self.flightDetailCounter.text = "flight_detail_arrival_gate".localized
        self.flightDetailArrivalGate.text = "flight_detail_arrival_exit".localized
        
        self.flightDetailRoute2View.isHidden = true
        self.flightDetailRoute2View.snp.remakeConstraints { (make) in
            make.top.equalTo(self.flightDetailRoute1View.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
        
        self.flightDetailRoute3View.snp.remakeConstraints { (make) in
            make.top.equalTo(self.flightDetailRoute2ArriveView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.flightDetailRouteHeight)
        }
        
        if self.data?.gateNo == nil {
            self.flightDetailRoute1View.isHidden = true
            self.flightDetailRoute1View.snp.remakeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.counterNoRange.text = self.data?.gateNo
            self.counterUsidButton.isHidden = true
        }
        if self.data?.carouselNo == nil {
            self.flightDetailRoute2ArriveView.isHidden = true
            self.flightDetailRoute2ArriveView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.flightDetailRoute1View.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.flightDetailRoute2ArriveView.isHidden = false
            self.flightDetailRoute2ArriveView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.flightDetailRoute1View.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(SizeUtils.flightDetailRouteHeight)
            }
            self.shareCarousel = (self.data!.carouselNo)!
            self.carouselNo.text = self.data?.carouselNo
            
        }
        
        if self.data?.exitDoorNo == nil {
            self.flightDetailRoute3View.isHidden = true
            self.flightDetailRoute3View.snp.remakeConstraints { (make) in
                make.top.equalTo(self.flightDetailRoute2View.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.shareGate = (self.data!.exitDoorNo)!
            self.gateNo.text = self.data?.exitDoorNo
            if self.data?.exitDoorUsid == nil {
                self.gateUsidButton.isHidden = true
            }
        }
        
        //baggage
        var isShow = false
        
        if self.data?.startBaggageDateTime != nil {
            isShow = true
        }
        if let last = self.data?.endBaggageDateTime, last != "" {
            
            let diffMin = CommonUtils.minDiffByString(start: last.replacingOccurrences(of: "T", with: ""), end: CommonUtils.getTodayDate(format: "yyyyMMddHHmm"), inputFormat: "yyyyMMddHHmm")
            if self.data?.terminalNo == "P02" {
                //after 40min
                if diffMin > 40 {
                    isShow = false
                }
            }else{
                //after 30min
                if diffMin > 30 {
                    isShow = false
                }
            }
        }else{
            //after 90min
            if self.data?.estimateTime != nil {
                let estimateTimestamp = (self.data?.estimateDate)! + (self.data?.estimateTime)!
                let diffMin = CommonUtils.minDiffByString(start: estimateTimestamp, end: CommonUtils.getTodayDate(format: "yyyyMMddHHmm"), inputFormat: "yyyyMMddHHmm")
                if diffMin > 90 {
                    isShow = false
                }
                
            }
        }
        
        if isShow {
            self.flightDetailBaggageView.isHidden = false
            if self.data?.baggageRemarkCode != "LBG" {
                //gif
                self.flightDetailArrivalBaggage.text = "flight_detail_arrival_baggage".localized
                self.flightDetailArrivalBaggageImage.image = UIImage.gif(asset: "arr_baggage_move")
            }
        }else{
            self.flightDetailBaggageView.isHidden = true
        }
    }
    
    func registerBookmark(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "registerBookmark")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.registerBookmark
        
        var flightType = "D"
        if self.type == "arr" {
            flightType = "A"
        }
        
        Session.default.request(
            apiUrl,
            method: .post,
            parameters: [
                "fimsId": self.fimsFlightId,
                "flightType": flightType
            ],
            encoding: JSONEncoding.default,
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
                Loading.hide()
            case .failure(let error):
                print(error)
                Loading.hide()
            }
        }
    }
    
    func deleteBookmark(){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "deleteBookmark")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.deleteBookmark + self.fimsFlightId
        
        Session.default.request(
            apiUrl,
            method: .delete,
//            parameters: [
//                "fimsId": ,
//                "flightType": flightType
//            ],
            encoding: JSONEncoding.default,
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
                Loading.hide()
            case .failure(let error):
                print(error)
                Loading.hide()
            }
        }
    }
}
