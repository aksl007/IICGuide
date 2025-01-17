//
//  AirBrsBagData.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class AirBrsBagData: Codable {
    var fltIden, sdtDateFlt, bagTagNum, bagTagSixNum: String?
    var bagTagEightNum, arrAirportcode, transactDate, transactId: String?
    var seatNo, usid, destinationAirportCode: String?
    var localedDestinationAirport: Localed?
    var remark, code, result, msg: String?
    

    enum CodingKeys: String, CodingKey {
        case fltIden, sdtDateFlt, bagTagNum, bagTagSixNum
        case bagTagEightNum, arrAirportcode, transactDate, transactId
        case seatNo, usid, destinationAirportCode
        case localedDestinationAirport
        case remark, code, result, msg
    }

    init(fltIden: String?, sdtDateFlt: String?, bagTagNum: String?, bagTagSixNum: String?, bagTagEightNum: String?, arrAirportcode: String?, transactDate: String?, transactId: String?, seatNo: String?, usid: String?, destinationAirportCode: String?, remark: String?, code: String?, result: String?, msg: String?, localedDestinationAirport: Localed?) {
        self.fltIden = fltIden
        self.sdtDateFlt = sdtDateFlt
        self.bagTagNum = bagTagNum
        self.bagTagSixNum = bagTagSixNum
        self.bagTagEightNum = bagTagEightNum
        self.arrAirportcode = arrAirportcode
        self.transactDate = transactDate
        self.transactId = transactId
        self.seatNo = seatNo
        self.usid = usid
        self.destinationAirportCode = destinationAirportCode
        self.remark = remark
        self.code = code
        self.result = result
        self.msg = msg
        self.localedDestinationAirport = localedDestinationAirport
    }
}
