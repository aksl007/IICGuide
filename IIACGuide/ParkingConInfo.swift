//
//  ParkingConInfo.swift
//  incheon
//
//  Created by 김진성 on 2020/08/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class ParkingConInfo: Codable {
    var floor: String?
    var carCount, totalCount: Int?
    var parkingConInfoDescription: String?

    enum CodingKeys: String, CodingKey {
        case floor, carCount, totalCount
        case parkingConInfoDescription = "description"
    }

    init(floor: String?, carCount: Int?, totalCount: Int?, parkingConInfoDescription: String?) {
        self.floor = floor
        self.carCount = carCount
        self.totalCount = totalCount
        self.parkingConInfoDescription = parkingConInfoDescription
    }
}
