//
//  UserDefaultsUtils.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

class UserDefaultsUtils{
    
    static let PREF_USER_FACILITY_UPDATE_DATE:String = "pref_user_facility_update_date"
    
    static func setFacilityUpdateDate(_ updateDate: String) {
        UserDefaults.standard.set(updateDate, forKey: PREF_USER_FACILITY_UPDATE_DATE)
    }
    static func getFacilityUpdateDate() -> String {
        return UserDefaults.standard.string(forKey: PREF_USER_FACILITY_UPDATE_DATE) ?? ""
    }
    
    
    static let PREF_LOCALE_SETTING:String = "pref_locale_setting"
    
    static func setLocaleSetting(_ updateDate: String) {
        UserDefaults.standard.set(updateDate, forKey: PREF_LOCALE_SETTING)
    }
    static func getLocaleSetting() -> String {
        return UserDefaults.standard.string(forKey: PREF_LOCALE_SETTING) ?? ""
    }
    
    
    static let PREF_WEATHER_DISPLAY_SETTING:String = "pref_weather_display_setting"
    
    static func setWeatherDisplaySetting(_ isSetting: Bool) {
        UserDefaults.standard.set(isSetting, forKey: PREF_WEATHER_DISPLAY_SETTING)
    }
    static func isWeatherDisplaySetting() -> Bool {
        return UserDefaults.standard.bool(forKey: PREF_WEATHER_DISPLAY_SETTING)
    }

    
    static let PREF_MYPLAN_TYPE:String = "pref_myplan_type"
    
    static func setMyPlanPassenger(_ isPassenger: Bool) {
        UserDefaults.standard.set(!isPassenger, forKey: PREF_MYPLAN_TYPE)
    }
    static func isMyPlanPassenger() -> Bool {
        return !UserDefaults.standard.bool(forKey: PREF_MYPLAN_TYPE)
    }
    
    
    static let PREF_SETTING_PUSH:String = "pref_setting_push"
    
    static func setPush(_ isPush: Bool) {
        UserDefaults.standard.set(!isPush, forKey: PREF_SETTING_PUSH)
    }
    static func isPush() -> Bool {
        return !UserDefaults.standard.bool(forKey: PREF_SETTING_PUSH)
    }
    
    
    static let PREF_SETTING_BEACON:String = "pref_setting_beacon"
    
    static func setBeacon(_ isPush: Bool) {
        UserDefaults.standard.set(isPush, forKey: PREF_SETTING_BEACON)
    }
    static func isBeacon() -> Bool {
        return UserDefaults.standard.bool(forKey: PREF_SETTING_BEACON)
    }

    static let PREF_NOTICE_POPUP_USID:String = "pref_notice_popup_usid"
    
    static func setNoticePopupUsid(_ updateDate: String) {
        UserDefaults.standard.set(updateDate, forKey: PREF_NOTICE_POPUP_USID)
    }
    static func getNoticePopupUsid() -> String {
        return UserDefaults.standard.string(forKey: PREF_NOTICE_POPUP_USID) ?? ""
    }
    
    
    static let PREF_FIRST_INSTALL:String = "pref_first_install"
    
    static func setFirstInstall(_ isFirst: Bool) {
        UserDefaults.standard.set(!isFirst, forKey: PREF_FIRST_INSTALL)
    }
    static func getFirstInstall() -> Bool {
        return !UserDefaults.standard.bool(forKey: PREF_FIRST_INSTALL)
    }
    
    static let PREF_MYPLAN_LIST_TYPE:String = "pref_myplan_list_type"
    
    static func setMyPlanListType(_ isList: Bool) {
        UserDefaults.standard.set(!isList, forKey: PREF_MYPLAN_LIST_TYPE)
    }
    static func getMyPlanListType() -> Bool {
        return !UserDefaults.standard.bool(forKey: PREF_MYPLAN_LIST_TYPE)
    }
    
    
    static let PREF_PUSH_ID:String = "pref_push_id"
    
    static func setPushId(_ pushId: String) {
        UserDefaults.standard.set(pushId, forKey: PREF_PUSH_ID)
    }
    static func getPushId() -> String {
        return UserDefaults.standard.string(forKey: PREF_PUSH_ID) ?? ""
    }
    
    
    static let PREF_DEVICE_ID:String = "pref_device_id"
    
    static func setDeviceId(_ uuid: String) {
        UserDefaults.standard.set(uuid, forKey: PREF_DEVICE_ID)
    }
    static func getDeviceId() -> String {
        return UserDefaults.standard.string(forKey: PREF_DEVICE_ID) ?? ""
    }
    
}
