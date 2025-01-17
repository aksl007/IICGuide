//
//  FlightInfoTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/08/05.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightInfoTableViewCell: UITableViewCell {
    
    var isMyPlan = false
    var isDeleteMode = false
    
    var type = "dep"
    var terminalType = "all"
    
    var flightDeparture : FlightDeparture? {
        didSet{
            
            if isDeleteMode {
                self.noShowCheckBox.isSelected = flightDeparture!.isCheckDelete
                self.noShowCheckBox.isHidden = false
                self.noShowCheckBox.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
                    make.size.equalTo(SizeUtils.iconSizeVerySmall)
                }
            }else{
                self.noShowCheckBox.isHidden = true
                self.noShowCheckBox.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
                    make.size.equalTo(0)
                }
            }

            if isMyPlan {
                self.scheduleDate.text = CommonUtils.convertToStringFromStringDate(inputString: flightDeparture?.scheduleDate, inputFormat: "yyyyMMdd", outputFormat: "MM-dd")
            }else {
                self.scheduleDate.text = ""
            }
            
            if (flightDeparture?.estimateTime == nil || flightDeparture?.estimateTime == flightDeparture?.scheduleTime) {
                self.scheduleTime.attributedText = flightDeparture?.scheduleTime?.convertToTime.noStrikeThrough()
                self.estimateTime.text = ""
            }else{
                self.scheduleTime.attributedText = flightDeparture?.scheduleTime?.convertToTime.strikeThrough()
                self.estimateTime.text = flightDeparture?.estimateTime?.convertToTime
            }
            
            if self.terminalType != "all" {
                self.terminalNo.text = ""
            }else{
                self.terminalNo.text = flightDeparture?.terminalNo?.convertToTerminalNo
            }
            
            self.suffixedFlightPid.text = flightDeparture?.suffixedFlightPid

            
            if flightDeparture?.localedVia1?.en == nil {
                self.localedVia1View.isHidden = true
            }else{
                self.localedVia1View.isHidden = false
                
            }
            self.localedVia1.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedVia1))
            self.localedGeneralRemark.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedGeneralRemark))
            self.localedDestinationAirport.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedDestinationAirport))
            
            if self.type == "arr" {
                self.localedDestinationAirport.text = CommonUtils.getLocaleString(locale: (flightDeparture?.localedOriginAirport))
            }
            
            self.counterNoRange.text = flightDeparture?.counterNoRange
            if self.type == "arr" {
                self.gateNo.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
                if flightDeparture?.carouselNo == nil {
                    self.counterNoRange.text = ""
                }else{
                    self.counterNoRange.attributedText = ((flightDeparture?.carouselNo)! + "/" + (flightDeparture?.exitDoorNo)!).lastTextRed()
                }
                
            }
            
            self.gateNo.text = flightDeparture?.gateNo
            
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

            if flightDeparture?.grayBackground ?? false {
                backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
            }else{
                backgroundColor = .white
            }
        }
    }
    
    private let cell0View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let cell1View : UIView = {
        let view = UIView()
        return view
    }()
    private let cell2View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let cell3View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let cell4View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let shadowView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let scheduleDate : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let scheduleTime : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
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
    private let terminalNo : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let suffixedFlightPid : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let localedGeneralRemark : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let localedDestinationAirport : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let localedVia1View : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let localedVia1Front : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_via".localized
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
    private let counterNoRange : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    private let gateNo : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: .regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.noShowCheckBox.isHidden = true
        addSubview(self.noShowCheckBox)
        self.noShowCheckBox.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.size.equalTo(0)
        }
        
        addSubview(self.cell0View)
        self.cell0View.snp.makeConstraints { (make) in
            make.leading.equalTo(self.noShowCheckBox.snp.trailing).offset(SizeUtils.contentsMargin)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.1)
        }
        addSubview(self.cell1View)
        self.cell1View.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(self.cell0View.snp.trailing)
            make.width.equalToSuperview().multipliedBy(0.07)
        }
        addSubview(self.cell2View)
        self.cell2View.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.cell1View.snp.trailing)
            make.width.equalToSuperview().multipliedBy(0.16)
        }
        
        addSubview(self.cell4View)
        self.cell4View.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.15)
        }
        
        addSubview(self.cell3View)
        self.cell3View.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.cell2View.snp.trailing)
            make.trailing.equalTo(self.cell4View.snp.leading)
        }
        addSubview(self.shadowView)
        self.shadowView.snp.makeConstraints { (make) in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.cell0View.addSubview(self.scheduleDate)
        self.scheduleDate.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        self.cell0View.addSubview(self.scheduleTime)
        self.scheduleTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.scheduleDate.snp.bottom).offset(2)
            make.leading.equalToSuperview()
        }
        self.cell0View.addSubview(self.estimateTime)
        self.estimateTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.scheduleTime.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.cell1View.addSubview(self.terminalNo)
        self.terminalNo.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        self.cell2View.addSubview(self.suffixedFlightPid)
        self.suffixedFlightPid.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        self.cell2View.addSubview(self.localedGeneralRemark)
        self.localedGeneralRemark.snp.makeConstraints { (make) in
            make.top.equalTo(self.suffixedFlightPid.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.cell3View.addSubview(self.localedDestinationAirport)
        self.localedDestinationAirport.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        self.cell3View.addSubview(self.localedVia1View)
        self.localedVia1View.snp.makeConstraints { (make) in
            make.top.equalTo(self.localedDestinationAirport.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.localedVia1View.addSubview(self.localedVia1Front)
        self.localedVia1Front.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(25)
        }
        self.localedVia1View.addSubview(self.localedVia1)
        self.localedVia1.snp.makeConstraints { (make) in
            make.leading.equalTo(self.localedVia1Front.snp.trailing).offset(3)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        self.cell4View.addSubview(self.counterNoRange)
        self.counterNoRange.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        self.cell4View.addSubview(self.gateNo)
        self.gateNo.snp.makeConstraints { (make) in
            make.top.equalTo(self.counterNoRange.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.complete_view.isHidden = true
        self.addSubview(self.complete_view)
        self.complete_view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
