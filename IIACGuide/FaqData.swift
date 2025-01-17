//
//  FaqData.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class FaqData: Codable {
    var title, contents, tel: String?
    var isHidden: Bool?

    enum CodingKeys: String, CodingKey {
        case title, contents, tel
        case isHidden
    }

    init(title: String?, contents: String?, tel: String?, isHidden: Bool?) {
        self.title = title
        self.contents = contents
        self.tel = tel
        self.isHidden = isHidden
    }
}
