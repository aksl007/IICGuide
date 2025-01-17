//
//  BeaconPlan.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
class BeaconPlan: Codable {
    var msgko1, msgko2: String?
    var msgen1, msgen2: String?
    var msgzh1, msgzh2: String?
    var msgja1, msgja2: String?
    var beaconmajor: Int?
    var sectioncd, msgname, beaconuuid: String?
    var beaconminor: Int?
    var zonecd, areacd, terminalid, suffixedFlightPid: String?

    init(msgko1: String?, msgko2: String?,msgen1: String?, msgen2: String?,msgzh1: String?, msgzh2: String?,msgja1: String?, msgja2: String?, beaconmajor: Int?, sectioncd: String?, msgname: String?, beaconuuid: String?, beaconminor: Int?, zonecd: String?, areacd: String?, terminalid: String?, suffixedFlightPid:String?) {
        self.msgko1 = msgko1
        self.msgko2 = msgko2
        self.msgen1 = msgen1
        self.msgen2 = msgen2
        self.msgzh1 = msgzh1
        self.msgzh2 = msgzh2
        self.msgja1 = msgja1
        self.msgja2 = msgja2
        self.beaconmajor = beaconmajor
        self.sectioncd = sectioncd
        self.msgname = msgname
        self.beaconuuid = beaconuuid
        self.beaconminor = beaconminor
        self.zonecd = zonecd
        self.areacd = areacd
        self.terminalid = terminalid
        self.suffixedFlightPid = suffixedFlightPid
    }
}
