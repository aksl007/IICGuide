//
//  RealTimeSubViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class RealTimeSubViewController: BaseViewController {
    
    var terminalType = "T1"

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 4
    
    var subCurrentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: RealTimeSubViewController.self))
        initUi()
    }
    
}
//UI
extension RealTimeSubViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: self.subCurrentTap)
        
    }
    
}
extension RealTimeSubViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let parkingInfoVC = ParkingInfoViewController()
        parkingInfoVC.terminalType = self.terminalType
        tabs.append(parkingInfoVC)
        tabTitles.append("real_time_info_category_1".localized)
        
        let realTimeInfoVC = RealTimeInfoViewController()
        realTimeInfoVC.terminalType = self.terminalType
        tabs.append(realTimeInfoVC)
        tabTitles.append("real_time_info_category_2".localized)
        
        let arrCongestionVC = ArrCongestionViewController()
        arrCongestionVC.terminalType = self.terminalType
        tabs.append(arrCongestionVC)
        tabTitles.append("real_time_info_category_3".localized)
        
        let passengerCongestionVC = PassengerCongestionViewController()
        passengerCongestionVC.terminalType = self.terminalType
        tabs.append(passengerCongestionVC)
        tabTitles.append("real_time_info_category_4".localized)
        
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
