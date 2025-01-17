//
//  BaseViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices
import SideMenu
import CoreLocation
class BaseViewController: UIViewController {
    
    var locationManager : CLLocationManager!
    let minors : [CLBeaconMinorValue] = [1420, 3531, 1822, 4709, 3346, 3991, 3010, 2570, 4938, 1870, 4709]
    
    var cLRegions = [CLRegion]()
    
    lazy var realm:Realm = {
        let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 3,

        // Set the block which will be called automatically when opening a Realm with
        // a schema version lower than the one set above
        migrationBlock: { migration, oldSchemaVersion in
            // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if (oldSchemaVersion < 3) {
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
                
//                migration.enumerateObjects(ofType: Notice.className()) { (old, new) in
//                    new!["prefPopupEnable"] = false
//                }
                migration.enumerateObjects(ofType: Facility.className()) { (old, new) in
                    
                    new!["telNo"] = ""
                    new!["keyword"] = ""
                    new!["optionalImageUrl"] = ""
                    
                }
                
            }
        })
        
        Realm.Configuration.defaultConfiguration = config
        
        return try! Realm()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

               
        
        self.view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        self.navigationController?.navigationBar.shadowImage = UIColor.white.as1ptImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        let backBarButtonItem = UIBarButtonItem(title: "common_back".localized, style: .plain, target: self, action: nil)

        self.navigationItem.backBarButtonItem = backBarButtonItem
        
    }
 
}
extension BaseViewController {
    
    func moveHome(){
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func moveFlightInfo(){
        
        let flightInfoVC = FlightInfoViewController()
        self.navigationController?.pushViewController(flightInfoVC, animated: true)
    }
    @objc func moveRealTime(subCurrentTap : Int = 0){
        
        let realTimeVC = RealTimeViewController()
        realTimeVC.subCurrentTap = subCurrentTap
        self.navigationController?.pushViewController(realTimeVC, animated: true)
    }
    @objc func moveParking(terminalType : String = "T1", currentTap: Int = 0){
        
        let parkingVC = ParkingViewController()
        parkingVC.terminalType = terminalType
        parkingVC.currentTap = currentTap
        self.navigationController?.pushViewController(parkingVC, animated: true)
    }
    @objc func movePublicTransport(terminalType : String = "T1", currentTap: Int = 0){

        let publicTransportVC = PublicTransportViewController()
        publicTransportVC.terminalType = terminalType
        publicTransportVC.currentTap = currentTap
        self.navigationController?.pushViewController(publicTransportVC, animated: true)
    }
    
    @objc func openFlightInfoSearch(){
        let flightInfoSearchVC = FlightInfoSearchViewController()
        flightInfoSearchVC.date = ""
        flightInfoSearchVC.type = "dep"
        self.navigationController?.pushViewController(flightInfoSearchVC, animated: true)
    }
    @objc func openFlightInfoSearchWithParam(type: String = "dep", date: String = ""){
        let flightInfoSearchVC = FlightInfoSearchViewController()
        flightInfoSearchVC.date = date
        flightInfoSearchVC.type = type
        self.navigationController?.pushViewController(flightInfoSearchVC, animated: true)
    }
    @objc func openAirBrsBag(){
        let airBrsBagVC = AirBrsBagViewController()
        self.navigationController?.pushViewController(airBrsBagVC, animated: true)
    }
    @objc func openProhibitedItemTab(){
        if CommonUtils.isKorean() {
            let prohibitedItemTabVC = ProhibitedItemTabViewController()
            self.navigationController?.pushViewController(prohibitedItemTabVC, animated: true)
        }else{
            let prohibitedItemVC = ProhibitedItemViewController()
            self.navigationController?.pushViewController(prohibitedItemVC, animated: true)
        }
    }
    
    @objc func openShopping(paramType : String?, terminalType : String = "T1", currentTap: Int = 0){
        let facilityShoppingVC = FacilityTabViewController()
        facilityShoppingVC.paramType = paramType ?? "shopping"
        facilityShoppingVC.terminalType = terminalType
        facilityShoppingVC.currentTap = currentTap
        self.navigationController?.pushViewController(facilityShoppingVC, animated: true)
    }
    @objc func openCoupon(isDutyFree: Bool = false){
        let CouponTabVC = CouponTabViewController()
        CouponTabVC.isDutyFree = isDutyFree
        self.navigationController?.pushViewController(CouponTabVC, animated: true)
    }
    
    @objc func moveAirportDisabledWithParam(terminalType : String = "T1", currentTap: Int = 0){
        
        let AirportDisabledTabVC = AirportDisabledTabViewController()
        AirportDisabledTabVC.terminalType = terminalType
        AirportDisabledTabVC.currentTap = currentTap
        self.navigationController?.pushViewController(AirportDisabledTabVC, animated: true)
    }
    @objc func moveAirportDisabled(){
        
        let AirportDisabledTabVC = AirportDisabledTabViewController()
        self.navigationController?.pushViewController(AirportDisabledTabVC, animated: true)
    }
    
    @objc func openMapImage(){
        let mapTabVC = MapTabViewController()
        self.navigationController?.pushViewController(mapTabVC, animated: true)
    }
    
    @objc func openAllSearch(){
        
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    @objc func openAllSearchWithKeyword(keyword: String = ""){
        
        let searchVC = SearchViewController()
        searchVC.paramKeyword = keyword
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    @objc func openSetting(){
        
        let settingVC = SettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    @objc func openNotice(){
        
        let noticeVC = NoticeViewController()
        self.navigationController?.pushViewController(noticeVC, animated: true)
    }

    func openWebView(title: String, url: String){
        let webVC = BaseWebViewController()
        webVC.webViewTitle = title
        webVC.webViewUrl = url
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    func openSafari(url: String) {
        guard let url = URL(string: url) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        self.present(safariViewController, animated: true, completion: nil)
    }
    func openOneButtonPopup(title: String, contents: String, completion: (() -> Swift.Void)? = nil){
        let popupVC = PopupViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.popupTitle = title
        popupVC.popupContents = contents
        popupVC.completion = completion
        self.present(popupVC, animated: false, completion: nil)
    }
    func openTwoButtonPopup(title: String, contents: String, completion: (() -> Swift.Void)? = nil){
        let popupVC = PopupViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.popupTitle = title
        popupVC.popupContents = contents
        popupVC.completion = completion
        popupVC.isTwoButton = true
        self.present(popupVC, animated: false, completion: nil)
    }
    
    func openMenuSlide(){
        let menu = SideMenuNavigationController(rootViewController: MenuViewController())
        self.present(menu, animated: true, completion: nil)
    }
    
    func openFlightSeason(){
        let flightSeasonTabVC = FlightSeasonTabViewController()
        self.navigationController?.pushViewController(flightSeasonTabVC, animated: true)
    }
    
    func openMovingTerminal(){
        let movingTerminalTabVC = MovingTerminalTabViewController()
        self.navigationController?.pushViewController(movingTerminalTabVC, animated: true)
    }
    func openMovingTerminalWithParam(terminalType : String = "T1"){
        let movingTerminalTabVC = MovingTerminalTabViewController()
        movingTerminalTabVC.terminalType = terminalType
        self.navigationController?.pushViewController(movingTerminalTabVC, animated: true)
    }
    func openAirportTab(index : Int = 0){
        let airportTabVC = AirportTabViewController()
        airportTabVC.currentTap = index
        self.navigationController?.pushViewController(airportTabVC, animated: true)
    }
    func openAirportArriveTab(index : Int = 0){
        let AirportArriveTabVC = AirportArriveTabViewController()
        AirportArriveTabVC.currentTap = index
        self.navigationController?.pushViewController(AirportArriveTabVC, animated: true)
    }
    func openAirportTransferTab(index : Int = 0){
        let AirportTransferTabVC = AirportTransferTabViewController()
        AirportTransferTabVC.currentTap = index
        self.navigationController?.pushViewController(AirportTransferTabVC, animated: true)
    }
    
    func openTsp(){
        let tspVC = TspViewController()
        self.navigationController?.pushViewController(tspVC, animated: true)
    }
    func openShuttleBusListTab(){
        let shuttleBusListTabVC = ShuttleBusListTabViewController()
        self.navigationController?.pushViewController(shuttleBusListTabVC, animated: true)
    }
    func openStaffBusTab(){
        let staffBusTabVC = StaffBusTabViewController()
        self.navigationController?.pushViewController(staffBusTabVC, animated: true)
    }
    
}

extension BaseViewController {
    func getBarButtonDisorder() -> UIBarButtonItem{
        return UIBarButtonItem(image: UIImage(named: "icon_top_disorder"), style:.plain, target: self, action: #selector(moveAirportDisabled))
    }
    
    func getBarButtonSetting() -> UIBarButtonItem{
        return UIBarButtonItem(image: UIImage(named: "icon_top_settings"), style:.plain, target: self, action: #selector(openSetting))
    }
    
    func getBarButtonNotice() -> UIBarButtonItem{
        return UIBarButtonItem(image: UIImage(named: "icon_top_notice"), style:.plain, target: nil, action: nil)
    }
    
    func getBarButtonSearchFlight() -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "icon_top_search_flight"), style:.plain, target: self, action: #selector(openFlightInfoSearch))
    }
    
    func getBarButtonDelete() -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "myplan_passenger_del"), style:.plain, target: self, action: #selector(openFlightInfoSearch))
    }
    
    func getBarButtonAllSearch() -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "icon_home_search"), style:.plain, target: self, action: #selector(openAllSearch))
    }

    
    func setNavigationItemTitle(title : String) {
        self.navigationItem.title = title
    }
}
extension BaseViewController {
    
    func setUpViewPager(delegate : WormTabStripDelegate, currentTab : Int = 0){
        let frame =  CGRect(x: 0, y: 1, width: self.view.frame.size.width, height: self.view.frame.size.height-(self.tabBarController?.tabBar.frame.height)! - ((self.navigationController?.navigationBar.frame.height)! + CommonUtils.getTopPadding()) - 1)
        let viewPager:WormTabStrip = WormTabStrip(frame: frame)
        self.view.addSubview(viewPager)
        viewPager.delegate = delegate
        viewPager.eyStyle.wormStyel = .bubble
        viewPager.eyStyle.kHeightOfWorm = (self.navigationController?.navigationBar.frame.height)!
        viewPager.eyStyle.kHeightOfDivider = 0
        viewPager.eyStyle.kPaddingOfIndicator = 40
        viewPager.eyStyle.isWormEnable = false
        viewPager.eyStyle.spacingBetweenTabs = 0
        viewPager.eyStyle.tabItemSelectedColor = .white
        viewPager.eyStyle.topScrollViewBackgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        viewPager.eyStyle.tabItemDefaultFont = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        viewPager.eyStyle.tabItemSelectedFont = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        viewPager.eyStyle.tabItemDefaultColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.white, alphaValue: 0.25)
        viewPager.eyStyle.WormColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        
        viewPager.currentTabIndex = currentTab
        viewPager.buildUI()
        
        let divideView = UIView()
        divideView.backgroundColor = ColorUtils.UIColorFromRGBWithAlpha(rgbValue: ColorUtils.white, alphaValue: 0.25)
        viewPager.addSubview(divideView)
        divideView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.navigationHeight * 15 / 50)
            make.centerX.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
        
    }
    
    func setUpSubViewPager(delegate : WormTabStripDelegate, index: Int = 0){
        let frame =  CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        let viewPager:WormTabStrip = WormTabStrip(frame: frame)
        self.view.addSubview(viewPager)
        viewPager.delegate = delegate
        viewPager.eyStyle.wormStyel = .bubble
        viewPager.eyStyle.kHeightOfDivider = 0
        viewPager.eyStyle.isWormEnable = false
        viewPager.eyStyle.tabItemSelectedColor = .white
        viewPager.eyStyle.topScrollViewBackgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        viewPager.eyStyle.tabItemDefaultFont = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        viewPager.eyStyle.tabItemSelectedFont = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        viewPager.eyStyle.tabItemDefaultColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        viewPager.eyStyle.WormColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground)
        
        viewPager.currentTabIndex = index
        viewPager.buildUI()
    }
    
}
//beacon
extension BaseViewController {
    func startScanning() {

        self.cLRegions.removeAll()
        
        var i = 0
        for minor in self.minors {
            let uuid1 = UUID(uuidString: "A49E2F48-5396-4586-803F-E6C9140980F7")!
            let beaconRegion1 = CLBeaconRegion(proximityUUID: uuid1  , major: 1000, minor: minor, identifier: "iBeacon\(i)")
            locationManager.startMonitoring(for: beaconRegion1)
            locationManager.startRangingBeacons(in: beaconRegion1)
            
            self.cLRegions.append(beaconRegion1)
            
            i += 1
        }

    }
    func stopScanning() {
        
        for temp in self.cLRegions {
            
            locationManager.stopMonitoring(for: temp)
            locationManager.stopRangingBeacons(in: temp as! CLBeaconRegion)
        }
    }
}
