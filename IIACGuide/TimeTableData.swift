//
//  TimeTableData.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class TimeTableData: Codable {
    var secondMinsDescription: String?
    var seq: Int?
    var firstMinsDescription, firstMins, hour, secondMins: String?

    init(secondMinsDescription: String?, seq: Int?, firstMinsDescription: String?, firstMins: String?, hour: String?, secondMins: String?) {
        self.secondMinsDescription = secondMinsDescription
        self.seq = seq
        self.firstMinsDescription = firstMinsDescription
        self.firstMins = firstMins
        self.hour = hour
        self.secondMins = secondMins
    }
}
