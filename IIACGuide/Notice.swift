//
//  Notice.swift
//  incheon
//
//  Created by DD Dev on 2020/09/18.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import RealmSwift

class Notice:Object, Codable {
    @objc dynamic var mainImageFile, fileURL: Localed?
    @objc dynamic var endDate, usid: String?
    @objc dynamic var title: Localed?
    @objc dynamic var buttonName, linkURL: Localed?
    @objc dynamic var popupImageFile: Localed?
    @objc dynamic var popupEnabled = false
    var prefPopupEnable = false
    
    @objc dynamic var startDate: String?
    @objc dynamic var content: Localed?

    enum CodingKeys: String, CodingKey {
        case mainImageFile
        case fileURL = "fileUrl"
        case endDate, usid, title, buttonName
        case linkURL = "linkUrl"
        case popupImageFile, popupEnabled, startDate, content
    }

    convenience init(mainImageFile: Localed?, fileURL: Localed?, endDate: String?, usid: String?, title: Localed?, buttonName: Localed?, linkURL: Localed?, popupImageFile: Localed?, popupEnabled: Bool, startDate: String?, content: Localed?) {
        self.init()
        self.mainImageFile = mainImageFile
        self.fileURL = fileURL
        self.endDate = endDate
        self.usid = usid
        self.title = title
        self.buttonName = buttonName
        self.linkURL = linkURL
        self.popupImageFile = popupImageFile
        self.popupEnabled = popupEnabled
        self.startDate = startDate
        self.content = content
    }
}
