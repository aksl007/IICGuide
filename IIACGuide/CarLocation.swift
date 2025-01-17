//
//  CarLocation.swift
//  incheon
//
//  Created by DD Dev on 2020/09/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift
class CarLocation: Object {
    @objc dynamic var date: String?
    @objc dynamic var lat, lng: String?

    convenience init(date: String?, lat: String?, lng: String?) {
        self.init()
        self.date = date
        self.lat = lat
        self.lng = lng
    }

}
