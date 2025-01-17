//
//  AirportTransfer2ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransfer2ViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransfer2ViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirportTransfer2ViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}
extension AirportTransfer2ViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            if i == 1 {
                let AirportTransferPathT1VC = AirportTransferPathViewController()
                AirportTransferPathT1VC.currentTab = 0
                tabs.append(AirportTransferPathT1VC)
            }else if i == 2 {
                let AirportTransferPathT2VC = AirportTransferPathViewController()
                AirportTransferPathT2VC.currentTab = 1
                tabs.append(AirportTransferPathT2VC)
            }else if i == 3 {
                let AirportTransferPathT3VC = AirportTransferPathViewController()
                AirportTransferPathT3VC.currentTab = 2
                tabs.append(AirportTransferPathT3VC)
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

