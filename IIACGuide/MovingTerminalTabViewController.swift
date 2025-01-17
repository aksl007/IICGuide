//
//  MovingTerminalTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/01.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MovingTerminalTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    var terminalType = "T1"
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MovingTerminalTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension MovingTerminalTabViewController {
    
    func initUi(){
        setNavigationItems()
        
        //viewPager
        setUpTabs()
        
        if terminalType == "T2" {
            setUpViewPager(delegate: self, currentTab: 1)
        }else{
            setUpViewPager(delegate: self)
        }
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "slide_transport_sub_menu_2".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}
extension MovingTerminalTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let movingTerminalDepartureVC = MovingTerminalViewController()
        movingTerminalDepartureVC.terminalType = "T1"
        tabs.append(movingTerminalDepartureVC)
        tabTitles.append("flights_list_t1".localized)
        
        let movingTerminalArriveVC = MovingTerminalViewController()
        movingTerminalArriveVC.terminalType = "T2"
        tabs.append(movingTerminalArriveVC)
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
