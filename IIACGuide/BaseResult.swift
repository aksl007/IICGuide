// BaseResult.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let baseResult = try? newJSONDecoder().decode(BaseResult.self, from: jsonData)

import Foundation

// MARK: - BaseResult
class BaseResult<T:Codable>: Codable {
    var code: Int?
    var status: String?
    var data: T?

    init(code: Int?, status: String?, data: T?) {
        self.code = code
        self.status = status
        self.data = data
    }
}
