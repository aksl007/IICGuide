//
//  FacilityTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FacilityTabViewController: BaseViewController {
    
    var paramType = "shopping"
    var terminalType = "T1"
    var currentTap = 0

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FacilityTabViewController.self))
        self.initUi()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}
//UI
extension FacilityTabViewController {
    
    func initUi(){
        setNavigationItems()
        
        //viewPager
        setUpTabs()
        
        if terminalType == "T2" {
            setUpViewPager(delegate: self,currentTab: 1)
        }else{
            setUpViewPager(delegate: self)
        }
        
        
    }
    
    func setNavigationItems(){
        
        if self.paramType == "shopping" {
            self.setNavigationItemTitle(title: "slide_shop_sub_menu_0".localized)
        }else if self.paramType == "food" {
            self.setNavigationItemTitle(title: "slide_shop_sub_menu_1".localized)
        }else if self.paramType == "rest" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_0".localized)
        }else if self.paramType == "medical" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_1".localized)
        }else if self.paramType == "finance" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_2".localized)
        }else if self.paramType == "other" {
            self.setNavigationItemTitle(title: "slide_convenience_sub_menu_3".localized)
        }else if self.paramType == "immigration" {
            self.setNavigationItemTitle(title: "slide_airport_guide_sub_menu_3".localized)
        }
        
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}

extension FacilityTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        if self.paramType == "immigration" {
            let FacilityListT1VC = FacilityListViewController()
            FacilityListT1VC.terminalType = "T1"
            FacilityListT1VC.paramType = self.paramType
            FacilityListT1VC.category = ["10796"]
            
            tabs.append(FacilityListT1VC)
            tabTitles.append("flights_list_t1".localized)
            
            let FacilityListT2VC = FacilityListViewController()
            FacilityListT2VC.terminalType = "T2"
            FacilityListT2VC.paramType = self.paramType
            FacilityListT2VC.category = ["10796"]
            
            tabs.append(FacilityListT2VC)
            tabTitles.append("flights_list_t2".localized)
        }else{
            let facilitySubTabViewT1VC = FacilitySubTabViewController()
            facilitySubTabViewT1VC.terminalType = "T1"
            facilitySubTabViewT1VC.paramType = self.paramType
            facilitySubTabViewT1VC.currentTap = self.currentTap
            tabs.append(facilitySubTabViewT1VC)
            tabTitles.append("flights_list_t1".localized)
            
            let facilitySubTabViewT2VC = FacilitySubTabViewController()
            facilitySubTabViewT2VC.terminalType = "T2"
            facilitySubTabViewT2VC.paramType = self.paramType
            facilitySubTabViewT2VC.currentTap = self.currentTap
            tabs.append(facilitySubTabViewT2VC)
            tabTitles.append("flights_list_t2".localized)
        }
        
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
