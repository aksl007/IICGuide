//
//  FacilitySubTabViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FacilitySubTabViewController: BaseViewController {
    
    var tabs:[UIViewController] = []
    var tabTitles:[String] = []
    var numberOfTabs = 11
    
    var paramType = "shopping"
    var terminalType = "T1"
    
    var currentTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FacilitySubTabViewController.self))
        self.initUi()
    }

}
//UI
extension FacilitySubTabViewController {
    
    func initUi(){
        if self.paramType == "food" {
            self.numberOfTabs = 8
        }else if self.paramType == "rest" {
            self.numberOfTabs = 4
        }else if self.paramType == "medical" {
            self.numberOfTabs = 2
        }else if self.paramType == "finance" {
            self.numberOfTabs = 4
        }else if self.paramType == "other" {
            self.numberOfTabs = 8
        }
        
        //viewPager
        setUpTabs()
        setUpSubViewPager(delegate : self, index: currentTap)
        
    }
    
}

extension FacilitySubTabViewController : WormTabStripDelegate{
    
    func setUpTabs(){
        
        if self.paramType == "shopping" {
            for i in 1...self.numberOfTabs {
                let FacilityListAllVC = FacilityListViewController()
                FacilityListAllVC.terminalType = self.terminalType
                FacilityListAllVC.paramType = self.paramType
                if i == 2 {
                    FacilityListAllVC.category = ["10301"]
                }else if i == 3 {
                    FacilityListAllVC.category = ["10302", "10316"]
                }else if i == 4 {
                    FacilityListAllVC.category = ["10303", "10315"]
                }else if i == 5 {
                    FacilityListAllVC.category = ["10304", "13014"]
                }else if i == 6 {
                    FacilityListAllVC.category = ["10305"]
                }else if i == 7 {
                    FacilityListAllVC.category = ["10306"]
                }else if i == 8 {
                    FacilityListAllVC.category = ["10307"]
                }else if i == 9 {
                    FacilityListAllVC.category = ["10308", "10312", "10313"]
                }else if i == 10 {
                    FacilityListAllVC.category = ["10309"]
                }else if i == 11 {
                    FacilityListAllVC.isOpen24 = true
                }
                
                tabs.append(FacilityListAllVC)
                tabTitles.append("shop_category_\(i)".localized)
            }
        }else if self.paramType == "food" {
            for i in 1...self.numberOfTabs {
                let FacilityListAllVC = FacilityListViewController()
                FacilityListAllVC.terminalType = self.terminalType
                FacilityListAllVC.paramType = self.paramType
                if i == 2 {
                    FacilityListAllVC.category = ["10201", "10203"]
                }else if i == 3 {
                    FacilityListAllVC.category = ["10202"]
                }else if i == 4 {
                    FacilityListAllVC.category = ["10208", "10209", "10210", "10212"]
                }else if i == 5 {
                    FacilityListAllVC.category = ["10204"]
                }else if i == 6 {
                    FacilityListAllVC.category = ["10205", "10211"]
                }else if i == 7 {
                    FacilityListAllVC.category = ["10206"]
                }else if i == 8 {
                    FacilityListAllVC.isOpen24 = true
                }
                
                tabs.append(FacilityListAllVC)
                tabTitles.append("food_category_\(i)".localized)
            }
        }else if self.paramType == "rest" {
            for i in 1...self.numberOfTabs {
                let FacilityListAllVC = FacilityListViewController()
                FacilityListAllVC.terminalType = self.terminalType
                FacilityListAllVC.paramType = self.paramType
                if i == 1 {
                    FacilityListAllVC.category = ["10602", "10604", "10606", "10707", "0001J"]
                }else if i == 2 {
                    FacilityListAllVC.category = ["10602"]
                }else if i == 3 {
                    FacilityListAllVC.category = ["10604", "10606"]
                }else if i == 4 {
                    FacilityListAllVC.category = ["10707", "0001J"]
                }
                tabs.append(FacilityListAllVC)
                tabTitles.append("rest_category_\(i)".localized)
            }
        }else if self.paramType == "medical" {
            for i in 1...self.numberOfTabs {
                let FacilityListAllVC = FacilityListViewController()
                FacilityListAllVC.terminalType = self.terminalType
                FacilityListAllVC.paramType = self.paramType
                if i == 1 {
                    FacilityListAllVC.category = ["10704"]
                }else if i == 2 {
                    FacilityListAllVC.category = ["10705", "0000Y"]
                }
                tabs.append(FacilityListAllVC)
                tabTitles.append("medical_category_\(i)".localized)
            }
        }else if self.paramType == "finance" {
            for i in 1...self.numberOfTabs {
                let FacilityListAllVC = FacilityListViewController()
                FacilityListAllVC.terminalType = self.terminalType
                FacilityListAllVC.paramType = self.paramType
                if i == 1 {
                    FacilityListAllVC.category = ["10709", "10710"]
                }else if i == 2 {
                    FacilityListAllVC.category = ["10401", "10403"]
                }else if i == 3 {
                    FacilityListAllVC.category = ["10402"]
                }else if i == 4 {
                    FacilityListAllVC.category = ["10404"]
                }
                tabs.append(FacilityListAllVC)
                tabTitles.append("finance_category_\(i)".localized)
            }
        }else if self.paramType == "other" {
            for i in 1...self.numberOfTabs {
                let FacilityListAllVC = FacilityListViewController()
                FacilityListAllVC.terminalType = self.terminalType
                FacilityListAllVC.paramType = self.paramType
                if i == 1 {
                    FacilityListAllVC.category = ["10501"]
                }else if i == 2 {
                    FacilityListAllVC.category = ["10701", "10702"]
                }else if i == 3 {
                    FacilityListAllVC.category = ["10605"]
                }else if i == 4 {
                    FacilityListAllVC.category = ["10601", "00006"]
                }else if i == 5 {
                    FacilityListAllVC.category = ["10603"]
                }else if i == 6 {
                    FacilityListAllVC.category = ["10703"]
                }else if i == 7 {
                    FacilityListAllVC.isOpen24 = true
                }else if i == 8 {
                    FacilityListAllVC.category = ["00011"]
                }
                tabs.append(FacilityListAllVC)
                tabTitles.append("other_category_\(i)".localized)
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
