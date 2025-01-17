//
//  Map.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class Map:Object, Codable {
    @objc dynamic var floor, area, mapKoImageFileURL, terminalID: String?
    @objc dynamic var mapZhImageFileURL, mapJaImageFileURL, mapEnImageFileURL: String?

    enum CodingKeys: String, CodingKey {
        case floor, area
        case mapKoImageFileURL = "mapKoImageFileUrl"
        case terminalID = "terminalId"
        case mapZhImageFileURL = "mapZhImageFileUrl"
        case mapJaImageFileURL = "mapJaImageFileUrl"
        case mapEnImageFileURL = "mapEnImageFileUrl"
    }

    convenience init(floor: String?, area: String?, mapKoImageFileURL: String?, terminalID: String?, mapZhImageFileURL: String?, mapJaImageFileURL: String?, mapEnImageFileURL: String?) {
        self.init()
        self.floor = floor
        self.area = area
        self.mapKoImageFileURL = mapKoImageFileURL
        self.terminalID = terminalID
        self.mapZhImageFileURL = mapZhImageFileURL
        self.mapJaImageFileURL = mapJaImageFileURL
        self.mapEnImageFileURL = mapEnImageFileURL
    }
}
