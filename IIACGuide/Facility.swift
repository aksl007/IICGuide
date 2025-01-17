//
//  Facility.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class Facility: Object, Codable {
    @objc dynamic var desc: Localed?
    @objc dynamic var actualFacilityID: String?
    @objc dynamic var transferEstablishment: Bool = false
    @objc dynamic var items, name: Localed?
    @objc dynamic var logoImageFileUsid, usid: String?
    @objc dynamic var open24Hours: Bool = false
    @objc dynamic var locationDesc: Localed?
    @objc dynamic var openCloseTime: String?
    @objc dynamic var delete: Bool = false
    @objc dynamic var terminalID: String?
    @objc dynamic var areaCode: String?
    @objc dynamic var midCategory, logoImageURL: String?
    @objc dynamic var coupon: Bool = false
    var telNOS, keywords, optionalImageUrls, optionalImageFileUsids: [String]?
    @objc dynamic var bigCategory, enterpriseID: String?
    @objc dynamic var keyword: String?
    @objc dynamic var telNo: String?
    @objc dynamic var optionalImageUrl: String?
    
    
    override static func primaryKey() -> String? {
        return "usid"
    }

    enum CodingKeys: String, CodingKey {
        case desc, optionalImageUrls, optionalImageFileUsids
        case actualFacilityID = "actualFacilityId"
        case transferEstablishment, items, name, logoImageFileUsid, usid, open24Hours, locationDesc, openCloseTime, delete, keywords
        case terminalID = "terminalId"
        case areaCode, midCategory
        case logoImageURL = "logoImageUrl"
        case coupon
        case telNOS = "telNos"
        case bigCategory
        case enterpriseID = "enterpriseId"
        case keyword
        case telNo
        case optionalImageUrl
    }

    convenience init(desc: Localed?, optionalImageUrls: [String]?, optionalImageFileUsids: [String]?, actualFacilityID: String?, transferEstablishment: Bool, items: Localed?, name: Localed?, logoImageFileUsid: String?, usid: String?, open24Hours: Bool, locationDesc: Localed?, openCloseTime: String?, delete: Bool, keywords: [String]?, terminalID: String?, areaCode: String?, midCategory: String?, logoImageURL: String?, coupon: Bool, telNOS: [String]?, bigCategory: String?, enterpriseID: String?, keyword: String?, telNo: String?, optionalImageUrl: String?) {
        self.init()
        self.desc = desc
        self.optionalImageUrls = optionalImageUrls
        self.optionalImageFileUsids = optionalImageFileUsids
        self.actualFacilityID = actualFacilityID
        self.transferEstablishment = transferEstablishment
        self.items = items
        self.name = name
        self.logoImageFileUsid = logoImageFileUsid
        self.usid = usid
        self.open24Hours = open24Hours
        self.locationDesc = locationDesc
        self.openCloseTime = openCloseTime
        self.delete = delete
        self.keywords = keywords
        self.terminalID = terminalID
        self.areaCode = areaCode
        self.midCategory = midCategory
        self.logoImageURL = logoImageURL
        self.coupon = coupon
        self.telNOS = telNOS
        self.bigCategory = bigCategory
        self.enterpriseID = enterpriseID
 
        self.keyword = keyword
        self.telNo = telNo
        self.optionalImageUrl = optionalImageUrl
    }
}
