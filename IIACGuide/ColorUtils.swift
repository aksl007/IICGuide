//
//  ColorUtils.swift
//  incheon
//
//  Created by DD Dev on 2020/07/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

class ColorUtils{
    
    static let white:UInt = 0xFFFFFF
    static let black:UInt = 0x000000
    
    static let grayBackground:UInt = 0xEEEEEE
    static let grayButtonBackground:UInt = 0xE2E2E2
    static let blueBackground:UInt = 0x1B4B84
    static let blueLightBackground:UInt = 0xE8F1FA
    static let blueGreenBackground:UInt = 0x4382D2
    
    static let greenBackground:UInt = 0x05322C
    static let greenLightBackground:UInt = 0x469197
    static let redBackground:UInt = 0xE50011
    static let yellowBackground:UInt = 0xFFAD00
    
    static let blackText:UInt = 0x333333
    static let grayText:UInt = 0x999999
    static let grayHeavyText:UInt = 0x383B3E
    static let grayButtonText:UInt = 0x666666
    static let grayResultBackground:UInt = 0xD7D7C5
    
    static let redText:UInt = 0xFA1F49
    static let blueText:UInt = 0x1B4B84
    static let blueLightText:UInt = 0x4468AF
    
    static let grayLine:UInt = 0xE6E6E6
    
    static let grayStroke:UInt = 0xAAAAAA
    
    static let codeGTO:UInt = 0x008c81
    static let codeBOR:UInt = 0x00736a
    static let codeFIN:UInt = 0x005951
    static let codeGTC:UInt = 0x00403a
    static let codeDEP:UInt = 0x440e61
    static let codeDEL:UInt = 0xa0410d
    static let codeCNL:UInt = 0x9d0a0e
    static let codeDIV:UInt = 0x9e005d
    static let codeLND:UInt = 0x004a80
    static let codeARR:UInt = 0x003471
    
    static let blueSmooth:UInt = 0x00A0FF
    static let greenOrdinary:UInt = 0x1BCA11
    static let orangeCrowded:UInt = 0xFE9347
    static let redVeryCrowded:UInt = 0xFE434F
    static let grayClosed:UInt = 0x7E7E7E
    
    static let blue00ABFF:UInt = 0x00ABFF
    static let yellowFBFE00:UInt = 0xFBFE00
    static let orangeFF5800:UInt = 0xFF5800
    static let redFF0000:UInt = 0xFF0000
    
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func UIColorFromRGBWithAlpha(rgbValue: UInt, alphaValue : CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alphaValue
        )
    }
    
}
