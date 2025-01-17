//
//  FlightArriveViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightArriveViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightArriveViewController.self))
        initUi()
    }
    
}
//UI
extension FlightArriveViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}

extension FlightArriveViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let flightDepartureAllVC = FlightDepartureSubViewController()
        flightDepartureAllVC.type = "arr"
        flightDepartureAllVC.terminalType = "all"
        tabs.append(flightDepartureAllVC)
        tabTitles.append("flights_list_all".localized)
        
        let flightDepartureT1VC = FlightDepartureSubViewController()
        flightDepartureT1VC.type = "arr"
        flightDepartureT1VC.terminalType = "t1"
        tabs.append(flightDepartureT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let flightDepartureT2VC = FlightDepartureSubViewController()
        flightDepartureT2VC.type = "arr"
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
