//
//  Menu.swift
//  incheon
//
//  Created by DD Dev on 2020/07/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

class Menu{

    var icon : UIImage?
    var title : String?
    var isSub : Bool!
    var isHidden : Bool!
    
    init(icon: UIImage, title: String, isSub: Bool, isHidden: Bool) {
        self.icon = icon
        self.title = title
        self.isSub = isSub
        self.isHidden = isHidden
    }
    
}
