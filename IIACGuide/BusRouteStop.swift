//
//  BusRouteStop.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusRouteStop: Codable {
    var stop: BusStop?
    var seq: Int?

    init(stop: BusStop?, seq: Int?) {
        self.stop = stop
        self.seq = seq
    }
}
