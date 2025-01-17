//
//  PassengerCongestionViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PassengerCongestionViewController: BaseViewController {
    
    var terminalType = "T1"

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PassengerCongestionViewController.self))
        self.initUi()
    }
    
}
//UI
extension PassengerCongestionViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}
extension PassengerCongestionViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let passengerCongestionSubDepVC = PassengerCongestionSubViewController()
        passengerCongestionSubDepVC.terminalType = self.terminalType
        passengerCongestionSubDepVC.type = "dep"
        tabs.append(passengerCongestionSubDepVC)
        tabTitles.append("passenger_category_1".localized)
        
        let passengerCongestionSubArrVC = PassengerCongestionSubViewController()
        passengerCongestionSubArrVC.terminalType = self.terminalType
        passengerCongestionSubArrVC.type = "arr"
        tabs.append(passengerCongestionSubArrVC)
        tabTitles.append("passenger_category_2".localized)
        
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
