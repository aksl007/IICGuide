//
//  FlightSeasonTableViewCell.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/09/30.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightSeasonTableViewCell: UITableViewCell {
    
    var cellWidth : CGFloat = 0.0
    var flightSeason: FlightSeason? {
        didSet {
            self.flight_season_airline = self.makeCell(label: self.flight_season_airline)
            self.flight_season_time = self.makeCell(label: self.flight_season_time)
            self.flight_season_period = self.makeCell(label: self.flight_season_period)
            
            
            self.addSubview(self.flight_season_airline)
            self.flight_season_airline.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.width.equalTo(self.cellWidth * 2)
                make.bottom.equalToSuperview()
            }
            self.addSubview(self.flight_season_time)
            self.flight_season_time.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_airline.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth * 1.5)
            }
            self.addSubview(self.flight_season_mon)
            self.flight_season_mon.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_time.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_mon.addSubview(self.flight_season_mon_image)
            self.flight_season_mon_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_tue)
            self.flight_season_tue.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_mon.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_tue.addSubview(self.flight_season_tue_image)
            self.flight_season_tue_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_wed)
            self.flight_season_wed.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_tue.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_wed.addSubview(self.flight_season_wed_image)
            self.flight_season_wed_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_thu)
            self.flight_season_thu.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_wed.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_thu.addSubview(self.flight_season_thu_image)
            self.flight_season_thu_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_fri)
            self.flight_season_fri.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_thu.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_fri.addSubview(self.flight_season_fri_image)
            self.flight_season_fri_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_sat)
            self.flight_season_sat.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_fri.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_sat.addSubview(self.flight_season_sat_image)
            self.flight_season_sat_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_sun)
            self.flight_season_sun.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_sat.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth)
            }
            self.flight_season_sun.addSubview(self.flight_season_sun_image)
            self.flight_season_sun_image.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVerySmall)
            }
            self.addSubview(self.flight_season_period)
            self.flight_season_period.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(self.flight_season_sun.snp.trailing)
                make.bottom.equalToSuperview()
                make.width.equalTo(self.cellWidth * 3.5)
            }
            
            
            self.flight_season_airline.text = "\(CommonUtils.getLocaleString(locale: flightSeason?.localedAirline))\n\(flightSeason?.suffixedFlightPid ?? "")"
            
            var tempTimeString = "T1"
            if self.flightSeason?.terminalNo == "P03" {
                tempTimeString = "T2"
            }
            tempTimeString += "\n\(CommonUtils.convertToStringFromStringDate(inputString: self.flightSeason?.scheduleTime, inputFormat: "kkmm", outputFormat: "kk:mm"))"
            
            self.flight_season_time.text = tempTimeString
            
            self.flight_season_mon_image.isHidden = !(self.flightSeason?.monday)!
            self.flight_season_tue_image.isHidden = !(self.flightSeason?.tuesday)!
            self.flight_season_wed_image.isHidden = !(self.flightSeason?.wednesday)!
            self.flight_season_thu_image.isHidden = !(self.flightSeason?.thursday)!
            self.flight_season_fri_image.isHidden = !(self.flightSeason?.friday)!
            self.flight_season_sat_image.isHidden = !(self.flightSeason?.saturday)!
            self.flight_season_sun_image.isHidden = !(self.flightSeason?.sunday)!
            
            self.flight_season_period.text = "\(CommonUtils.convertToStringFromStringDate(inputString: flightSeason?.flightStartDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy.MM.dd")) ~ \(CommonUtils.convertToStringFromStringDate(inputString: flightSeason?.flightEndDate, inputFormat: "yyyyMMdd", outputFormat: "yyyy.MM.dd"))"
            
        }
    }
    
    private var flight_season_airline : UILabel = {
        let label = UILabel()
        label.text = "flight_season_airline".localized
        return label
    }()
    private var flight_season_time : UILabel = {
        let label = UILabel()
        label.text = "flight_season_time".localized
        return label
    }()
    
    private let flight_season_mon : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_mon_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit

        imageView.sizeToFit()
        return imageView
    }()
    private let flight_season_tue : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_tue_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let flight_season_wed : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_wed_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let flight_season_thu : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_thu_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let flight_season_fri : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_fri_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let flight_season_sat : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_sat_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let flight_season_sun : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let flight_season_sun_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_dot")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private var flight_season_period : UILabel = {
        let label = UILabel()
        label.text = "flight_season_period".localized
        return label
    }()
    
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
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
