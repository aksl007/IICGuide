//
//  Search.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class Search: Codable {
    var category10, category20, category100, category190, category250, category300, category310, category340, category380, category410, category420: Int?

    enum CodingKeys: String, CodingKey {
        case category10 = "10"
        case category20 = "20"
        case category100 = "100"
        case category190 = "190"
        case category250 = "250"
        case category300 = "300"
        case category310 = "310"
        case category340 = "340"
        case category380 = "380"
        case category410 = "410"
        case category420 = "420"
    }

    init(category10: Int?, category20: Int?, category100: Int?, category190: Int?, category250: Int?, category300: Int?, category310: Int?, category340: Int?, category380: Int?, category410: Int?, category420: Int?) {
        self.category10 = category10
        self.category20 = category20
        self.category100 = category100
        self.category190 = category190
        self.category250 = category250
        self.category300 = category300
        self.category310 = category310
        self.category340 = category340
        self.category380 = category380
        self.category410 = category410
        self.category420 = category420
    }
}
