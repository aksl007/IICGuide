//
//  FlightAirline.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class FlightAirline: Codable {
    var iataCode: String?
    var name: Localed?

    init(iataCode: String?, name: Localed?) {
        self.iataCode = iataCode
        self.name = name
    }
}
