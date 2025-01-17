//
//  Mobile.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/10/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation


class Mobile{

    var mobileId, pushId, locale, os, osVersion, appVersion : String?
    var pushAllowed : Bool
    
    init(mobileId: String?, pushId: String?, locale: String?, os: String?, osVersion: String?, appVersion: String?, pushAllowed: Bool) {
        self.mobileId = mobileId
        self.pushId = pushId
        self.locale = locale
        self.os = os
        self.osVersion = osVersion
        self.appVersion = appVersion
        self.pushAllowed = pushAllowed
    }
    
}
