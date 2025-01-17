//
//  DepCongestionInfo.swift
//  incheon
//
//  Created by 김진성 on 2020/08/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class DepCongestionInfo: Codable {
    var passengerCount: Int?
    var level, terminal, zone, dateTime: String?

    init(passengerCount: Int?, level: String?, terminal: String?, zone: String?, dateTime: String?) {
        self.passengerCount = passengerCount
        self.level = level
        self.terminal = terminal
        self.zone = zone
        self.dateTime = dateTime
    }
}
