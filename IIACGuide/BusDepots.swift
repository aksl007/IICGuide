//
//  BusDepots.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusDepots: Codable {
    var floor, rideHome, name, usid, poiId: String?
    var terminalType: String?

    init(floor: String?, rideHome: String?, name: String?, usid: String?, terminalType: String?, poiId: String?) {
        self.floor = floor
        self.rideHome = rideHome
        self.name = name
        self.usid = usid
        self.terminalType = terminalType
        self.poiId = poiId

    }
}
