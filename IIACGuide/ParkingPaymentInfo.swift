//
//  ParkingPaymentInfo.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class ParkingPaymentInfo: Codable {
    var parkingTime, parkingLot, parkingProcNo, subOrderNo: String?
    var fee, fullCarNo, cmd, entryDateTime: String?
    var paymentDateTime, errorNo, errorMsg: String?

    init(parkingTime: String?, parkingLot: String?, parkingProcNo: String?, subOrderNo: String?, fee: String?, fullCarNo: String?, cmd: String?, entryDateTime: String?, paymentDateTime: String?, errorNo: String?, errorMsg: String?) {
        self.parkingTime = parkingTime
        self.parkingLot = parkingLot
        self.parkingProcNo = parkingProcNo
        self.subOrderNo = subOrderNo
        self.fee = fee
        self.fullCarNo = fullCarNo
        self.cmd = cmd
        self.entryDateTime = entryDateTime
        self.paymentDateTime = paymentDateTime
        self.errorNo = errorNo
        self.errorMsg = errorMsg
    }
}
