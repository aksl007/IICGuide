//
//  SearchSlide.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/09/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation

class SearchSlide: Codable {
    var slideId, pageId: String?
    var terminalId: String?

    enum CodingKeys: String, CodingKey {
        case slideId = "slideId"
        case pageId = "pageId"
        case terminalId = "terminalId"
    }

    init(slideId: String?, pageId: String?, terminalId: String?) {
        self.slideId = slideId
        self.slideId = pageId
        self.terminalId = terminalId
    }
}
