//
//  AirlineAssignTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirlineAssignTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 3
    
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirlineAssignTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirlineAssignTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: currentTap)
        
        self.setNavigationItemTitle(title: "transfer_assignment".localized)
    }
    
}

extension AirlineAssignTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            if i == 1 {
                let AirlineAssignT1VC = AirlineAssignViewController()
                AirlineAssignT1VC.currentTab = 0
                tabs.append(AirlineAssignT1VC)
            }else if i == 2 {
                let AirlineAssignT2VC = AirlineAssignViewController()
                AirlineAssignT2VC.currentTab = 1
                tabs.append(AirlineAssignT2VC)
            }else if i == 3 {
                let AirlineAssignT3VC = AirlineAssignViewController()
                AirlineAssignT3VC.currentTab = 2
                tabs.append(AirlineAssignT3VC)
            }
            
            tabTitles.append("transfer_sub_category_\(i)".localized)
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

