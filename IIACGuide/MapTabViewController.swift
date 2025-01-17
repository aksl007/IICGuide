//
//  MapTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MapTabViewController: BaseViewController {

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    let numberOfTabs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MapTabViewController.self))
        self.initUi()
    }
    
}
//UI
extension MapTabViewController {
    
    func initUi(){
        setNavigationItems()
        
        //viewPager
        setUpTabs()
        setUpViewPager(delegate: self)
        
    }
    
    func setNavigationItems(){
        
        self.setNavigationItemTitle(title: "slide_shop_sub_menu_2".localized)
        
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
    }
    
}

extension MapTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let mapSubTabViewT1VC = MapSubTabViewController()
        
        mapSubTabViewT1VC.terminalType = "T1"
        mapSubTabViewT1VC.maps = Array(self.realm.objects(Map.self).filter(NSPredicate(format: "terminalID == 'P01'")))
        
        tabs.append(mapSubTabViewT1VC)
        tabTitles.append("flights_list_t1".localized)
        
        let mapSubTabViewT2VC = MapSubTabViewController()
        
        mapSubTabViewT2VC.terminalType = "T2"
        mapSubTabViewT2VC.maps = Array(self.realm.objects(Map.self).filter(NSPredicate(format: "terminalID == 'P03'")))
        
        tabs.append(mapSubTabViewT2VC)
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
