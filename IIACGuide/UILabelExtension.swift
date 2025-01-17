//
//  UILabelExtension.swift
//  incheon
//
//  Created by 김진성 on 2020/08/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func addArrow(width: CGFloat) {
        let imageView = UIImageView(image: UIImage(named: "icon_arrow_right"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: width - SizeUtils.sideMargin - SizeUtils.contentsMargin, y: SizeUtils.buttonHeight / 2 - (SizeUtils.iconSizeSmall / 2), width: SizeUtils.iconSizeSmall, height: SizeUtils.iconSizeSmall)
        self.addSubview(imageView)
        
    }
    func addCall(width: CGFloat) {
        let imageView = UIImageView(image: UIImage(named: "icon_list_call"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: width - SizeUtils.sideMargin - SizeUtils.contentsMargin, y: SizeUtils.buttonHeight / 2 - (SizeUtils.iconSizeSmall / 2), width: SizeUtils.iconSizeSmall, height: SizeUtils.iconSizeSmall)
        self.addSubview(imageView)
        
    }
    func addImage(width: CGFloat, image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: width - SizeUtils.sideMargin - SizeUtils.contentsMargin, y: SizeUtils.buttonHeight / 2 - (SizeUtils.iconSizeSmall / 2), width: SizeUtils.iconSizeSmall, height: SizeUtils.iconSizeSmall)
        self.addSubview(imageView)
        
    }
    
    func setHTMLFromString(htmlText: String) {
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(self.font!.pointSize); color:'red' \">%@</span>", htmlText)

        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)

        self.attributedText = attrStr
    }
}
