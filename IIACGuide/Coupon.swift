//
//  Coupon.swift
//  incheon
//
//  Created by DD Dev on 2020/09/16.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class Coupon: Object, Codable {
    @objc dynamic var logoFileURL, updateTime, endDate, campaignID, couponType, campaignType: String?
    @objc dynamic var name, datumDescription : Localed?
    @objc dynamic var campaignArea: String?
    @objc dynamic var maxIssueCount = 0
    @objc dynamic var startDate: String?
    @objc dynamic var discountBoundary: DiscountBoundary?
    @objc dynamic var barcodeNo, status: String?
    var targets: [CampaignTarget]?
    @objc dynamic var publisher: Publisher?
    
    override class func primaryKey() -> String? {
        return "campaignID"
    }

    enum CodingKeys: String, CodingKey {
        case logoFileURL = "logoFileUrl"
        case updateTime, endDate
        case campaignID = "campaignId"
        case name, couponType, campaignArea, maxIssueCount, startDate, discountBoundary, barcodeNo
        case datumDescription = "description"
        case status, targets, publisher, campaignType
    }

    convenience init(logoFileURL: String?, updateTime: String?, endDate: String?, campaignID: String?, name: Localed?, couponType: String?, campaignArea: String?, maxIssueCount: Int, startDate: String?, discountBoundary: DiscountBoundary?, barcodeNo: String?, datumDescription: Localed?, status: String?, targets: [CampaignTarget]?, publisher: Publisher?, campaignType: String?) {
        self.init()
        self.logoFileURL = logoFileURL
        self.updateTime = updateTime
        self.endDate = endDate
        self.campaignID = campaignID
        self.name = name
        self.couponType = couponType
        self.campaignArea = campaignArea
        self.maxIssueCount = maxIssueCount
        self.startDate = startDate
        self.discountBoundary = discountBoundary
        self.barcodeNo = barcodeNo
        self.datumDescription = datumDescription
        self.status = status
        self.targets = targets
        self.publisher = publisher
        self.campaignType = campaignType
    }
}
