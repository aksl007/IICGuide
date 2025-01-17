//
//  Loading.swift
//  incheon
//
//  Created by DD Dev on 2020/08/05.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

class Loading {
    private static let sharedInstance = Loading()
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    
    private var backgroundView: UIView?
    private var popupView: UIImageView?
    
    class func show() {
        
        if let window = UIApplication.shared.keyWindow {
            
            let backgroundView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            
            let popupView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: window.frame.width / 3 , height: window.frame.width / 3))
                
            popupView.image = UIImage(named: "loading_popup")
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = 2.5
            rotationAnimation.repeatCount = Float.infinity

            popupView.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
            
            window.addSubview(backgroundView)
            window.addSubview(popupView)
            
            backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
            backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            
            popupView.center = CGPoint(x: window.frame.width / 2, y: window.frame.height / 2)
            popupView.startAnimating()
            
            sharedInstance.backgroundView?.removeFromSuperview()
            sharedInstance.popupView?.removeFromSuperview()
            sharedInstance.backgroundView = backgroundView
            sharedInstance.popupView = popupView
        }
    }
    
    class func hide() {
        if let popupView = sharedInstance.popupView,
            let backgroundView = sharedInstance.backgroundView {
            popupView.layer.removeAllAnimations()
            backgroundView.removeFromSuperview()
            popupView.removeFromSuperview()
        }
    }

}
