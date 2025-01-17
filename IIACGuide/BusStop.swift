//
//  BusStop.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusStop: Codable {
    var existBus: Bool?
    var longitude: Double?
    var name: Localed?
    var usid: String?
    var latitude: Double?

    init(existBus: Bool?, longitude: Double?, name: Localed?, usid: String?, latitude: Double?) {
        self.existBus = existBus
        self.longitude = longitude
        self.name = name
        self.usid = usid
        self.latitude = latitude
    }
}
