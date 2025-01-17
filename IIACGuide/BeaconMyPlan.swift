//
//  BeaconMyPlan.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class BeaconMyPlan: Codable {
    
    var pushid, fimsid, suffixedFlightPid, estimateDateTime, counterNoRange: String?
    var mobileid: String?
    var beacon: BeaconPlan?
    var schddt, terminalNo, flttp, schddttm, gateNo, carouselNo: String?

    enum CodingKeys: String, CodingKey {
        case pushid, fimsid, counterNoRange
        case suffixedFlightPid = "suffixedFlightPid"
        case estimateDateTime, mobileid, beacon, schddt, terminalNo, flttp, schddttm, gateNo, carouselNo
    }

    init(pushid: String?, fimsid: String?, suffixedFlightPid: String?, estimateDateTime: String?, mobileid: String?, beacon: BeaconPlan?, schddt: String?, terminalNo: String?, flttp: String?, schddttm: String?, counterNoRange: String?, gateNo: String?, carouselNo:String?) {
        self.pushid = pushid
        self.fimsid = fimsid
        self.suffixedFlightPid = suffixedFlightPid
        self.estimateDateTime = estimateDateTime
        self.mobileid = mobileid
        self.beacon = beacon
        self.schddt = schddt
        self.terminalNo = terminalNo
        self.flttp = flttp
        self.schddttm = schddttm
        self.counterNoRange = counterNoRange
        self.gateNo = gateNo
        self.carouselNo = carouselNo
    }

}
