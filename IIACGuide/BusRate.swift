//
//  BusRate.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class BusRate: Codable {
    var adultFare: Int?
    var direction: String?
    var nationalMeritFare, childFare, estimatedRunTime, youthFare: Int?

    init(adultFare: Int?, direction: String?, nationalMeritFare: Int?, childFare: Int?, estimatedRunTime: Int?, youthFare: Int?) {
        self.adultFare = adultFare
        self.direction = direction
        self.nationalMeritFare = nationalMeritFare
        self.childFare = childFare
        self.estimatedRunTime = estimatedRunTime
        self.youthFare = youthFare
    }
}
