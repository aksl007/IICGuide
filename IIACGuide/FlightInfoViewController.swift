//
//  FlightInfoViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FlightInfoViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FlightInfoViewController.self))
        initUi()
    }

}
//UI
extension FlightInfoViewController {
    
    func initUi(){
        setNavigationItems()
        
        //viewPager
        setUpTabs()
        setUpViewPager(delegate: self)
        
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "flights_flight_info".localized)
        
        self.navigationItem.rightBarButtonItem = getBarButtonSearchFlight()
    }
    
}

extension FlightInfoViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let flightDepartureVC = FlightDepartureViewController()
        tabs.append(flightDepartureVC)
        tabTitles.append("flights_departure_info_title".localized)
        
        let flightArriveVC = FlightArriveViewController()
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
