//
//  AirportTransferTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransferTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 4
    
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransferTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirportTransferTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: currentTap)
        
        self.setNavigationItemTitle(title: "slide_airport_guide_sub_menu_2".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}

extension AirportTransferTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            if i == 1 {
                let AirportTransfer1VC = AirportTransfer1ViewController()
                tabs.append(AirportTransfer1VC)
            }else if i == 2 {
                let AirportTransfer2VC = AirportTransfer2ViewController()
                tabs.append(AirportTransfer2VC)
            }else if i == 3 {
                let AirportTransfer3VC = AirportTransfer3ViewController()
                tabs.append(AirportTransfer3VC)
            }else if i == 4 {
                let AirportTransfer4VC = AirportTransfer4ViewController()
                tabs.append(AirportTransfer4VC)
            }
            
            tabTitles.append("transfer_category_\(i)".localized)
        }
        
//        "transfer_category_1" = "환승절차";
//        "transfer_category_2" = "환승경로";
//        "transfer_category_3" = "환승편의시설";
//        "transfer_category_4" = "환승투어";
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

