//
//  ParkingLocationInfo.swift
//  incheon
//
//  Created by DD Dev on 2020/09/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class ParkingLocationInfo: Codable {
    var parkingZoneName, parkingLotType, terminalID, parkingZoneNo: String?
    var carNo, parkingLaneNo, parkingLotName: String?
    var parkingDateTime, parkingLaneName, parkingFloor: String?
    var poiId : [String]?

    enum CodingKeys: String, CodingKey {
        case parkingZoneName, parkingLotType
        case terminalID = "terminalId"
        case parkingZoneNo, carNo, parkingLaneNo, parkingLotName
        case parkingDateTime, parkingLaneName, parkingFloor
        case poiId
    }

    init(parkingZoneName: String?, parkingLotType: String?, terminalID: String?, parkingZoneNo: String?, carNo: String?, parkingLaneNo: String?, parkingLotName: String?, parkingDateTime: String?, parkingLaneName: String?, parkingFloor: String?, poiId:[String]?) {
        self.parkingZoneName = parkingZoneName
        self.parkingLotType = parkingLotType
        self.terminalID = terminalID
        self.parkingZoneNo = parkingZoneNo
        self.carNo = carNo
        self.parkingLaneNo = parkingLaneNo
        self.parkingLotName = parkingLotName
        self.parkingDateTime = parkingDateTime
        self.parkingLaneName = parkingLaneName
        self.parkingFloor = parkingFloor
        self.poiId = poiId
    }
}
