//
//  ProhibitedItemTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ProhibitedItemTabViewController: BaseViewController {

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ProhibitedItemTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension ProhibitedItemTabViewController {
    
    func initUi(){
        setNavigationItems()
        
//        //viewPager
        setUpTabs()
        setUpViewPager(delegate: self)
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "home_drag_menu_7".localized)
        self.navigationItem.rightBarButtonItem = getBarButtonAllSearch()
    }
    
}
extension ProhibitedItemTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let prohibitedItemVC = ProhibitedItemViewController()
        tabs.append(prohibitedItemVC)
        tabTitles.append("prohibited_item".localized)
        
        let fAQVC = FAQViewController()
        tabs.append(fAQVC)
        tabTitles.append("prohibited_item_faq".localized)
        
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
