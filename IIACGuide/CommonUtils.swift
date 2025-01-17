//
//  CommonUtils.swift
//  incheon
//
//  Created by DD Dev on 2020/07/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//
import Foundation
import UIKit

class CommonUtils{
    
    static func getWindow() -> UIWindow {
        var window: UIWindow?
        window = UIApplication.shared.keyWindow
        return window!
    }
    
    static func getTopPadding() -> CGFloat {
        
        return UIApplication.shared.statusBarFrame.height
    }
    
    static func getBottomPadding() -> CGFloat {
        var window: UIWindow?
        window = UIApplication.shared.keyWindow
        if #available(iOS 11.0, *) {
            let bottomPadding = window?.safeAreaInsets.bottom
            return bottomPadding!
        } else {
            return 0.0
        }
    }

    static func getTodayDate(format : String) -> String {
        let today = NSDate() //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: getLocaleId())
        
        return dateFormatter.string(from: today as Date)
    }
    
    static func convertIntDateToDate(intDate: Int,format : String) -> Date {
        let today = NSDate(timeIntervalSince1970: TimeInterval(intDate * 100)) //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: getLocaleId())
        
        return today as Date
    }
    
    static func getWantedDate(format : String, sub : Int) -> String {
        let aDaySec = 86400
        let today = NSDate(timeIntervalSinceNow: TimeInterval(aDaySec * sub)) //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: getLocaleId())
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: today as Date)
    }
    
    static func getDatePlusSec(start: Date, sec : Int, format : String) -> String {

        let today = NSDate(timeInterval: TimeInterval(sec), since: start) //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: getLocaleId())
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: today as Date)
    }
    
    static func minDiff(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: start, to: end).minute!
    }
    static func minDiffByString(start: String, end: String, inputFormat:String) -> Int {
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = inputFormat
        
        let startDate = inFormatter.date(from: start )!
        let endDate = inFormatter.date(from: end )!
        
        return minDiff(start: startDate, end: endDate)
    }
    
    static func convertToStringFromStringDate(inputString:String?, inputFormat:String, outputFormat:String) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = inputFormat
        inFormatter.locale = Locale(identifier: getLocaleId())

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = outputFormat
        outFormatter.locale = Locale(identifier: getLocaleId())


        let date = inFormatter.date(from: inputString ?? "")!
        let outStr = outFormatter.string(from: date)
        
        return outStr
    }
    
    static func convertToDateFromStringDate(inputString:String?, inputFormat:String) -> Date {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = inputFormat
        inFormatter.locale = Locale(identifier: getLocaleId())

        return inFormatter.date(from: inputString ?? "")!
        
    }
    
    static func getLocaleId() -> String {
        
        if UserDefaultsUtils.getLocaleSetting() == "" {
            let localeID = Locale.preferredLanguages.first
            return (Locale(identifier: localeID!).languageCode)!
        }else{
           return UserDefaultsUtils.getLocaleSetting()
        }
    }
    
    static func getLocaleString(locale:Localed?) -> String {
        
        let localeId = getLocaleId()
        
        if localeId == "zh" {
            return locale?.zh ?? locale?.en ?? locale?.ko ?? ""
        }else if localeId == "ja" {
            return locale?.ja ?? locale?.en ?? locale?.ko ?? ""
        }else if localeId == "en" {
            return locale?.en ?? locale?.ko ?? ""
        }else if localeId == "ko" {
            return locale?.ko ?? locale?.en ?? ""
        }else {
            return locale?.en ?? locale?.ko ?? ""
        }
    }
    
    static func getLocaleReturnLang() -> String {
        
        let localeId = getLocaleId()
        
        if localeId == "zh" {
            return "zh_CN"
        }else if localeId == "ja" {
            return "ja_JP"
        }else if localeId == "en" {
            return "en_US"
        }else if localeId == "ko" {
            return "ko_KR"
        }else {
            return "ko_KR"
        }
    }
    
    
    static func isKorean() -> Bool {
        
        return getLocaleId() == "ko"
    }
    static func isPassenger() -> Bool {
        
        return UserDefaultsUtils.isMyPlanPassenger()
    }
    
    
    static func getTemperature(temperature:String?) -> String {
        
        if UserDefaultsUtils.isWeatherDisplaySetting() {
            
            let temp:Int = Int((temperature as! NSString).floatValue * 9.0 / 5.0 + 32.0)
            return "\(temp)\("setting_weather_fahrenheit_temp".localized)"
        }else{
            return "\(temperature ?? "")\("setting_weather_celsius_temp".localized)"
        }
        
    }
    
    static func getWeatherImageByCode(code:String?) -> UIImage {
        if code == "PartlyCloudy" {
            return UIImage(named: "weather_icon_02")!
        } else if code == "Cloudy" {
            return UIImage(named: "weather_icon_04")!
        } else if code == "Murky" {
            return UIImage(named: "weather_icon_03")!
        } else if code == "MurkyRain" {
            return UIImage(named: "weather_icon_05")!
        } else if code == "MurkySnow" {
            return UIImage(named: "weather_icon_18")!
        } else if code == "ClearAfterRainy" {
            return UIImage(named: "weather_icon_36")!
        } else if code == "Shower" {
            return UIImage(named: "weather_icon_10")!
        } else if code == "RainOrSnow" {
            return UIImage(named: "weather_icon_31")!
        } else if code == "SnowOrRain" {
            return UIImage(named: "weather_icon_26")!
        } else if code == "Thunder" {
            return UIImage(named: "weather_icon_39")!
        } else if code == "Mist" {
            return UIImage(named: "weather_icon_40")!
        }else {
            return UIImage(named: "weather_icon_01")!
        }
    }
    
}
