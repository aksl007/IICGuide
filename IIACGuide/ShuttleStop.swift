//
//  ShuttleStop.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class ShuttleStop: Codable {
    var name: Localed?
    var seq: Int?
    var usid: String?
    var weekdayTimes: [ShuttleTimes]?
    var weekendTimes: [ShuttleTimes]?

    init(name: Localed?, seq: Int?, usid: String?, weekdayTimes: [ShuttleTimes]?, weekendTimes: [ShuttleTimes]?) {
        self.name = name
        self.seq = seq
        self.usid = usid
        self.weekdayTimes = weekdayTimes
    }
}
