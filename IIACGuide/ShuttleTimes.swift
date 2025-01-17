//
//  ShuttleTimes.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class ShuttleTimes: Codable {
    var time: String?
    var seq: Int?
    var desc: Localed?
    var operationType: String?

    init(time: String?, seq: Int?, desc: Localed?, operationType: String?) {
        self.time = time
        self.seq = seq
        self.desc = desc
        self.operationType = operationType
    }
}
