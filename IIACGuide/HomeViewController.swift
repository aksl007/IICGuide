//
//  ViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/20.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import SnapKit
import InstantSearchVoiceOverlay
import Speech
import AVFoundation
import CoreLocation
import Alamofire
import SwiftyJSON

class HomeViewController: BaseViewController {
    
    //Scroll hidden view
    var lastContentOffset: CGFloat = 0
    
    var firstMenus = [HomeMenu]()
    var secondMenus = [HomeMenu]()
    
    var beaconMyPlan : BeaconMyPlan?
    
    lazy var voiceOverlayController: VoiceOverlayController = {
      let recordableHandler = {
        return SpeechController(locale: Locale(identifier: CommonUtils.getLocaleReturnLang()))
      }
      return VoiceOverlayController(speechControllerHandler: recordableHandler)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: HomeViewController.self))
        
        initData()
        
        initUi()
        
        self.initPermission()
        
        
        self.openNoticePopup()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveTestNotification(_:)), name: NSNotification.Name("beaconNotification"),object: nil)
        
        //test
//        let testVC = BeaconBasePopupViewController()
//        testVC.modalPresentationStyle = .overFullScreen
//        testVC.modalTransitionStyle = .crossDissolve
//        self.present(testVC, animated: false, completion: nil)
        
        
//        self.navigationController?.pushViewController(testVC, animated: true)
     

    }
    
    func initPermission(){
        
        if UserDefaultsUtils.getFirstInstall() {
            let popupVC = PopupPermissionViewController()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.modalTransitionStyle = .crossDissolve
            popupVC.delegate = self
            
            UserDefaultsUtils.setFirstInstall(false)
            
            self.present(popupVC, animated: false, completion: nil)
        }
        
        
        AVAudioSession.sharedInstance().requestRecordPermission({ (isGranted) in
            
        })
        SFSpeechRecognizer.requestAuthorization { (SFSpeechRecognizerAuthorizationStatus) in
            
        }
        AVCaptureDevice.requestAccess(for: .video) { (Bool) in
            
        }
        
        if UserDefaultsUtils.isBeacon() {
            locationManager = CLLocationManager.init()              // locationManager 초기화.
            locationManager.delegate = self                         // 델리게이트 넣어줌.
            locationManager.requestAlwaysAuthorization()            // 위치 권한 받아옴.
            locationManager.startUpdatingLocation()                 // 위치 업데이트 시작
            locationManager.allowsBackgroundLocationUpdates = true  // 백그라운드에서도 위치를 체크할 것인지에 대한 여부. 필요없으면 false로 처리하자.
            locationManager.pausesLocationUpdatesAutomatically = false  // 이걸 써줘야 백그라운드에서 멈추지 않고 돈다
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearNavigationBackground()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        resetNavigationBackground()
    }
    
    func initData(){
        
        setFirstMenus()
        setSecondMenus()
        
    }
    
    func setFirstMenus(){
        self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_3_parking_info")!, title: "home_drag_menu_3".localized))
        if CommonUtils.isKorean() {
            self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_4_parking_book")!, title: "home_drag_menu_4".localized))
        }else{
            self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "main_menu_transfer")!, title: "home_drag_menu_4".localized))
        }
        
        self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_5_public_transport")!, title: "home_drag_menu_5".localized))
        self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_6_baggage_check")!, title: "home_drag_menu_6".localized))
        self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_7_restricted_goods")!, title: "home_drag_menu_7".localized))
        self.firstMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_8_welcome")!, title: "home_drag_menu_8".localized))
    }
    
    func setSecondMenus(){
        self.secondMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_9_duty_free")!, title: "home_drag_menu_9".localized))
        self.secondMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_10_restaurant_info")!, title: "home_drag_menu_10".localized))
        self.secondMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_11_rest")!, title: "home_drag_menu_11".localized))
        self.secondMenus.append(HomeMenu.init(icon: UIImage(named: "icon_home_12_ticket")!, title: "home_drag_menu_12".localized))
    }
    
    func openNoticePopup(){
        let popupVC = PopupNoticeViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.delegate = self
        let notices = Array(self.realm.objects(Notice.self))
        
        let noticeUsids = UserDefaultsUtils.getNoticePopupUsid()
        var tempNotices = [Notice]()
        for notice in notices {
            if notice.popupEnabled && !noticeUsids.contains(String(notice.usid ?? "")) {
                tempNotices.append(notice)
            }
        }
        
        popupVC.notices = tempNotices
        
        if tempNotices.count != 0 {
            self.present(popupVC, animated: false, completion: nil)
        }
    }
    
    private let navigationBackgroundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_home_navigation")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let firstMenuView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.masksToBounds = false
        view.layer.cornerRadius = SizeUtils.radius
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 5
        
        return view
    }()
    
    private let secondMenuView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.masksToBounds = false
        view.layer.cornerRadius = SizeUtils.radius
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 5
        
        return view
    }()
    
    private let cicleInfoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_common_info")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let secondMenuLabel : UILabel = {
        let label = UILabel()
        label.text = "home_drag_title_1".localized
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.sizeToFit()
        return label
    }()
    
    private let firstCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.sizeToFit()
        
        return collectionView
    }()
    
    private let secondCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.sizeToFit()
        
        return collectionView
    }()
    
    private let cicleFlightImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_home_cicle_flight")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let cicleAirportInfoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_home_cicle_airport_info")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let cicleFlightLabel : UILabel = {
        let label = UILabel()
        label.text = "home_drag_menu_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let cicleAirportInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "home_drag_menu_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let searchView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = false
        
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let searchButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_home_search"), for: .normal)
        button.clipsToBounds = true
        
        return button
    }()
    
    private let voiceButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_home_voice"), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    
    private let chat_bot_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat_bot_1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
}

//Button Event
extension HomeViewController {
    
    @objc func moveSearch(){
        self.openAllSearch()
    }
    
    @objc func openAirChatBot(){
        self.openSafari(url: ServerUtils.URL_AIR_CHAT_BOT)
    }
    @objc func moveRealTimeInfo(){
        self.moveRealTime()
    }
    
    
    @objc func didReceiveTestNotification(_ notification: Notification) {
        guard let isBeacon: Bool = notification.userInfo?["isBeacon"] as? Bool else { return }
        
        if isBeacon {
            locationManager = CLLocationManager.init()              // locationManager 초기화.
            locationManager.delegate = self                         // 델리게이트 넣어줌.
            locationManager.requestAlwaysAuthorization()            // 위치 권한 받아옴.
            locationManager.startUpdatingLocation()                 // 위치 업데이트 시작
            locationManager.allowsBackgroundLocationUpdates = true  // 백그라운드에서도 위치를 체크할 것인지에 대한 여부. 필요없으면 false로 처리하자.
            locationManager.pausesLocationUpdatesAutomatically = false  // 이걸 써줘야 백그라운드에서 멈추지 않고 돈다
        }else{
            self.stopScanning()
        }
    }

    
}

//UI
extension HomeViewController {
    
    func initUi(){
        
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        
        setNavigationItems()
        
        view.addSubview(self.navigationBackgroundImageView)
        self.navigationBackgroundImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.width * 400 / 480)
        }
        
        view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset((self.navigationController?.navigationBar.frame.height)! + CommonUtils.getTopPadding())
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(self.tabBarController?.tabBar.frame.height)!)
        }
        self.scrollView.delegate = self
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.firstMenuView)
        self.firstMenuView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(view.frame.width * 310 / 480)
            make.top.equalToSuperview().offset((view.frame.width * 375 / 480) - ((self.navigationController?.navigationBar.frame.height)! + CommonUtils.getTopPadding()))
        }
        
        self.contentsView.addSubview(self.secondMenuView)
        self.secondMenuView.snp.makeConstraints{ (make) in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(view.frame.width * 155 / 480)
            make.top.equalTo(self.firstMenuView.snp.bottom).offset(view.frame.width * 65 / 480)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-view.frame.width * 20 / 480)
        }
        self.contentsView.addSubview(self.cicleInfoImageView)
        self.cicleInfoImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(view.frame.width * 25 / 480)
            make.bottom.equalTo(self.secondMenuView.snp.top).offset(-view.frame.width * 10 / 480)
            make.leading.equalTo(self.secondMenuView.snp.leading).offset(view.frame.width * 10 / 480)
        }
        self.contentsView.addSubview(self.secondMenuLabel)
        self.secondMenuLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.cicleInfoImageView.snp.centerY)
            make.leading.equalTo(self.cicleInfoImageView.snp.trailing).offset(view.frame.width * 10 / 480)
        }
        
        self.firstCollectionView.delegate = self
        self.firstCollectionView.dataSource = self
        self.firstCollectionView.backgroundColor = .white
        self.firstCollectionView.isScrollEnabled = false
        self.firstCollectionView.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: "HomeMenuCollectionViewCell")
        self.firstMenuView.addSubview(self.firstCollectionView)
        self.firstCollectionView.snp.makeConstraints { (make) in
            make.bottom.trailing.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo((view.frame.width * 64 / 480) * 3)
        }
        
        self.secondCollectionView.delegate = self
        self.secondCollectionView.dataSource = self
        self.secondCollectionView.backgroundColor = .white
        self.secondCollectionView.isScrollEnabled = false
        self.secondCollectionView.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: "HomeMenuCollectionViewCell")
        self.secondMenuView.addSubview(self.secondCollectionView)
        self.secondCollectionView.snp.makeConstraints { (make) in
            make.bottom.trailing.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo((view.frame.width * 64 / 480) * 2)
        }
        
        self.cicleFlightImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveFlightInfo)))
        self.cicleFlightImageView.isUserInteractionEnabled = true
        let menuViewWidth = (view.frame.width / 2) - 30 - 10
        self.firstMenuView.addSubview(self.cicleFlightImageView)
        self.cicleFlightImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(view.frame.width * 110/480)
            make.centerY.equalTo(self.firstMenuView.snp.top)
            make.centerX.equalToSuperview().offset(-(menuViewWidth / 2))
        }
        self.cicleAirportInfoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveRealTimeInfo)))
        self.cicleAirportInfoImageView.isUserInteractionEnabled = true
        self.firstMenuView.addSubview(self.cicleAirportInfoImageView)
        self.cicleAirportInfoImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(view.frame.width * 110/480)
            make.centerY.equalTo(self.firstMenuView.snp.top)
            make.centerX.equalToSuperview().offset((menuViewWidth / 2))
        }
        
        
        self.cicleFlightLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveFlightInfo)))
        self.cicleFlightLabel.isUserInteractionEnabled = true
        self.firstMenuView.addSubview(self.cicleFlightLabel)
        self.cicleFlightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.cicleFlightImageView.snp.bottom).offset(4)
            make.centerX.equalTo(self.cicleFlightImageView)
        }
        self.cicleAirportInfoLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveRealTimeInfo)))
        self.cicleAirportInfoLabel.isUserInteractionEnabled = true
        self.firstMenuView.addSubview(self.cicleAirportInfoLabel)
        self.cicleAirportInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.cicleAirportInfoImageView.snp.bottom).offset(4)
            make.centerX.equalTo(self.cicleAirportInfoImageView)
        }
        
        self.searchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveSearch)))
        self.contentsView.addSubview(self.searchView)
        self.searchView.snp.makeConstraints { (make) in
            make.bottom.equalTo(cicleAirportInfoImageView.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        self.searchButton.addTarget(self, action: #selector(moveSearch), for: .touchUpInside)
        self.searchView.addSubview(self.searchButton)
        self.searchButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.width.height.equalTo(SizeUtils.navigationIconSize)
        }
        
        self.voiceButton.addTarget(self, action: #selector(searchWithVoice), for: .touchUpInside)
        self.searchView.addSubview(self.voiceButton)
        self.voiceButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.width.height.equalTo(SizeUtils.navigationIconSize)
        }
        
        self.chat_bot_1.isUserInteractionEnabled = true
        self.chat_bot_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openAirChatBot)))
        self.view.addSubview(self.chat_bot_1)
        self.chat_bot_1.snp.makeConstraints { (make) in
            if CommonUtils.isKorean() {
                make.size.equalTo(self.view.frame.width/5)
            }else{
                make.size.equalTo(0)
            }
            
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(self.tabBarController?.tabBar.frame.height)! - SizeUtils.sideMargin)
        }
    }
    
    func clearNavigationBackground(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    func resetNavigationBackground(){
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
    }
    func setNavigationItems(){
        let logo = UIImage(named: "ci")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationItem.leftBarButtonItem = getBarButtonDisorder()
        self.navigationItem.rightBarButtonItem = getBarButtonSetting()
        
    }
    
}
extension HomeViewController{
    
    @objc func searchWithVoice(){
        
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSession.RecordPermission.granted:
            // If audio/record permission is granted, we need to check for the speech permission next
            break
        case AVAudioSession.RecordPermission.denied:
            self.setAuthAlert(title: "Audio Permission", message: "Used to voice search")
            return
        case AVAudioSession.RecordPermission.undetermined:
            self.setAuthAlert(title: "Audio Permission", message: "Used to voice search")
            return
        @unknown default:
            break
        }
        
        // speech permissions
        switch SFSpeechRecognizer.authorizationStatus() {
        case .authorized:
            break
        case .denied, .restricted:
            self.setAuthAlert(title: "Speech Permission", message: "Used to voice search")
            return
        case .notDetermined:
            self.setAuthAlert(title: "Speech Permission", message: "Used to voice search")
            return
        @unknown default:
            break
        }
        
        voiceOverlayController.settings.autoStopTimeout = 1
        voiceOverlayController.start(on: self.tabBarController!, textHandler: { (text, final, any) in
            print("voice output: \(String(describing: text))")
            print("voice output: is it final? \(String(describing: final))")
            
            if final {
                self.openAllSearchWithKeyword(keyword: text)
                
            }
        }, errorHandler: { (error) in
            print("voice output: error \(String(describing: error))")
        })
        
    }
    
    func setAuthAlert(title: String, message: String){
        let authAlertController: UIAlertController
        authAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let getAuthAction: UIAlertAction
        getAuthAction = UIAlertAction(title: "common_setting".localized, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            if let appSettings = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        })
        authAlertController.addAction(getAuthAction)
        self.present(authAlertController, animated: true, completion: nil)
    }
}
extension HomeViewController : UIScrollViewDelegate{
    
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.lastContentOffset < scrollView.contentOffset.y {
            let temp = (self.view.frame.width * 400 / 480) - (scrollView.contentOffset.y * 2)
            if( temp > 0){
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.1) {
                    self.navigationBackgroundImageView.snp.updateConstraints { (make) in
                        make.height.equalTo((self.view.frame.width * 400 / 480) - (scrollView.contentOffset.y * 2))
                    }
                    self.view.layoutIfNeeded()
                }
            }
            
        }else{
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.1) {
                self.navigationBackgroundImageView.snp.updateConstraints { (make) in
                    make.height.equalTo((self.view.frame.width * 400 / 480) - scrollView.contentOffset.y)
                }
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            if indexPath.row == 0 {
                self.moveParking()
            }
            if indexPath.row == 1 {
                if CommonUtils.isKorean() {
                    self.openWebView(title: "home_drag_menu_4".localized, url: ServerUtils.URL_PARKING_RESERVE)
                }else{
                    self.openAirportTransferTab()
                }
                
            }
            if indexPath.row == 2 {
                self.movePublicTransport()
            }
            if indexPath.row == 3 {
                self.openAirBrsBag()
            }
            if indexPath.row == 4 {
                self.openProhibitedItemTab()
            }
            
            
        } else {
            
            if indexPath.row == 0 {
                self.openShopping(paramType: "shopping")
            }
            if indexPath.row == 1 {
                self.openShopping(paramType: "food")
            }
            if indexPath.row == 2 {
                self.openShopping(paramType: "rest")
            }
            if indexPath.row == 3 {
                self.openCoupon()
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 30 - 10 , height: view.frame.width * 65 / 480)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return firstMenus.count
        } else {
            return secondMenus.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMenuCollectionViewCell", for: indexPath) as! HomeMenuCollectionViewCell
            
            cell.homeMenu = firstMenus[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMenuCollectionViewCell", for: indexPath) as! HomeMenuCollectionViewCell
            
            cell.homeMenu = secondMenus[indexPath.row]
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension HomeViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    
//                    if UserDefaultsUtils.isBeacon() {
                        self.startScanning()
//                    }else{
//                        stopScanning()
//                    }
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {

        print("===========================================")
        if beacons.count > 0 {
//            updateDistance(beacons[0].proximity)
            let beacon = beacons[0]
            
            print("\(beacon.proximityUUID) // major :\(beacon.major) // minor : \(beacon.minor)" )

            if UserDefaultsUtils.isBeacon() && "\(beacon.proximityUUID)".uppercased() == "A49E2F48-5396-4586-803F-E6C9140980F7" {
                
                let tempMinor = "\(CommonUtils.getTodayDate(format: "yyyyMMdd"))_\(beacon.minor)"
                
                if Array(self.realm.objects(BeaconRealm.self).filter(NSPredicate(format: "todayAndMinor == '\(tempMinor)'"))).count > 0 {
                    
                    
                }else{
                    try! self.realm.write {
                        self.realm.add(BeaconRealm(todayAndMinor: tempMinor))
                    }
                    self.setBeaconPlan(beaconuuid: "\(beacon.proximityUUID)".uppercased(), beaconmajor: "\(beacon.major)", beaconminor: "\(beacon.minor)")
                }
                
            }

        } else {
//            updateDistance(.unknown)
        }
    }
}
extension HomeViewController {

    func setBeaconPlan(beaconuuid: String, beaconmajor: String, beaconminor: String){
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "setBeaconPlan")
        
        let apiUrl = ServerUtils.serverBeaconUrl + ServerUtils.setBeaconPlan
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters: [
                "beaconuuid": beaconuuid,
                "beaconmajor": beaconmajor,
                "beaconminor" : beaconminor
            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey, "deviceId": UserDefaultsUtils.getDeviceId(), "lang": CommonUtils.getLocaleId()]
        )
        .validate(statusCode: 200..<400)
        .responseJSON {response in
            switch response.result{
            case .success(let obj):
                let json = JSON(obj)
                print(json)
                let code = json["code"]
                if code == 200 {
                    do {
                        let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        let result = try? JSONDecoder().decode(BaseResult<BeaconMyPlan>.self, from: dataJson)

                        self.beaconMyPlan = result?.data
                        
                        
                        var date = ""
                        var fimsid = self.beaconMyPlan?.fimsid
                        var terminalId = self.beaconMyPlan?.beacon?.terminalid
                        var zoneCd = self.beaconMyPlan?.beacon?.zonecd
                        if terminalId == "P04" {
                            terminalId = "P01"
                        }else if terminalId == "P05" {
                            terminalId = "P02"
                        }
                        
                        var msg1 = ""
                        var msg2 = ""
                        
                        if self.beaconMyPlan?.beacon?.msgko1 != nil && self.beaconMyPlan?.beacon?.msgko1 != "" {
                            msg1 = "\(self.beaconMyPlan?.beacon?.msgko1 ?? "")"
                            msg2 = "\(self.beaconMyPlan?.beacon?.msgko2 ?? "")"
                        }else if self.beaconMyPlan?.beacon?.msgen1 != nil && self.beaconMyPlan?.beacon?.msgen1 != "" {
                            
                            msg1 = "\(self.beaconMyPlan?.beacon?.msgen1 ?? "")"
                            msg2 = "\(self.beaconMyPlan?.beacon?.msgen2 ?? "")"
                            
                        }else if self.beaconMyPlan?.beacon?.msgzh1 != nil && self.beaconMyPlan?.beacon?.msgzh1 != "" {
                            msg1 = "\(self.beaconMyPlan?.beacon?.msgzh1 ?? "")"
                            msg2 = "\(self.beaconMyPlan?.beacon?.msgzh2 ?? "")"
                        }else if self.beaconMyPlan?.beacon?.msgja1 != nil && self.beaconMyPlan?.beacon?.msgja1 != "" {
                            msg1 = "\(self.beaconMyPlan?.beacon?.msgja1 ?? "")"
                            msg2 = "\(self.beaconMyPlan?.beacon?.msgja2 ?? "")"
                        }
                        
                        let content = UNMutableNotificationContent()
                        content.title = "\(self.beaconMyPlan?.beacon?.msgname ?? "")"
                        content.body = "\(msg1)\n\(msg2)"
                        let userInfo: [AnyHashable: Any] = [
                            "zoneCd": "\(self.beaconMyPlan?.beacon?.zonecd ?? "")",
                            "terminalId": "\(terminalId ?? "")",
                            "fimsid": "\(fimsid ?? "")",
                            "flightPid": "\(self.beaconMyPlan?.suffixedFlightPid ?? "")",
                            "checkin": "\(self.beaconMyPlan?.counterNoRange ?? "")",
                            "gate": "\(self.beaconMyPlan?.gateNo ?? "")",
                            "carousel": "\(self.beaconMyPlan?.carouselNo ?? "")",
                            "schd": "\(self.beaconMyPlan?.schddt ?? "")",
                            "schddttm": "\(self.beaconMyPlan?.schddttm ?? "")",
                            "estimate": "\(self.beaconMyPlan?.estimateDateTime ?? "")",
                            "zzzFlightPid": "\(self.beaconMyPlan?.beacon?.suffixedFlightPid ?? "")"
                        ]
                        
                        content.userInfo = userInfo
                        content.sound = .default
                        
                        let request = UNNotificationRequest(identifier: "ForgetMeNot", content: content, trigger: nil)
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    
                    
                } else {
                    
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
