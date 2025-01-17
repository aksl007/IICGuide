//
//  Publisher.swift
//  incheon
//
//  Created by DD Dev on 2020/09/16.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class Publisher:Object, Codable {
    @objc dynamic var userGroup, publisherName, companyID: String?

    enum CodingKeys: String, CodingKey {
        case userGroup, publisherName
        case companyID = "companyId"
    }

    convenience init(userGroup: String?, publisherName: String?, companyID: String?) {
        self.init()
        self.userGroup = userGroup
        self.publisherName = publisherName
        self.companyID = companyID
    }
}
