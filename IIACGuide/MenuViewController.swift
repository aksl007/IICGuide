//
//  MenuViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    var menus = [Menu]()
    
    var delegate: TabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MenuViewController.self))
        //처음에 뜨는 메뉴가 홈으로
        self.tabBarController?.selectedIndex = 1
        
        initData()
        initUi()
    }

    func initData(){
        setMenus()
    }
    
    func setMenus(){
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_home")!, title: "slide_main_menu_home".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_flight")!, title: "slide_main_menu_flight_info".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_flight")!, title: "slide_flight_sub_menu_0".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_flight_1")!, title: "slide_flight_sub_menu_1".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_shopping")!, title: "slide_main_menu_shop".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_shopping")!, title: "slide_shop_sub_menu_0".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_shopping_1")!, title: "slide_shop_sub_menu_1".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_shopping_2")!, title: "slide_shop_sub_menu_2".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_shopping_3")!, title: "slide_shop_sub_menu_3".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_rest")!, title: "slide_main_menu_convenience".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_conv")!, title: "slide_convenience_sub_menu_0".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_conv1")!, title: "slide_convenience_sub_menu_1".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_conv2")!, title: "slide_convenience_sub_menu_2".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_conv3")!, title: "slide_convenience_sub_menu_3".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_transport")!, title: "slide_main_menu_transport".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_transport")!, title: "slide_transport_sub_menu_0".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_transport1")!, title: "slide_transport_sub_menu_1".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_transport2")!, title: "slide_transport_sub_menu_2".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_navi")!, title: "slide_main_menu_navigation".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_airport")!, title: "slide_main_menu_airport_guide".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_airport")!, title: "slide_airport_guide_sub_menu_0".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_airport1")!, title: "slide_airport_guide_sub_menu_1".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_airport2")!, title: "slide_airport_guide_sub_menu_2".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_airport3")!, title: "slide_airport_guide_sub_menu_3".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_airport4")!, title: "slide_airport_guide_sub_menu_4".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_favorite")!, title: "slide_main_menu_favorite".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "left_slide_staff")!, title: "slide_main_menu_staff".localized, isSub: false, isHidden: false))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_staff")!, title: "slide_staff_sub_menu_0".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_staff1")!, title: "slide_staff_sub_menu_1".localized, isSub: true, isHidden: true))
        
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_staff2")!, title: "slide_staff_sub_menu_2".localized, isSub: true, isHidden: true))
        self.menus.append(Menu.init(icon: UIImage(named: "slide_sub_staff3")!, title: "slide_staff_sub_menu_3".localized, isSub: true, isHidden: true))
        
        
    }

    
    private let menuTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
}
//func
extension MenuViewController {
    @objc func moveSchedule(){
        self.dismiss(animated: true, completion: nil)
        self.delegate?.selectedIndex = 2
    }
    @objc func moveSetting(){
        self.openSetting()
    }
    @objc func moveNotice(){
        self.openNotice()
    }
    
}
//UI
extension MenuViewController {
    
    func initUi(){
        setNavigationItems()
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.menuTableView.backgroundColor = .white
        self.menuTableView.separatorStyle = .none
        
        self.menuTableView.register(MenuHeaderTableViewCell.self, forCellReuseIdentifier: "MenuHeaderTableViewCell")
        self.menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        self.view.addSubview(self.menuTableView)
        
        self.menuTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setNavigationItems(){
        self.setNavigationItemTitle(title: "home_bottom_menu_1".localized)


//        navigationItem.leftBarButtonItem = getBarButtonNotice()
//        navigationItem.rightBarButtonItem = getBarButtonSetting()
    }
}
extension MenuViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        }else {
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    
        if indexPath.row - 1 == 0 {
            //홈
            self.dismiss(animated: true, completion: nil)
            
            self.delegate?.selectedIndex = 1
            (self.delegate?.viewControllers?[1] as! UINavigationController).popToRootViewController(animated: false)
        }
        
        if indexPath.row - 1 == 1 {
            //항공편
            if self.menus[2].isHidden == false {

                self.menus[2].isHidden = true
                self.menus[3].isHidden = true
            }else{
                for menu in self.menus {
                    if menu.isSub {
                        menu.isHidden = true
                    }
                }
                self.menus[2].isHidden = false
                self.menus[3].isHidden = false
            }
            self.menuTableView.reloadData()
            
        }
        
        if indexPath.row - 1 == 2 {
            //출도착정보
            self.moveFlightInfo()
        }
        if indexPath.row - 1 == 3 {
            //시즌스케쥴
            self.openFlightSeason()
        }

        if indexPath.row - 1 == 4 {
            //쇼핑&식당
            if self.menus[5].isHidden == false {

                self.menus[5].isHidden = true
                self.menus[6].isHidden = true
                self.menus[7].isHidden = true
                self.menus[8].isHidden = true
            }else{
                for menu in self.menus {
                    if menu.isSub {
                        menu.isHidden = true
                    }
                }
                self.menus[5].isHidden = false
                self.menus[6].isHidden = false
                self.menus[7].isHidden = false
                self.menus[8].isHidden = false
            }
            self.menuTableView.reloadData()
        }
        
        if indexPath.row - 1 == 5 {
            //쇼핑
            self.openShopping(paramType: "shopping")
        }
        if indexPath.row - 1 == 6 {
            //식음료
            self.openShopping(paramType: "food")
        }
        if indexPath.row - 1 == 7 {
            //면세/식음료 매장 MAP
            self.openMapImage()
        }
        
        if indexPath.row - 1 == 8 {
            //쿠폰
            self.openCoupon()
        }

        if indexPath.row - 1 == 9 {
            //편의 서비스
            if self.menus[10].isHidden == false {

                self.menus[10].isHidden = true
                self.menus[11].isHidden = true
                self.menus[12].isHidden = true
                self.menus[13].isHidden = true
            }else{
                for menu in self.menus {
                    if menu.isSub {
                        menu.isHidden = true
                    }
                }
                self.menus[10].isHidden = false
                self.menus[11].isHidden = false
                self.menus[12].isHidden = false
                self.menus[13].isHidden = false
            }
            self.menuTableView.reloadData()
        }
        
        if indexPath.row - 1 == 10 {
            //휴식
            self.openShopping(paramType: "rest")
        }
        if indexPath.row - 1 == 11 {
            //의료/건강
            self.openShopping(paramType: "medical")
        }
        if indexPath.row - 1 == 12 {
            //금융/보험
            self.openShopping(paramType: "finance")
        }
        if indexPath.row - 1 == 13 {
            //기타 편의시설
            self.openShopping(paramType: "other")
        }
        
        if indexPath.row - 1 == 14 {
            //교통&주차
            if self.menus[15].isHidden == false {

                self.menus[15].isHidden = true
                self.menus[16].isHidden = true
                self.menus[17].isHidden = true
            }else{
                for menu in self.menus {
                    if menu.isSub {
                        menu.isHidden = true
                    }
                }
                self.menus[15].isHidden = false
                self.menus[16].isHidden = false
                self.menus[17].isHidden = false
            }
            self.menuTableView.reloadData()
        }
        
        if indexPath.row - 1 == 15 {
            //대중교통
            self.movePublicTransport()
        }
        if indexPath.row - 1 == 16 {
            //주차
            self.moveParking()
        }
        if indexPath.row - 1 == 17 {
            //터미널간 이동
            self.openMovingTerminal()
        }
        
        if indexPath.row - 1 == 19 {
            //교통&주차
            if self.menus[20].isHidden == false {

                self.menus[20].isHidden = true
                self.menus[21].isHidden = true
                self.menus[22].isHidden = true
                self.menus[23].isHidden = true
                self.menus[24].isHidden = true
            }else{
                for menu in self.menus {
                    if menu.isSub {
                        menu.isHidden = true
                    }
                }
                self.menus[20].isHidden = false
                self.menus[21].isHidden = false
                self.menus[22].isHidden = false
                self.menus[23].isHidden = false
                self.menus[24].isHidden = false
            }
            self.menuTableView.reloadData()
        }
        
        if indexPath.row - 1 == 20 {
            //출국
            self.openAirportTab()
        }
        if indexPath.row - 1 == 21 {
            //입국
            self.openAirportArriveTab()
        }
        if indexPath.row - 1 == 22 {
            //환승
            self.openAirportTransferTab()
        }
        
        if indexPath.row - 1 == 23 {
            //출입국기관
            self.openShopping(paramType: "immigration")
        }
        if indexPath.row - 1 == 24 {
            //교통약자
            self.moveAirportDisabled()
        }
        if indexPath.row - 1 == 25 {
            //즐겨찾기
            self.dismiss(animated: true, completion: nil)
            self.delegate?.selectedIndex = 3
        }
        if indexPath.row - 1 == 26 {
            //STAFF
            if self.menus[27].isHidden == false {

                self.menus[27].isHidden = true
                self.menus[28].isHidden = true
                self.menus[29].isHidden = true
                self.menus[30].isHidden = true
            }else{
                for menu in self.menus {
                    if menu.isSub {
                        menu.isHidden = true
                    }
                }
                self.menus[27].isHidden = false
                self.menus[28].isHidden = false
                self.menus[29].isHidden = false
                self.menus[30].isHidden = false
            }
            self.menuTableView.reloadData()
        }
        if indexPath.row - 1 == 28 {
            //셔틀스케줄
            self.openShuttleBusListTab()
        }
        if indexPath.row - 1 == 29 {
            //셔틀스케줄
            self.openStaffBusTab()
        }
        
        if indexPath.row - 1 == 30 {
            //입주자서비스센터
            self.openTsp()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CommonUtils.isKorean(){
            return menus.count + 1
        }else{
            return menus.count + 1 - 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuHeaderTableViewCell")! as! MenuHeaderTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.delegate = self
            cell.contentView.isUserInteractionEnabled = false
            cell.slide_main_menu_my_plan_view.isUserInteractionEnabled = true
            cell.slide_main_menu_my_plan_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveSchedule)))
            cell.slide_main_menu_setting_view.isUserInteractionEnabled = true
            cell.slide_main_menu_setting_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveSetting)))
            cell.slide_main_menu_notice_view.isUserInteractionEnabled = true
            cell.slide_main_menu_notice_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveNotice)))
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell")! as! MenuTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.isHidden = menus[indexPath.row - 1].isHidden
            cell.row = indexPath.row - 1
            cell.menu = menus[indexPath.row - 1]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 120
        } else {
            if menus[indexPath.row - 1].isHidden {
                return 0
            }else{
                return 50
            }
            
        }
    }

}
