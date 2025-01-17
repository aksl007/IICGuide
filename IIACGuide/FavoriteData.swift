//
//  FavoriteData.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift
class FavoriteData: Object {
    
    @objc dynamic var usid, favoriteDate, areaCode, logoImageUrl, busAlllocation, busNo, terminalId, displayDepot: String?
    @objc dynamic var category: String? // 쇼핑&식당 : 1, 편의시설 : 2, 대중교통 : 3
    @objc dynamic var name, busName, loc: Localed?
    
    override static func primaryKey() -> String? {
        return "usid"
    }
    
    override static func indexedProperties() -> [String] {
        return ["favoriteDate"]
    }

    convenience init(usid: String?,favoriteDate: String?,areaCode: String?,logoImageUrl: String?,busAlllocation: String?,busNo: String?,terminalId: String?,displayDepot: String?,category: String?, name: Localed?, busName: Localed?, loc: Localed?) {
        self.init()
        self.usid = usid
        self.favoriteDate = favoriteDate
        self.areaCode = areaCode
        self.logoImageUrl = logoImageUrl
        self.busAlllocation = busAlllocation
        self.busNo = busNo
        self.terminalId = terminalId
        self.displayDepot = displayDepot
        self.usid = usid
        self.category = category
        self.name = name
        self.busName = busName
        self.loc = loc
    }
}
