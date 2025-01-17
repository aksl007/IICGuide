//
//  FavoriteSubTabViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FavoriteSubTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 4
    
    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FavoriteSubTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension FavoriteSubTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}

extension FavoriteSubTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1 ..< 5 {
            
            let favoriteVC = FavoriteViewController()
            favoriteVC.terminalType = self.terminalType
            favoriteVC.category = "\(i - 1)"
            tabs.append(favoriteVC)
            tabTitles.append("favorite_category_\(i)".localized)
        }
        

        
    }
    
    func wtsNumberOfTabs() -> Int {
        return numberOfTabs
    }
    
    func wtsViewOfTab(index: Int) -> UIView {
        return tabs[index].view
    }
    
    func wtsTitleForTab(index: Int) -> String {
        return tabTitles[index]
    }
    
    func wtsDidSelectTab(index: Int) {
        print("selected index:\(index)")
    }
    
    func wtsReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
    func wtsReachedRightEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
}
