//
//  AirlineAssign.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class AirlineAssign: Codable {
    var airline1, airlineCode1: String?
    var airline2, airlineCode2: String?

    enum CodingKeys: String, CodingKey {
        case airline1, airlineCode1
        case airline2, airlineCode2
    }

    init(airline1: String?, airlineCode1: String?, airline2: String?, airlineCode2: String?) {
        self.airline1 = airline1
        self.airline2 = airline2
        self.airlineCode1 = airlineCode1
        self.airlineCode2 = airlineCode2
    }
}
