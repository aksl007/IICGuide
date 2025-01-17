//
//  FlightDetail.swift
//  incheon
//
//  Created by DD Dev on 2020/08/12.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - DataClass
class FlightDetail:Object, Codable {
    @objc dynamic var airlineTelNo, codeShareValue, masterFimsFlightId, generalRemarkCode: String?
    @objc dynamic var destinationHighTemperature, usid, destinationLowTemperature, masterFlightPid, originLowTemperature, originHighTemperature, originWeatherCode: String?
    @objc dynamic var destinationWeatherCode, arrivalDate, arrivalTime, departureDate, departureTime: String?
    @objc dynamic var localedGeneralRemark: Localed?
    @objc dynamic var scheduleDate, destinationAirportCode, fimsFlightId, originAirportCode: String?
    @objc dynamic var localedAirline: Localed?
    @objc dynamic var elapseTime, gateNo, gateUsid, carouselNo, exitDoorNo, exitDoorUsid, startBaggageDateTime, endBaggageDateTime: String?
    dynamic var walkingTime : Int?
    @objc dynamic var counterNoRange: String?
    @objc dynamic var localedDestinationAirport, localedMasterAirline, localedVia1, localedVia2, localedOriginAirport: Localed?
    @objc dynamic var terminalNo, scheduleTime, suffixedFlightPid, counterUsid, via1IataCode, via2IataCode, estimateDate, estimateTime, baggageRemarkCode: String?
    @objc dynamic var flightType: String?
    
    override class func primaryKey() -> String? {
        return "usid"
    }
    
    enum CodingKeys: String, CodingKey {
        case airlineTelNo, codeShareValue
        case masterFimsFlightId, originAirportCode
        case generalRemarkCode, destinationHighTemperature, usid, destinationLowTemperature
        case masterFlightPid
        case destinationWeatherCode, arrivalDate, arrivalTime, localedGeneralRemark, scheduleDate, destinationAirportCode
        case fimsFlightId
        case localedAirline, elapseTime, gateNo, gateUsid, walkingTime, counterNoRange, localedDestinationAirport, localedMasterAirline, terminalNo, scheduleTime
        case suffixedFlightPid, localedOriginAirport, flightType
        case counterUsid, localedVia1, localedVia2,via1IataCode, via2IataCode, estimateDate, estimateTime,departureDate, departureTime, originLowTemperature, originHighTemperature, originWeatherCode, carouselNo, exitDoorNo, exitDoorUsid, startBaggageDateTime, endBaggageDateTime, baggageRemarkCode
    }

    convenience init(airlineTelNo: String?, codeShareValue: String?, masterFimsFlightId: String?, generalRemarkCode: String?, destinationHighTemperature: String?, usid: String?, destinationLowTemperature: String?, masterFlightPid: String?, destinationWeatherCode: String?, arrivalDate: String?, arrivalTime: String?, localedGeneralRemark: Localed?, scheduleDate: String?, destinationAirportCode: String?, fimsFlightId: String?, localedAirline: Localed?, elapseTime: String?, gateNo: String?, gateUsid: String?, walkingTime: Int?, counterNoRange: String?, localedDestinationAirport: Localed?, localedMasterAirline: Localed?, terminalNo: String?, scheduleTime: String?, suffixedFlightPid: String?, counterUsid: String?, via1IataCode: String?, via2IataCode: String?, localedVia1: Localed?, localedVia2: Localed?, estimateDate: String?, estimateTime: String?, localedOriginAirport: Localed?,departureDate: String?, departureTime: String?, originLowTemperature: String?, originHighTemperature : String?, originWeatherCode: String?, carouselNo: String?, exitDoorNo: String?, exitDoorUsid: String?, startBaggageDateTime: String?, endBaggageDateTime: String?, baggageRemarkCode: String?, flightType: String?, originAirportCode: String?) {
        self.init()
        self.airlineTelNo = airlineTelNo
        self.codeShareValue = codeShareValue
        self.masterFimsFlightId = masterFimsFlightId
        self.generalRemarkCode = generalRemarkCode
        self.destinationHighTemperature = destinationHighTemperature
        self.usid = usid
        self.destinationLowTemperature = destinationLowTemperature
        self.masterFlightPid = masterFlightPid
        self.destinationWeatherCode = destinationWeatherCode
        self.arrivalDate = arrivalDate
        self.arrivalTime = arrivalTime
        self.localedGeneralRemark = localedGeneralRemark
        self.scheduleDate = scheduleDate
        self.destinationAirportCode = destinationAirportCode
        self.fimsFlightId = fimsFlightId
        self.localedAirline = localedAirline
        self.elapseTime = elapseTime
        self.gateNo = gateNo
        self.gateUsid = gateUsid
        self.walkingTime = walkingTime
        self.counterNoRange = counterNoRange
        self.localedDestinationAirport = localedDestinationAirport
        self.localedMasterAirline = localedMasterAirline
        self.terminalNo = terminalNo
        self.scheduleTime = scheduleTime
        self.suffixedFlightPid = suffixedFlightPid
        self.counterUsid = counterUsid
        self.via1IataCode = via1IataCode
        self.via2IataCode = via2IataCode
        self.localedVia1 = localedVia1
        self.localedVia2 = localedVia2
        self.estimateDate = estimateDate
        self.estimateTime = estimateTime
        self.localedOriginAirport = localedOriginAirport
        self.departureDate = departureDate
        self.departureTime = departureTime
        self.originLowTemperature = originLowTemperature
        self.originHighTemperature = originHighTemperature
        self.originWeatherCode = originWeatherCode
        self.carouselNo = carouselNo
        self.exitDoorNo = exitDoorNo
        self.exitDoorUsid = exitDoorUsid
        self.startBaggageDateTime = startBaggageDateTime
        self.endBaggageDateTime = endBaggageDateTime
        self.baggageRemarkCode = baggageRemarkCode
        self.flightType = flightType
        self.originAirportCode = originAirportCode
    }
}
