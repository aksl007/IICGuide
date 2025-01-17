//
//  AirportArriveTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportArriveTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 6
    
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportArriveTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirportArriveTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: currentTap)
        
        self.setNavigationItemTitle(title: "slide_airport_guide_sub_menu_1".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}

extension AirportArriveTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            
            if i == 1 {
                let AirportArrive1VC = AirportArrive1ViewController()
                tabs.append(AirportArrive1VC)
            }else if i == 2 {
                let AirportArrive2VC = AirportArrive2ViewController()
                tabs.append(AirportArrive2VC)
            }else if i == 3 {
                let AirportArrive3VC = AirportArrive3ViewController()
                tabs.append(AirportArrive3VC)
            }else if i == 4 {
                let AirportArrive4VC = AirportArrive4ViewController()
                tabs.append(AirportArrive4VC)
            }else if i == 5 {
                let AirportArrive5VC = AirportArrive5ViewController()
                tabs.append(AirportArrive5VC)
            }else if i == 6 {
                let AirportArrive6VC = AirportArrive6ViewController()
                tabs.append(AirportArrive6VC)
            }else{
                let AirportArrive1VC = AirportArrive1ViewController()
                tabs.append(AirportArrive1VC)
            }
            
            tabTitles.append("airport_arrival_title_\(i)".localized)
        }
        
        //
        //        "airport_departure_title_1" = "탑승 수속";
        //        "airport_departure_title_2" = "수하물 보내기";
        //        "airport_departure_title_3" = "병무 신고";
        //        "airport_departure_title_4" = "검역신고";
        //        "airport_departure_title_5" = "출국세관신고";
        //        "airport_departure_title_6" = "보안검색";
        //        "airport_departure_title_7" = "출국심사";
        //        "airport_departure_title_8" = "셔틀트레인";
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

