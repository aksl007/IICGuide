//
//  TabBarController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/21.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import SideMenu

class TabBarController: UITabBarController {
    
    var isSeletedMenuTab = false
    var isSeletedHomeTab = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: TabBarController.self))
        setupTabBar()
        
    }
    
    func setupTabBar() {
        //tabbar text color
        tabBar.tintColor = .black
        //tabbar background color
        tabBar.barTintColor = .white
        //tabbar shadow color X
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        tabBar.clipsToBounds = true
        
        self.delegate = self
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.title = "home_bottom_menu_2".localized
        homeViewController.tabBarItem.image = UIImage(named: "icon_tab_bar_home")?.withRenderingMode(.alwaysOriginal)
        
        let myPlanTabViewController = UINavigationController(rootViewController: MyPlanTabViewController())
        myPlanTabViewController.tabBarItem.title = "home_bottom_menu_3".localized
        myPlanTabViewController.tabBarItem.image = UIImage(named: "icon_tab_bar_schedule")?.withRenderingMode(.alwaysOriginal)
        
        let favoritesViewController = UINavigationController(rootViewController: FavoriteTabViewController())
        favoritesViewController.tabBarItem.title = "home_bottom_menu_4".localized
        favoritesViewController.tabBarItem.image = UIImage(named: "icon_tab_bar_favorites")?.withRenderingMode(.alwaysOriginal)
        
        let menuViewController = UINavigationController(rootViewController: MenuViewController())
        menuViewController.tabBarItem.title = "home_bottom_menu_1".localized
        menuViewController.tabBarItem.image = UIImage(named: "icon_tab_bar_menu")?.withRenderingMode(.alwaysOriginal)
        
        
        viewControllers = [menuViewController, homeViewController, myPlanTabViewController, favoritesViewController]
    }
    
    func moveTab(index: Int){
        self.tabBarController?.selectedIndex = index
    }
}
extension TabBarController : UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "home_bottom_menu_1".localized {
            self.isSeletedMenuTab = true
            self.isSeletedHomeTab = false
        }else if item.title == "home_bottom_menu_2".localized {
            self.isSeletedHomeTab = true
            self.isSeletedMenuTab = false
        }else{
            self.isSeletedMenuTab = false
            self.isSeletedHomeTab = false
        }
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if self.isSeletedMenuTab {
            self.isSeletedMenuTab = false
            let menuVC = MenuViewController()
            menuVC.delegate = self
            let menu = SideMenuNavigationController(rootViewController: menuVC)
            menu.leftSide = true
            menu.menuWidth = self.view.frame.width * 0.75
            self.present(menu, animated: true, completion: nil)
            return false
        }else if self.isSeletedHomeTab {
            
            let navi = viewController as! UINavigationController
            navi.popToRootViewController(animated: false)
            
            self.isSeletedHomeTab = false
            return true
        }else{
            return true
        }
    }
}
