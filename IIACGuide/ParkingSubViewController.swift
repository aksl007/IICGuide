//
//  ParkingSubViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ParkingSubViewController: BaseViewController {

    var terminalType = "T1"

    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 5
    
    var currentTap = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingSubViewController.self))
        initUi()
    }

}
//UI
extension ParkingSubViewController {
    
    func initUi(){
        
        if !CommonUtils.isKorean() {
            self.numberOfTabs = 4
        }
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self,index: self.currentTap)
        
    }
    
}
extension ParkingSubViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        let parkingInfoVC = ParkingInfoViewController()
        parkingInfoVC.terminalType = self.terminalType
        tabs.append(parkingInfoVC)
        tabTitles.append("parking_category_1".localized)
        
        let parkingFeePaymentVC = ParkingFeePaymentViewController()
        parkingFeePaymentVC.terminalType = self.terminalType
        tabs.append(parkingFeePaymentVC)
        tabTitles.append("parking_category_2".localized)
        
        let valetParkingInfoVC = ValetParkingInfoViewController()
        valetParkingInfoVC.terminalType = self.terminalType
        tabs.append(valetParkingInfoVC)
        tabTitles.append("parking_category_3".localized)
        
        let myCarLocationVC = ParkingFeePaymentViewController()
        myCarLocationVC.terminalType = self.terminalType
        myCarLocationVC.isMyCarLocation = true
        tabs.append(myCarLocationVC)
        tabTitles.append("parking_category_4".localized)
        
        if CommonUtils.isKorean() {
            let carLocMapVC = CarLocMapViewController()
            carLocMapVC.terminalType = self.terminalType
            tabs.append(carLocMapVC)
            tabTitles.append("parking_category_5".localized)
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
