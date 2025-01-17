//
//  TaxiWait.swift
//  incheon
//
//  Created by DD Dev on 2020/09/11.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class TaxiWait: Codable {
    var deluxeTaxiwaitingTime, stateDateTime, terminalID: String?
    var seoulTaxiCount: Int?
    var seoulTaxiwaitingTime, incheonTaxiwaitingTime: String?
    var deluxeTaxiCount, intercityTaxiCount, incheonTaxiCount: Int?
    var intercityTaxiwaitingTime, vanTaxiwaitingTime: String?
    var gyeonggiTaxiCount: Int?
    var gyeonggiTaxiwaitingTime, operatingState: String?
    var vanTaxiCount: Int?

    enum CodingKeys: String, CodingKey {
        case deluxeTaxiwaitingTime, stateDateTime
        case terminalID = "terminalId"
        case seoulTaxiCount, seoulTaxiwaitingTime, incheonTaxiwaitingTime, deluxeTaxiCount, intercityTaxiCount, incheonTaxiCount, intercityTaxiwaitingTime, vanTaxiwaitingTime, gyeonggiTaxiCount, gyeonggiTaxiwaitingTime, operatingState, vanTaxiCount
    }

    init(deluxeTaxiwaitingTime: String?, stateDateTime: String?, terminalID: String?, seoulTaxiCount: Int?, seoulTaxiwaitingTime: String?, incheonTaxiwaitingTime: String?, deluxeTaxiCount: Int?, intercityTaxiCount: Int?, incheonTaxiCount: Int?, intercityTaxiwaitingTime: String?, vanTaxiwaitingTime: String?, gyeonggiTaxiCount: Int?, gyeonggiTaxiwaitingTime: String?, operatingState: String?, vanTaxiCount: Int?) {
        self.deluxeTaxiwaitingTime = deluxeTaxiwaitingTime
        self.stateDateTime = stateDateTime
        self.terminalID = terminalID
        self.seoulTaxiCount = seoulTaxiCount
        self.seoulTaxiwaitingTime = seoulTaxiwaitingTime
        self.incheonTaxiwaitingTime = incheonTaxiwaitingTime
        self.deluxeTaxiCount = deluxeTaxiCount
        self.intercityTaxiCount = intercityTaxiCount
        self.incheonTaxiCount = incheonTaxiCount
        self.intercityTaxiwaitingTime = intercityTaxiwaitingTime
        self.vanTaxiwaitingTime = vanTaxiwaitingTime
        self.gyeonggiTaxiCount = gyeonggiTaxiCount
        self.gyeonggiTaxiwaitingTime = gyeonggiTaxiwaitingTime
        self.operatingState = operatingState
        self.vanTaxiCount = vanTaxiCount
    }
}
