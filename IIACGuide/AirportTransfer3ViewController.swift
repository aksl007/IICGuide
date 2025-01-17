//
//  AirportTransfer3ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransfer3ViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransfer3ViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirportTransfer3ViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}
extension AirportTransfer3ViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            if i == 1 {
                let AirportTransferListT1VC = AirportTransferListViewController()
                AirportTransferListT1VC.currentTab = 0
                tabs.append(AirportTransferListT1VC)
            }else if i == 2 {
                let AirportTransferListT2VC = AirportTransferListViewController()
                AirportTransferListT2VC.currentTab = 1
                tabs.append(AirportTransferListT2VC)
            }else if i == 3 {
                let AirportTransferListT3VC = AirportTransferListViewController()
                AirportTransferListT3VC.currentTab = 2
                tabs.append(AirportTransferListT3VC)
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

