//
//  ParkingConData.swift
//  incheon
//
//  Created by 김진성 on 2020/08/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class ParkingConData: Codable {
    var infos: [ParkingConInfo]?
    var terminal, facilityID, dateTime, parkingConDataDescription: String?

    enum CodingKeys: String, CodingKey {
        case infos, terminal
        case facilityID = "facilityId"
        case dateTime
        case parkingConDataDescription = "description"
    }

    init(infos: [ParkingConInfo]?, terminal: String?, facilityID: String?, dateTime: String?, parkingConDataDescription: String?) {
        self.infos = infos
        self.terminal = terminal
        self.facilityID = facilityID
        self.dateTime = dateTime
        self.parkingConDataDescription = parkingConDataDescription
    }
}
