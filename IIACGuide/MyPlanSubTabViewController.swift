//
//  MyPlanSubTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/18.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanSubTabViewController: BaseViewController {

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 14
    
    var type = "dep"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MyPlanSubTabViewController.self))
        self.initUi()
    }

}
//UI
extension MyPlanSubTabViewController {
    
    func initUi(){
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: 7)
        
    }
    
}

extension MyPlanSubTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        for i in -7 ..< 7 {
            
            let myPlanVC = MyPlanViewController()
            myPlanVC.type = self.type
            myPlanVC.date = CommonUtils.getWantedDate(format: "yyyy-MM-dd", sub: i)
            tabs.append(myPlanVC)
            tabTitles.append(CommonUtils.getWantedDate(format: "yyyy-MM-dd", sub: i))
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
