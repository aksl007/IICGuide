//
//  PublicTransportViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PublicTransportViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    var terminalType = "T1"
    var currentTap = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PublicTransportViewController.self))
        
        self.initUi()
    }
    
}
//UI
extension PublicTransportViewController {
    
    func initUi(){
        setNavigationItems()
        
//        //viewPager
        setUpTabs()
        
        if terminalType == "T2"{
            setUpViewPager(delegate: self, currentTab: 1)
        }else{
            setUpViewPager(delegate: self)
        }
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "home_drag_menu_5".localized)
        self.navigationItem.rightBarButtonItem = getBarButtonAllSearch()
    }
    
}
extension PublicTransportViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let publicTransportSubT1VC = PublicTransportSubViewController()
        publicTransportSubT1VC.terminalType = "T1"
        publicTransportSubT1VC.currentTap = self.currentTap
        tabs.append(publicTransportSubT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let publicTransportSubT2VC = PublicTransportSubViewController()
        publicTransportSubT2VC.terminalType = "T2"
        publicTransportSubT2VC.currentTap = self.currentTap
        tabs.append(publicTransportSubT2VC)
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
