//
//  ParkingViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ParkingViewController: BaseViewController {

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    
    var terminalType = "T1"
    var currentTap = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingViewController.self))
        initUi()
    }
    
}
//UI
extension ParkingViewController {
    
    func initUi(){
        setNavigationItems()
        
//        //viewPager
        setUpTabs()
        
        if self.terminalType == "T2" {
            setUpViewPager(delegate: self, currentTab: 1)
        }else{
            setUpViewPager(delegate: self)
        }
        
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "slide_transport_sub_menu_1".localized)
        self.navigationItem.rightBarButtonItem = getBarButtonAllSearch()
    }
    
}
extension ParkingViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let parkingSubT1VC = ParkingSubViewController()
        parkingSubT1VC.terminalType = "T1"
        parkingSubT1VC.currentTap = self.currentTap
        tabs.append(parkingSubT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let parkingSubT2VC = ParkingSubViewController()
        parkingSubT2VC.terminalType = "T2"
        parkingSubT2VC.currentTap = self.currentTap
        tabs.append(parkingSubT2VC)
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
