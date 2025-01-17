//
//  NaverMapViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/10/07.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import NMapsMap
import CoreLocation
class NaverMapViewController: BaseViewController{

    var authState: NMFAuthState!
    
    let locationManagerLocation = CLLocationManager()
    
    var nmapFView = NMFMapView()
    var marker = NMFMarker()
    
    var lat : Double?
    var lng : Double?
    
    var carLocations = [CarLocation]()
    
    var row = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: NaverMapViewController.self))
        
        self.carLocations = Array(self.realm.objects(CarLocation.self))
        
        locationManagerLocation.desiredAccuracy = kCLLocationAccuracyBest
        locationManagerLocation.delegate = self as CLLocationManagerDelegate
        // 사용할때만 위치정보를 사용한다는 팝업이 발생
        locationManagerLocation.requestWhenInUseAuthorization()
        locationManagerLocation.startUpdatingLocation()
        
        self.initUi()
    
    }

    private let map_view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private let parking_category_5 : UIButton = {
        let button = UIButton()
        button.setTitle("parking_category_5".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        button.addTarget(self, action: #selector(clickRegister), for: .touchUpInside)
        
        return button
    }()
}
extension NaverMapViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "parking_category_5".localized)
        
        
        self.view.addSubview(self.map_view)
        self.map_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - SizeUtils.navigationHeight - SizeUtils.buttonHeight - SizeUtils.tabHeight - 1)
        }
        self.nmapFView = NMFMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - SizeUtils.navigationHeight - SizeUtils.buttonHeight - SizeUtils.tabHeight - 1))
        
        
        nmapFView.addCameraDelegate(delegate: self)
        
        
        for temp in self.carLocations {
            let marker = NMFMarker()
            marker.iconImage = NMFOverlayImage(name: "parking_car_location")
            marker.iconTintColor = .red
            let lat: Double = (temp.lat as! NSString).doubleValue
            let lng: Double = (temp.lng as! NSString).doubleValue
            marker.position = NMGLatLng(lat: lat, lng: lng)
            marker.mapView = nmapFView
        }
        
        
        let coor = locationManagerLocation.location?.coordinate
        
        marker.position = NMGLatLng(lat: coor!.latitude, lng: coor!.longitude)
        marker.mapView = nmapFView
        
        if row != -1 {
            
            let lat1: Double = (self.carLocations[row].lat as! NSString).doubleValue
            let lng1: Double = (self.carLocations[row].lng as! NSString).doubleValue
            
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat1, lng: lng1))
            nmapFView.moveCamera(cameraUpdate)
        }else{
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: coor!.latitude, lng: coor!.longitude))
            nmapFView.moveCamera(cameraUpdate)
        }
        
        
        self.map_view.addSubview(nmapFView)
        
        
        self.view.addSubview(self.parking_category_5)
        self.parking_category_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.map_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        
        
    }
}
extension NaverMapViewController {
    @objc func clickRegister(){
        
        self.carLocations = Array(self.realm.objects(CarLocation.self))
        
        if carLocations.count > 4 {
            self.openOneButtonPopup(title: "parking_category_5".localized, contents: "register_car_loc_sub_title_3".localized)
        }else{
            let marker = NMFMarker()
            marker.iconImage = NMFOverlayImage(name: "parking_car_location")
            marker.iconTintColor = .red
            marker.position = NMGLatLng(lat: self.lat ?? 0.0, lng: self.lng ?? 0.0)
            marker.mapView = nmapFView
            
            try! self.realm.write {
                self.realm.add(CarLocation(date: CommonUtils.getTodayDate(format: "yyyyMMddkkmmss"), lat: "\(self.lat ?? 0.0)", lng: "\(self.lng ?? 0.0)"))
            }
        }
        
    }
}
extension NaverMapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
extension NaverMapViewController: NMFMapViewCameraDelegate{
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        
        
        self.lat = mapView.cameraPosition.target.lat
        self.lng = mapView.cameraPosition.target.lng
        
        marker.mapView = nil
        marker.position = NMGLatLng(lat: self.lat ?? 0.0, lng: self.lng ?? 0.0)
        marker.mapView = nmapFView
        
    }
}
