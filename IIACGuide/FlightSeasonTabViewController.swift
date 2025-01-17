//
//  FlightSeasonTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/09/30.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightSeasonTabViewController: BaseViewController {
    
    var type = "dep"
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightSeasonTabViewController.self))
        initUi()
    }
    
}
//UI
extension FlightSeasonTabViewController {
    
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
        self.setNavigationItemTitle(title: "slide_flight_sub_menu_1".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}
extension FlightSeasonTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let flightDepartureVC = FlightSeasonViewController()
        flightDepartureVC.type = "dep"
        tabs.append(flightDepartureVC)
        tabTitles.append("flights_departure_info_title".localized)
        
        let flightArriveVC = FlightSeasonViewController()
        flightArriveVC.type = "arr"
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
