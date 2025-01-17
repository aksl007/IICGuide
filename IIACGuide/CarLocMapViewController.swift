//
//  CarLocMapViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import CoreLocation
class CarLocMapViewController: BaseViewController, CLLocationManagerDelegate {
    
    var terminalType = "T1"

    var carLocations = [CarLocation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: CarLocMapViewController.self))
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.delegate = self as CLLocationManagerDelegate
//        // 사용할때만 위치정보를 사용한다는 팝업이 발생
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
        
        

        self.initUi()
        
        
        
//        self.carLocations.append(CarLocation(date: "2020.09.08. 11:23:30", lat: 141.286, lng: 45.169))
//        self.carLocations.append(CarLocation(date: "2020.09.08. 11:23:50", lat: 141.286, lng: 45.169))
        
        //TODO naver map
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.refreshList()
        
    }
    
    func refreshList(){
        self.carLocations = Array(self.realm.objects(CarLocation.self))
        self.carLocMapView.reloadData()
    }
    
    private let carLocMapView: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()

}
extension CarLocMapViewController {
    func initUi(){
        self.carLocMapView.delegate = self
        self.carLocMapView.dataSource = self
        self.carLocMapView.separatorStyle = .none
        self.carLocMapView.register(CarLocMapTableViewCell.self, forCellReuseIdentifier: "CarLocMapTableViewCell")
        self.carLocMapView.register(CarLocMapFooterTableViewCell.self, forCellReuseIdentifier: "CarLocMapFooterTableViewCell")
        
        self.view.addSubview(self.carLocMapView)
        self.carLocMapView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 6) - 5)
            
        }
    }
}
extension CarLocMapViewController {
    @objc func openMap(){
    
        if self.carLocations.count > 5 {
            self.openOneButtonPopup(title: "parking_category_5".localized, contents: "register_car_loc_sub_title_3".localized)
        }else{
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways {
                let naverMapVC = NaverMapViewController()
                self.navigationController?.pushViewController(naverMapVC, animated: true)
                
            }else{
                setAuthAlert(title: "Location Permission", message: "Used to get current position")
            }
            
        }

    }
    
    @objc func deleteLocation(_ sender:UITapGestureRecognizer){
        let i: Int = sender.view?.tag ?? 0
        try! self.realm.write {
            self.realm.delete(self.realm.objects(CarLocation.self).filter(NSPredicate(format: "date == '\(self.carLocations[i].date ?? "")'")))
        }
        self.refreshList()
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
extension CarLocMapViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        
        if self.carLocations.count == indexPath.row {
            
        }else{
            if self.carLocations.count > 5 {
                self.openOneButtonPopup(title: "parking_category_5".localized, contents: "register_car_loc_sub_title_3".localized)
            }else{
                if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways {
                    let naverMapVC = NaverMapViewController()
                    naverMapVC.row = indexPath.row
                    self.navigationController?.pushViewController(naverMapVC, animated: true)
                    
                }else {
                    setAuthAlert(title: "Location Permission", message: "Used to get current position")
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carLocations.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.carLocations.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarLocMapFooterTableViewCell")! as! CarLocMapFooterTableViewCell

            cell.contentView.isUserInteractionEnabled = false
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if self.carLocations.count == 0 {
                cell.isExistList = false
            }else {
                cell.isExistList = true
            }
            
            cell.parking_category_5.addTarget(self, action: #selector(openMap), for: .touchUpInside)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarLocMapTableViewCell")! as! CarLocMapTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.row = indexPath.row
            cell.carLocation = self.carLocations[indexPath.row]
            
            cell.icon_schedule_delete.isUserInteractionEnabled = true
            cell.icon_schedule_delete.tag = indexPath.row
            cell.icon_schedule_delete.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deleteLocation(_:))))
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == self.carLocations.count {
            return 200
        }else {
            return SizeUtils.tableBigHeight
        }
    }

}
