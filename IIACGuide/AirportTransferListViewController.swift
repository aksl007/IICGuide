//
//  AirportTransferListViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransferListViewController: BaseViewController {
    
    var currentTab = 0
    
    var facilities = [Facility]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransferListViewController.self))
        self.initUi()
        self.setData()
    }
    private let facility_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
}
extension AirportTransferListViewController{
    func initUi(){
        self.facility_tableview.delegate = self
        self.facility_tableview.dataSource = self
        self.facility_tableview.separatorStyle = .none
        self.facility_tableview.register(FacilityTableViewCell.self, forCellReuseIdentifier: "FacilityTableViewCell")
        
        self.view.addSubview(self.facility_tableview)
        self.facility_tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getTopPadding())
        }
    }
    func setData(){
        if currentTab == 0 {
            self.facilities = Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID == 'P01' AND transferEstablishment == true AND delete == false")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }else if currentTab == 1 {
            self.facilities = Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID == 'P02' AND transferEstablishment == true AND delete == false")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }else if currentTab == 2 {
            self.facilities = Array(self.realm.objects(Facility.self).filter(NSPredicate(format: "terminalID == 'P03' AND transferEstablishment == true AND delete == false")).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }
        
        self.facility_tableview.reloadData()
        
    }
}
extension AirportTransferListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let facilityDetailVC = FacilityDetailViewController()
        facilityDetailVC.paramType = "slide_airport_guide_sub_menu_2".localized
        facilityDetailVC.facility = self.facilities[indexPath.row]
        self.navigationController?.pushViewController(facilityDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.facilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityTableViewCell")! as! FacilityTableViewCell
 
        let tempString: String = self.facilities[indexPath.row].usid ?? ""
        let coupon = Array(self.realm.objects(CampaignTarget.self).filter(NSPredicate(format: "targetID == %@", tempString)))

        if coupon.count > 0 {
            cell.isCoupon = true
        }else{
            cell.isCoupon = false
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.viewWidth = self.view.frame.width
        cell.facility = self.facilities[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 + SizeUtils.sideMargin * 2
        
    }

}
