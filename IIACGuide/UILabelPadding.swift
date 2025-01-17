//
//  UILabelPadding.swift
//  incheon
//
//  Created by DD Dev on 2020/08/13.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

class UILabelPadding: UILabel {

   @IBInspectable var topInset: CGFloat = 3.0
   @IBInspectable var bottomInset: CGFloat = 3.0
   @IBInspectable var leftInset: CGFloat = 20
   @IBInspectable var rightInset: CGFloat = 20

   override func drawText(in rect: CGRect) {
      let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
   }

   override var intrinsicContentSize: CGSize {
      get {
         var contentSize = super.intrinsicContentSize
         contentSize.height += topInset + bottomInset
         contentSize.width += leftInset + rightInset
         return contentSize
      }
   }
}
