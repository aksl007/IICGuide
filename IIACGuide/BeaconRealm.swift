//
//  BeaconRealm.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift
class BeaconRealm:Object, Codable {
    @objc dynamic var todayAndMinor: String?
    
    convenience init(todayAndMinor: String?) {
        self.init()
        self.todayAndMinor = todayAndMinor
        
    }
}
