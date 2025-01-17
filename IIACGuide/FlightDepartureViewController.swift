//
//  FlightDepartureViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightDepartureViewController: BaseViewController {

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightDepartureViewController.self))
        initUi()
    }

}
//UI
extension FlightDepartureViewController {
    
    func initUi(){
        
        self.view.backgroundColor = .red
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}

extension FlightDepartureViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let flightDepartureAllVC = FlightDepartureSubViewController()
        flightDepartureAllVC.type = "dep"
        flightDepartureAllVC.terminalType = "all"
        tabs.append(flightDepartureAllVC)
        tabTitles.append("flights_list_all".localized)
        
        let flightDepartureT1VC = FlightDepartureSubViewController()
        flightDepartureT1VC.type = "dep"
        flightDepartureT1VC.terminalType = "t1"
        tabs.append(flightDepartureT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let flightDepartureT2VC = FlightDepartureSubViewController()
        flightDepartureT2VC.type = "dep"
        flightDepartureT2VC.terminalType = "t2"
        tabs.append(flightDepartureT2VC)
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
