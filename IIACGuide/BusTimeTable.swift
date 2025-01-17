//
//  BusTimeTable.swift
//  incheon
//
//  Created by DD Dev on 2020/09/09.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusTimeTable: Codable {
    var routeName: Localed?
    var timeTable: [TimeTableData]?

    init(routeName: Localed?, timeTable: [TimeTableData]?) {
        self.routeName = routeName
        self.timeTable = timeTable
    }
}
