//
//  BusDetailData.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusDetailData: Codable {
    
    var tell, regionName: String?
    var companyName: Localed?
    var rates: [BusRate]?
    var busID, busTypeName: String?
    var depots: [BusDepots]?
    var weekendPeakAllocationTime, weekendOffPeakAllocationTime, terminalID, weekdayPeakAllocationTime: String?
    var companyUsid, bisID, busNo: String?
    var busName: Localed?
    var region, weekdayOffPeakAllocationTime: String?

    enum CodingKeys: String, CodingKey {
        case tell, regionName, companyName, rates
        case busID = "busId"
        case busTypeName, depots, weekendPeakAllocationTime, weekendOffPeakAllocationTime
        case terminalID = "terminalId"
        case weekdayPeakAllocationTime, companyUsid
        case bisID = "bisId"
        case busNo, busName, region, weekdayOffPeakAllocationTime
    }

    init(tell: String?, regionName: String?, companyName: Localed?, rates: [BusRate]?, busID: String?, busTypeName: String?, depots: [BusDepots]?, weekendPeakAllocationTime: String?, weekendOffPeakAllocationTime: String?, terminalID: String?, weekdayPeakAllocationTime: String?, companyUsid: String?, bisID: String?, busNo: String?, busName: Localed?, region: String?, weekdayOffPeakAllocationTime: String?) {
        self.tell = tell
        self.regionName = regionName
        self.companyName = companyName
        self.rates = rates
        self.busID = busID
        self.busTypeName = busTypeName
        self.depots = depots
        self.weekendPeakAllocationTime = weekendPeakAllocationTime
        self.weekendOffPeakAllocationTime = weekendOffPeakAllocationTime
        self.terminalID = terminalID
        self.weekdayPeakAllocationTime = weekdayPeakAllocationTime
        self.companyUsid = companyUsid
        self.bisID = bisID
        self.busNo = busNo
        self.busName = busName
        self.region = region
        self.weekdayOffPeakAllocationTime = weekdayOffPeakAllocationTime
    }
}
