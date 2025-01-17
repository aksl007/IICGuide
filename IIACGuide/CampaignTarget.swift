//
//  CampaignTarget.swift
//  incheon
//
//  Created by DD Dev on 2020/09/16.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class CampaignTarget: Object, Codable {
    @objc dynamic var targetName, locationDescription: Localed?
    @objc dynamic var targetType: String?
    @objc dynamic var targetID: String?
    @objc dynamic var logoImageURL: String?
    @objc dynamic var campaignId: String?

    enum CodingKeys: String, CodingKey {
        case targetName, targetType
        case targetID = "targetId"
        case locationDescription
        case logoImageURL = "logoImageUrl"
        case campaignId
    }

    convenience init(targetName: Localed?, targetType: String?, targetID: String?, locationDescription: Localed?, logoImageURL: String?, campaignId: String?) {
        self.init()
        self.targetName = targetName
        self.targetType = targetType
        self.targetID = targetID
        self.locationDescription = locationDescription
        self.logoImageURL = logoImageURL
        self.campaignId = campaignId
    }
}
