//
//  LoadingSplash.swift
//  incheon
//
//  Created by DD Dev on 2020/07/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import Foundation
import UIKit

class LoadingSplash {
    private static let sharedInstance = LoadingSplash()
    
    private var backgroundView: UIView?
    private var popupView: UIImageView?
    
    class func show() {
        
        if let window = UIApplication.shared.keyWindow {
            
            let backgroundView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            
            let popupView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: window.frame.width - 100 , height: (window.frame.width - 100) * 154 / 800))
            popupView.animationImages = LoadingSplash.getAnimationImageArray()
            popupView.animationDuration = 2.5
            popupView.animationRepeatCount = 0
            
            window.addSubview(backgroundView)
            window.addSubview(popupView)
            
            backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
            backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            
            popupView.center = CGPoint(x: window.frame.width / 2, y: window.frame.height * 70 / 100)
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
            popupView.stopAnimating()
            backgroundView.removeFromSuperview()
            popupView.removeFromSuperview()
        }
    }
    
    private class func getAnimationImageArray() -> [UIImage] {
        var animationArray: [UIImage] = []
        animationArray.append(UIImage(named: "loading_01")!)
        animationArray.append(UIImage(named: "loading_02")!)
        animationArray.append(UIImage(named: "loading_03")!)
        animationArray.append(UIImage(named: "loading_04")!)
        animationArray.append(UIImage(named: "loading_05")!)
        animationArray.append(UIImage(named: "loading_06")!)
        animationArray.append(UIImage(named: "loading_07")!)
        animationArray.append(UIImage(named: "loading_08")!)
        animationArray.append(UIImage(named: "loading_09")!)
        animationArray.append(UIImage(named: "loading_10")!)
        return animationArray
    }
}
