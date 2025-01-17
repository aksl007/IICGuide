//
//  PublicTransportSubViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class PublicTransportSubViewController: BaseViewController {

    var terminalType = "T1"

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 5
    
    var currentTap = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PublicTransportSubViewController.self))
        
        if self.terminalType == "T2" {
            self.numberOfTabs = 4
        }
        
        self.initUi()
    }
}
//UI
extension PublicTransportSubViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: self.currentTap)

    }
    
}
extension PublicTransportSubViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let busVC = BusViewController()
        busVC.terminalType = self.terminalType
        tabs.append(busVC)
        tabTitles.append("transport_category_1".localized)
        
        let AREXVC = AREXViewController()
        AREXVC.terminalType = self.terminalType
        tabs.append(AREXVC)
        tabTitles.append("transport_category_2".localized)
        
        let TaxiVC = TaxiViewController()
        TaxiVC.terminalType = self.terminalType
        tabs.append(TaxiVC)
        tabTitles.append("transport_category_3".localized)
        
        let ShuttleBusVC = ShuttleBusViewController()
        ShuttleBusVC.terminalType = self.terminalType
        tabs.append(ShuttleBusVC)
        tabTitles.append("transport_category_4".localized)
        
        let MaglevLineVC = MaglevLineViewController()
        MaglevLineVC.terminalType = self.terminalType
        tabs.append(MaglevLineVC)
        tabTitles.append("transport_category_5".localized)
        
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
