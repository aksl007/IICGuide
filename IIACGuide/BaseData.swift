// BaseData.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let Basedata = try? newJSONDecoder().decode(BaseData.self, from: jsonData)

import Foundation

// MARK: - BaseData
class BaseData<T: Codable>: Codable {
    var results: [T]?
    var totalCount: Int?

    init(results: [T]?, totalCount: Int?) {
        self.results = results
        self.totalCount = totalCount
    }
}
