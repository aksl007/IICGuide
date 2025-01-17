//
//  StringExtension.swift
//  incheon
//
//  Created by DD Dev on 2020/07/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

extension String {

    // lbl.text = String(format: NSLocalizedString("Hello", comment: ""))
    
    var localized: String {
        
        var lang = UserDefaultsUtils.getLocaleSetting()
        
        if lang == "" {
            return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        }else{
            if lang == "zh" {
                lang = "zh-Hans"
            }
            let path = Bundle.main.path(forResource: lang, ofType: "lproj")
            
            let bundle = Bundle(path: path!)
            
            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
    }

    // lbl.text = String(format: NSLocalizedString("Me", comment: ""), "민이")
    //"Me" = "저는 %@입니다";
    
    var convertToTime: String {
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "HHmm"

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "HH:mm"

        let inStr = self
        let date = inFormatter.date(from: inStr)!
        let outStr = outFormatter.string(from: date)
        
        return outStr
    }
    
    var convertToHH: String {
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "HHmm"

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "HH"

        let inStr = self
        let date = inFormatter.date(from: inStr)!
        let outStr = outFormatter.string(from: date)
        
        return outStr
    }
    
    var convertTomm: String {
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "HHmm"

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "mm"

        let inStr = self
        let date = inFormatter.date(from: inStr)!
        let outStr = outFormatter.string(from: date)
        
        return outStr
    }
    
    var convertToDate: String {
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "YYYYMMdd"

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "YYYY-MM-dd"

        let inStr = self
        let date = inFormatter.date(from: inStr)!
        let outStr = outFormatter.string(from: date)
        
        return outStr
    }
    
    var getSubTitle: String {
        return "■ \(self)"
    }
    var getDescription: String {
        return "· \(self)"
    }
    
    var convertToDecimalNumber: String {
        let largeNumber = Int(self)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value:largeNumber ?? 0)) ?? "0"
    }
    
    var convertToTerminalNo : String {
        if self == "P03" {
            return "T2"
        }else{
            return "T1"
        }
    }
    
    var convertToTerminalNoLong : String {
        if self == "P03" {
            return "flights_list_t2".localized
        }else{
            return "flights_list_t1".localized
        }
    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)

        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: 1,
                                     range: NSMakeRange(0, attributeString.length))

        return attributeString
    }

    func noStrikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        
        attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle,
                                        range: NSMakeRange(0, attributeString.length))

        return attributeString
    }
    
    func lastTextRed() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)

        attributeString.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText),
                                     range: NSMakeRange(attributeString.length - 1, 1))

        return attributeString
    }

    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
