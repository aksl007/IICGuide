// Localed.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let localed = try? newJSONDecoder().decode(Localed.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Localed
class Localed: Object, Codable {
    @objc dynamic var ko, en, ja, zh: String?

    convenience init(ko: String?, en: String?, ja: String?, zh: String?) {
        self.init()
        self.ko = ko
        self.en = en
        self.ja = ja
        self.zh = zh
    }
 
}
