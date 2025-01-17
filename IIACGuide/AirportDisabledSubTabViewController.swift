//
//  AirportDisabledSubTabViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledSubTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 6
    
    var terminalType = "T1"
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledSubTabViewController.self))
        if terminalType == "T2" {
            self.numberOfTabs = 5
        }
        
        self.initUi()
    }
    
}
//UI
extension AirportDisabledSubTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        
        if self.terminalType == "T2" && self.currentTap > 1 {
            setUpSubViewPager(delegate : self, index: currentTap - 1)
        }else{
            setUpSubViewPager(delegate : self, index: currentTap)
        }
        
        
    }
    
}

extension AirportDisabledSubTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let AirportDisabledTransportVC = AirportDisabledTransportViewController()
        AirportDisabledTransportVC.terminalType = self.terminalType
        
        tabs.append(AirportDisabledTransportVC)
        tabTitles.append("disabled_elderly_category_1".localized)
        
        
        if self.terminalType == "T1" {
            let AirportDisabledElectricCartVC = AirportDisabledElectricCartViewController()
            AirportDisabledElectricCartVC.terminalType = self.terminalType
            
            tabs.append(AirportDisabledElectricCartVC)
            tabTitles.append("disabled_elderly_category_2".localized)
        }
        
        let AirportDisabledParkingVC = AirportDisabledParkingViewController()
        AirportDisabledParkingVC.terminalType = self.terminalType
        
        tabs.append(AirportDisabledParkingVC)
        tabTitles.append("disabled_elderly_category_3".localized)
        
        
        let AirportDisabledFastTrackVC = AirportDisabledFastTrackViewController()
        AirportDisabledFastTrackVC.terminalType = self.terminalType
        
        tabs.append(AirportDisabledFastTrackVC)
        tabTitles.append("disabled_elderly_category_4".localized)
        
        let AirportDisabledAmenitiesVC = AirportDisabledAmenitiesViewController()
        AirportDisabledAmenitiesVC.terminalType = self.terminalType
        
        tabs.append(AirportDisabledAmenitiesVC)
        tabTitles.append("disabled_elderly_category_5".localized)
        
        let AirportDisabledEmergencyVC = AirportDisabledEmergencyViewController()
        AirportDisabledEmergencyVC.terminalType = self.terminalType
        
        tabs.append(AirportDisabledEmergencyVC)
        tabTitles.append("disabled_elderly_category_6".localized)
        
        
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
