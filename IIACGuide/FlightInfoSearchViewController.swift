//
//  FlightInfoSearchViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightInfoSearchViewController: BaseViewController {
    
    var type = "dep"
    var date = ""
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightInfoSearchViewController.self))
        initUi()
    }
    
}
//UI
extension FlightInfoSearchViewController {
    
    func initUi(){
        setNavigationItems()
        
//        //viewPager
        setUpTabs()
        
        var currentTab = 0
        if self.type == "arr" {
            currentTab = 1
        }
        setUpViewPager(delegate: self, currentTab: currentTab)
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "flight_search_title".localized)
        
    }
    
}
extension FlightInfoSearchViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let flightDepartureVC = FlightInfoSearchSubViewController()
        flightDepartureVC.type = "dep"
        flightDepartureVC.date = self.date
        tabs.append(flightDepartureVC)
        tabTitles.append("flights_departure_info_title".localized)
        
        let flightArriveVC = FlightInfoSearchSubViewController()
        flightArriveVC.type = "arr"
        flightArriveVC.date = self.date
        tabs.append(flightArriveVC)
        tabTitles.append("flights_arrival_info_title".localized)
        
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
