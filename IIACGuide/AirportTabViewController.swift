//
//  AirportTabViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTabViewController: BaseViewController{
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 8
    
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension AirportTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: currentTap)
        
        self.setNavigationItemTitle(title: "slide_airport_guide_sub_menu_0".localized)
        
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}

extension AirportTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            
            
            if i == 1 {
                let AirportDeparture1VC = AirportDeparture1ViewController()
                tabs.append(AirportDeparture1VC)
            }else if i == 2 {
                let AirportDeparture2VC = AirportDeparture2ViewController()
                tabs.append(AirportDeparture2VC)
            }else if i == 3 {
                let AirportDeparture3VC = AirportDeparture3ViewController()
                tabs.append(AirportDeparture3VC)
            }else if i == 4 {
                let AirportDeparture4VC = AirportDeparture4ViewController()
                tabs.append(AirportDeparture4VC)
            }else if i == 5 {
                let AirportDeparture5VC = AirportDeparture5ViewController()
                tabs.append(AirportDeparture5VC)
            }else if i == 6 {
                let AirportDeparture6VC = AirportDeparture6ViewController()
                tabs.append(AirportDeparture6VC)
            }else if i == 7 {
                let AirportDeparture7VC = AirportDeparture7ViewController()
                tabs.append(AirportDeparture7VC)
            }else if i == 8 {
                let AirportDeparture8VC = AirportDeparture8ViewController()
                tabs.append(AirportDeparture8VC)
            }else{
                let AirportDeparture1VC = AirportDeparture1ViewController()
                tabs.append(AirportDeparture1VC)
            }
            
            tabTitles.append("airport_departure_title_\(i)".localized)
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

