//
//  FirebaseUtils.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import Firebase
class FirebaseUtils {
    static func setMenuAnalyticsEventContent(type: String, name: String) {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterContentType: type,
            AnalyticsParameterItemName: name,
            "os": "iphone",
            "lang": CommonUtils.getLocaleId(),
            "statistics": "\(CommonUtils.getTodayDate(format: "yyyyMMdd")),iphone,\(type),\(CommonUtils.getLocaleId()),\(name)"
        ])
    }
    
}
