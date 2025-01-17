//
//  BusTimetableRow.swift
//  incheon
//
//  Created by DD Dev on 2020/09/10.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusTimetableRow: Codable {
    var hour: String?
    var minRow1: String?
    var minRow2: String?
    var row1: [String]?
    var row2: [String]?
    var same: Bool?

    init(hour: String?, minRow1: String?, minRow2: String?, row1: [String]?, row2: [String]?, same: Bool?) {
        self.hour = hour
        self.minRow1 = minRow1
        self.minRow2 = minRow2
        self.row1 = row1
        self.row2 = row2
        self.same = same
    }
}
