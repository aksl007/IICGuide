// FlightDeparture.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let flightDeparture = try? newJSONDecoder().decode(FlightDeparture.self, from: jsonData)

import Foundation

// MARK: - FlightDeparture
class FlightDeparture: Codable {
    var usid, fimsFlightId, codeShareValue, suffixedFlightPid: String?
    var terminalNo, gateNo, counterNoRange, scheduleDate: String?
    var scheduleTime, estimateDate, estimateTime, destinationAirportCode: String?
    var localedDestinationAirport: Localed?
    var localedOriginAirport: Localed?
    var localedVia1: Localed?
    var generalRemarkCode: String?
    var via1IataCode: String?
    var localedGeneralRemark: Localed?
    var walkingTime: Int?
    //background
    var grayBackground : Bool = false
    //arr
    var carouselNo, exitDoorNo : String?
    
    var isCheckDelete : Bool = false
    var flightType : String = "dep"

    enum CodingKeys: String, CodingKey {
        case usid
        case fimsFlightId
        case codeShareValue
        case suffixedFlightPid
        case terminalNo, gateNo, counterNoRange, scheduleDate, scheduleTime, estimateDate, estimateTime, destinationAirportCode, localedDestinationAirport, generalRemarkCode, localedGeneralRemark, walkingTime, carouselNo, exitDoorNo, localedOriginAirport, localedVia1, via1IataCode
    }

    init(usid: String?, fimsFlightId: String?, codeShareValue: String?, suffixedFlightPid: String?, terminalNo: String?, gateNo: String?, counterNoRange: String?, scheduleDate: String?, scheduleTime: String?, estimateDate: String?, estimateTime: String?, destinationAirportCode: String?, localedDestinationAirport: Localed?, generalRemarkCode: String?, localedGeneralRemark: Localed?, walkingTime: Int?, carouselNo:String?, exitDoorNo:String, localedOriginAirport: Localed?, localedVia1: Localed?, via1IataCode: String?) {
        self.usid = usid
        self.fimsFlightId = fimsFlightId
        self.codeShareValue = codeShareValue
        self.suffixedFlightPid = suffixedFlightPid
        self.terminalNo = terminalNo
        self.gateNo = gateNo
        self.counterNoRange = counterNoRange
        self.scheduleDate = scheduleDate
        self.scheduleTime = scheduleTime
        self.estimateDate = estimateDate
        self.estimateTime = estimateTime
        self.destinationAirportCode = destinationAirportCode
        self.localedDestinationAirport = localedDestinationAirport
        self.generalRemarkCode = generalRemarkCode
        self.localedGeneralRemark = localedGeneralRemark
        self.walkingTime = walkingTime
        self.carouselNo = carouselNo
        self.exitDoorNo = exitDoorNo
        self.localedOriginAirport = localedOriginAirport
        self.localedVia1 = localedVia1
        self.via1IataCode = via1IataCode
    }
    
    func setGrayBackground(grayBackground:Bool){
        self.grayBackground = grayBackground
    }
}
