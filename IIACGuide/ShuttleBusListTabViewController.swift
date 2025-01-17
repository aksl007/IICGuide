//
//  ShuttleBusListTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ShuttleBusListTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ShuttleBusListTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension ShuttleBusListTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
        self.setNavigationItemTitle(title: "transfer_assignment".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
        
    }
    
}

extension ShuttleBusListTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            if i == 1 {
                let ShuttleBusListT1VC = ShuttleBusListViewController()
                ShuttleBusListT1VC.usid = "00000"
                tabs.append(ShuttleBusListT1VC)
            }else if i == 2 {
                let ShuttleBusListT2VC = ShuttleBusListViewController()
                ShuttleBusListT2VC.usid = "00001"
                tabs.append(ShuttleBusListT2VC)
            }else if i == 3 {
                let ShuttleBusListT3VC = ShuttleBusListViewController()
                ShuttleBusListT3VC.usid = "00004"
                tabs.append(ShuttleBusListT3VC)
            }
            
            tabTitles.append("staff_shuttle_category_\(i + 1)".localized)
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

