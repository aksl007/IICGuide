//
//  EstablishmentData.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class EstablishmentData: Codable {
    var updatedTimestamp: String?
    var data: [Facility]?

    init(updatedTimestamp: String?, data: [Facility]?) {
        self.updatedTimestamp = updatedTimestamp
        self.data = data
    }
}
