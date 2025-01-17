//
//  ArrCongestionInfo.swift
//  incheon
//
//  Created by 김진성 on 2020/08/31.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

// MARK: - ArrCongestionInfo
class ArrCongestionInfo: Codable {
    var estimatedDateTime, zone, gate, passengerJudgeState: String?
    var koreanTotalCount, foreignerTotalCount: Int?
    var originIataCode: String?
    var foreignerJudgeCount, koreanJudgeCount: Int?
    var scheduledDateTime, publicPID: String?

    enum CodingKeys: String, CodingKey {
        case estimatedDateTime, zone, gate, passengerJudgeState, koreanTotalCount, foreignerTotalCount, originIataCode, foreignerJudgeCount, koreanJudgeCount, scheduledDateTime
        case publicPID = "publicPId"
    }

    init(estimatedDateTime: String?, zone: String?, gate: String?, passengerJudgeState: String?, koreanTotalCount: Int?, foreignerTotalCount: Int?, originIataCode: String?, foreignerJudgeCount: Int?, koreanJudgeCount: Int?, scheduledDateTime: String?, publicPID: String?) {
        self.estimatedDateTime = estimatedDateTime
        self.zone = zone
        self.gate = gate
        self.passengerJudgeState = passengerJudgeState
        self.koreanTotalCount = koreanTotalCount
        self.foreignerTotalCount = foreignerTotalCount
        self.originIataCode = originIataCode
        self.foreignerJudgeCount = foreignerJudgeCount
        self.koreanJudgeCount = koreanJudgeCount
        self.scheduledDateTime = scheduledDateTime
        self.publicPID = publicPID
    }
}
