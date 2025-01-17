//
//  AirportDisabledTabViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2

    var terminalType = "T1"
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirportDisabledTabViewController {
    
    func initUi(){
        setNavigationItems()
        
        //viewPager
        setUpTabs()
        
        if terminalType == "T2" {
            setUpViewPager(delegate: self,currentTab: 1)
        }else{
            setUpViewPager(delegate: self)
        }
        
    }
    
    func setNavigationItems(){
        
        self.setNavigationItemTitle(title: "slide_airport_guide_sub_menu_4".localized)
        
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}

extension AirportDisabledTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let AirportDisabledSubTabViewT1VC = AirportDisabledSubTabViewController()
        AirportDisabledSubTabViewT1VC.terminalType = "T1"
        AirportDisabledSubTabViewT1VC.currentTap = self.currentTap
        tabs.append(AirportDisabledSubTabViewT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let AirportDisabledSubTabViewT2VC = AirportDisabledSubTabViewController()
        AirportDisabledSubTabViewT2VC.terminalType = "T2"
        AirportDisabledSubTabViewT2VC.currentTap = self.currentTap
        tabs.append(AirportDisabledSubTabViewT2VC)
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
