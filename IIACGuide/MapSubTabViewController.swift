//
//  MapSubTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MapSubTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 5
    
    var terminalType = "T1"
    
    var maps = [Map]()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MapSubTabViewController.self))
        self.initUi()
    }

}
//UI
extension MapSubTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self)
        
    }
    
}

extension MapSubTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in 1...self.numberOfTabs {
            let mapVC = MapViewController()
            
            mapVC.map = self.maps[i-1]
            tabs.append(mapVC)
            
            if i == 5 && self.terminalType == "T2" {
                tabTitles.append("map_category_t2_\(i)".localized)
            }else {
                tabTitles.append("map_category_\(i)".localized)
            }
            
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
