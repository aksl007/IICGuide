//
//  CouponTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class CouponTabViewController: BaseViewController {

    var isDutyFree = false
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: CouponTabViewController.self))
        self.initUi()
    }
 
}
//UI
extension CouponTabViewController {
    
    func initUi(){
        
        self.setNavigationItemTitle(title: "home_drag_menu_12".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
        
        //viewPager
        setUpTabs()
        if isDutyFree {
            setUpSubViewPager(delegate : self, index: 1)
        }else{
            setUpSubViewPager(delegate : self)
        }
        
    }
    
}

extension CouponTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let coupon1ListVC = CouponListViewController()
        coupon1ListVC.campaignType = "General"
        tabs.append(coupon1ListVC)
        tabTitles.append("coupon_category_1".localized)

        let coupon2ListVC = CouponListViewController()
        coupon2ListVC.campaignType = "DutyFree"
        tabs.append(coupon2ListVC)
        tabTitles.append("coupon_category_2".localized)
        
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
