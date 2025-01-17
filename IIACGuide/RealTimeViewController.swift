//
//  RealTimeViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class RealTimeViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    var subCurrentTap = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: RealTimeViewController.self))
        initUi()
    }

}
//UI
extension RealTimeViewController {
    
    func initUi(){
        setNavigationItems()
        
//        //viewPager
        setUpTabs()
        setUpViewPager(delegate: self)
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "real_time_info_title".localized)
        self.navigationItem.rightBarButtonItem = getBarButtonAllSearch()
    }
    
}
extension RealTimeViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let realTimeSubT1VC = RealTimeSubViewController()
        realTimeSubT1VC.terminalType = "T1"
        realTimeSubT1VC.subCurrentTap = self.subCurrentTap
        tabs.append(realTimeSubT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let realTimeSubT2VC = RealTimeSubViewController()
        realTimeSubT2VC.terminalType = "T2"
        realTimeSubT2VC.subCurrentTap = self.subCurrentTap
        tabs.append(realTimeSubT2VC)
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
