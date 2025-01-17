//
//  FavoriteTabViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FavoriteTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FavoriteTabViewController.self))
        self.initUi()
    }

}
//UI
extension FavoriteTabViewController {
    
    func initUi(){
        setNavigationItems()
        
        //viewPager
        setUpTabs()
        setUpViewPager(delegate: self)
        
    }
    
    func setNavigationItems(){
        
        self.setNavigationItemTitle(title: "home_bottom_menu_4".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}
extension FavoriteTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let favoriteSubTabT1VC = FavoriteSubTabViewController()
        favoriteSubTabT1VC.terminalType = "T1"
        tabs.append(favoriteSubTabT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let favoriteSubTabT2VC = FavoriteSubTabViewController()
        favoriteSubTabT2VC.terminalType = "T2"
        tabs.append(favoriteSubTabT2VC)
        tabTitles.append("flights_list_t2".localized)
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

