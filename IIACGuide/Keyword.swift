//
//  Keyword.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift
class Keyword: Object {
    
    @objc dynamic var insertDate, keyword: String?
    
    override static func indexedProperties() -> [String] {
        return ["insertDate"]
    }

    convenience init(insertDate: String?,keyword: String?) {
        self.init()
        self.insertDate = insertDate
        self.keyword = keyword
    }
}
