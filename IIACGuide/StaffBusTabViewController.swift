//
//  StaffBusTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class StaffBusTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: StaffBusTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension StaffBusTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
        self.setNavigationItemTitle(title: "slide_staff_sub_menu_2".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
        
    }
    
}

extension StaffBusTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            if i == 1 {
                let StaffBusT1VC = StaffBusViewController()
                StaffBusT1VC.currentTab = i - 1
                tabs.append(StaffBusT1VC)
            }else if i == 2 {
                let StaffBusT2VC = StaffBusViewController()
                StaffBusT2VC.currentTab = i - 1
                tabs.append(StaffBusT2VC)
            }else if i == 3 {
                let StaffBusT3VC = StaffBusViewController()
                StaffBusT3VC.currentTab = i - 1
                tabs.append(StaffBusT3VC)
            }else if i == 4 {
                let StaffBusT4VC = StaffBusViewController()
                StaffBusT4VC.currentTab = i - 1
                tabs.append(StaffBusT4VC)
            }
            
            tabTitles.append("staff_bus_category_\(i)".localized)
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

