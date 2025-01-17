//
//  PassengerInfo.swift
//  incheon
//
//  Created by 김진성 on 2020/09/01.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class PassengerInfo: Codable {
    var totalPassengers, westSectionPassengers, eastSectionPassengers: Int?
    var section56Passengers, section12Passengers, section4Passengers, section3Passengers: Int?
    var dSectionPassengers, cSectionPassengers, section1Passengers, section2Passengers: Int?
    var date, time: String?

    init(totalPassengers: Int?, westSectionPassengers: Int?, eastSectionPassengers: Int?, date: String?, time: String?,section3Passengers: Int?, section56Passengers: Int?, section12Passengers: Int?, section4Passengers: Int?, cSectionPassengers: Int?, dSectionPassengers: Int?, section1Passengers: Int?, section2Passengers: Int?) {
        self.totalPassengers = totalPassengers
        self.westSectionPassengers = westSectionPassengers
        self.eastSectionPassengers = eastSectionPassengers
        self.date = date
        self.time = time
        self.section3Passengers = section3Passengers
        self.section56Passengers = section56Passengers
        self.section12Passengers = section12Passengers
        self.section4Passengers = section4Passengers
        self.cSectionPassengers = cSectionPassengers
        self.dSectionPassengers = dSectionPassengers
        self.section1Passengers = section1Passengers
        self.section2Passengers = section2Passengers
        
    }
    
    init() {
    }
}
