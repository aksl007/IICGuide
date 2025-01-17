//
//  BusData.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusData: Codable {
    var terminalID, regionName, busTypeName: String?
    var busName: Localed?
    var busNo: String?
    var depots: [BusDepots]?
    var weekdayOffPeakAllocationTime, busID, weekendPeakAllocationTime, weekendOffPeakAllocationTime: String?
    var region, weekdayPeakAllocationTime: String?

    enum CodingKeys: String, CodingKey {
        case terminalID = "terminalId"
        case regionName, busTypeName, busName, busNo, depots, weekdayOffPeakAllocationTime
        case busID = "busId"
        case weekendPeakAllocationTime, weekendOffPeakAllocationTime, region, weekdayPeakAllocationTime
    }

    init(terminalID: String?, regionName: String?, busTypeName: String?, busName: Localed?, busNo: String?, depots: [BusDepots]?, weekdayOffPeakAllocationTime: String?, busID: String?, weekendPeakAllocationTime: String?, weekendOffPeakAllocationTime: String?, region: String?, weekdayPeakAllocationTime: String?) {
        self.terminalID = terminalID
        self.regionName = regionName
        self.busTypeName = busTypeName
        self.busName = busName
        self.busNo = busNo
        self.depots = depots
        self.weekdayOffPeakAllocationTime = weekdayOffPeakAllocationTime
        self.busID = busID
        self.weekendPeakAllocationTime = weekendPeakAllocationTime
        self.weekendOffPeakAllocationTime = weekendOffPeakAllocationTime
        self.region = region
        self.weekdayPeakAllocationTime = weekdayPeakAllocationTime
    }
}
