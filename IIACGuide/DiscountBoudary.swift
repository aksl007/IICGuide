//
//  DiscountBoudary.swift
//  incheon
//
//  Created by DD Dev on 2020/09/16.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class DiscountBoundary: Object, Codable {
    @objc dynamic var discountUnit, discountOrder, currency, minCurrency: String?
    @objc dynamic var discountValue = 0
    @objc dynamic var roundOffPosition = 0
    @objc dynamic var minPurchaseAmount = 0
    @objc dynamic var maxDiscountAmount = 0

    convenience init(discountUnit: String?, discountOrder: String?, discountValue: Int, currency: String?, roundOffPosition: Int, minCurrency: String?, minPurchaseAmount: Int, maxDiscountAmount: Int) {
        self.init()
        self.discountUnit = discountUnit
        self.discountOrder = discountOrder
        self.discountValue = discountValue
        self.currency = currency
        self.roundOffPosition = roundOffPosition
        self.minCurrency = minCurrency
        self.minPurchaseAmount = minPurchaseAmount
        self.maxDiscountAmount = maxDiscountAmount
    }
}
