//
//  FlightAirport.swift
//  incheon
//
//  Created by DD Dev on 2020/08/21.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class FlightAirport: Codable {
    var name: Localed?
    var iataCode: String?

    init(name: Localed?, iataCode: String?) {
        self.name = name
        self.iataCode = iataCode
    }
}
