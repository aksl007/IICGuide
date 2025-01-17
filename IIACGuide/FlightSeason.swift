//
//  FlightSeason.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/09/30.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class FlightSeason: Codable {
    var tuesday, monday: Bool?
    var terminalNo: String?
    var airlineIataCode: String?
    var localedOriginAirport: Localed?
    var thursday, sunday: Bool?
    var flightStartDate, seasonFlightId: String?
    var originAirportIataCode: String?
    var friday: Bool?
    var scheduleTime: String?
    var wednesday, saturday: Bool?
    var suffixedFlightPid, flightEndDate, fimsId: String?
    var localedAirline: Localed?

    enum CodingKeys: String, CodingKey {
        case tuesday, monday, terminalNo, airlineIataCode, localedOriginAirport, thursday, sunday, flightStartDate
        case seasonFlightId = "seasonFlightId"
        case originAirportIataCode, friday, scheduleTime, wednesday, saturday
        case suffixedFlightPid = "suffixedFlightPid"
        case flightEndDate
        case fimsId = "fimsId"
        case localedAirline
    }

    init(tuesday: Bool?, monday: Bool?, terminalNo: String?, airlineIataCode: String?, localedOriginAirport: Localed?, thursday: Bool?, sunday: Bool?, flightStartDate: String?, seasonFlightId: String?, originAirportIataCode: String?, friday: Bool?, scheduleTime: String?, wednesday: Bool?, saturday: Bool?, suffixedFlightPid: String?, flightEndDate: String?, fimsId: String?, localedAirline: Localed?) {
        self.tuesday = tuesday
        self.monday = monday
        self.terminalNo = terminalNo
        self.airlineIataCode = airlineIataCode
        self.localedOriginAirport = localedOriginAirport
        self.thursday = thursday
        self.sunday = sunday
        self.flightStartDate = flightStartDate
        self.seasonFlightId = seasonFlightId
        self.originAirportIataCode = originAirportIataCode
        self.friday = friday
        self.scheduleTime = scheduleTime
        self.wednesday = wednesday
        self.saturday = saturday
        self.suffixedFlightPid = suffixedFlightPid
        self.flightEndDate = flightEndDate
        self.fimsId = fimsId
        self.localedAirline = localedAirline
    }
}
