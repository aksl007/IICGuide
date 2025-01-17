//
//  UIButtonExtension.swift
//  incheon
//
//  Created by DD Dev on 2020/08/18.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func preventRepeatedPresses(inNext seconds: Double = 1) {
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            self.isUserInteractionEnabled = true
        }
    }
}
