//
//  ShuttleBusData.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class ShuttleBusData: Codable {
    var name: Localed?
    var usid: String?
    var stops: [ShuttleStop]?

    init(name: Localed?, usid: String?, stops: [ShuttleStop]?) {
        self.name = name
        self.usid = usid
        self.stops = stops
    }
}
