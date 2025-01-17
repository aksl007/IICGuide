//
//  EntryMoveTime.swift
//  incheon
//
//  Created by 김진성 on 2020/08/31.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

// MARK: - EntryMoveTime
class EntryMoveTime: Codable {
    var zone: String?
    var gate: Int?
    var terminal: String?
    var time: Int?

    init(zone: String?, gate: Int?, terminal: String?, time: Int?) {
        self.zone = zone
        self.gate = gate
        self.terminal = terminal
        self.time = time
    }
}
