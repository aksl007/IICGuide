//
//  FacilityListViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/15.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import RealmSwift

class FacilityListViewController: BaseViewController {
    
    var facilities = [Facility]()
    
    var terminalType = "T1"
    var paramType = "shopping"
    var isOpen24 = false
    var category = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FacilityListViewController.self))
        self.initUi()
        self.setData()
    }
    
    private let facility_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let facility_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    private let search_no_result : UILabel = {
        let label = UILabel()
        label.text = "search_no_result".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    
}
extension FacilityListViewController {
    func initUi(){
        self.view.addSubview(self.facility_line_view)
        self.facility_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        self.facility_tableview.delegate = self
        self.facility_tableview.dataSource = self
        self.facility_tableview.separatorStyle = .none
        self.facility_tableview.register(FacilityTableViewCell.self, forCellReuseIdentifier: "FacilityTableViewCell")
        
        self.view.addSubview(self.facility_tableview)
        self.facility_tableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.facility_line_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            if self.paramType == "immigration" {
                make.bottom.equalToSuperview()
            }else{
                make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 4) - 5)
            }
            
            
        }
        
        self.search_no_result.isHidden = true
        self.view.addSubview(self.search_no_result)
        self.search_no_result.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            if self.paramType == "immigration" {
                make.centerY.equalToSuperview()
            }else{
                make.centerY.equalToSuperview().offset((-CommonUtils.getTopPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getBottomPadding())/2)
            }
        }
    }
    
    func setData(){
        
        var bigCategory = "103" //shopping
        if self.paramType == "food" {
            bigCategory = "102"
        }else if self.paramType == "rest" {
            bigCategory = "110"
        }else if self.paramType == "medical" {
            bigCategory = "111"
        }else if self.paramType == "finance" {
            bigCategory = "104"
        }else if self.paramType == "other" {
            bigCategory = "107"
        }else if self.paramType == "immigration" {
            bigCategory = "112"
        }
        
        
        var terminalPredicate = NSPredicate(format: "terminalID == 'P03' AND bigCategory == %@ AND delete == false", bigCategory)
        if self.terminalType == "T1" {
            terminalPredicate = NSPredicate(format: "terminalID != 'P03' AND bigCategory == %@ AND delete == false", bigCategory)
        }
        
        if self.isOpen24 {
            self.facilities = Array(realm.objects(Facility.self).filter(terminalPredicate).filter("open24Hours == true").sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
        }else {
            var midCategory = ""
            var i = 0
            for cate in self.category {
                if cate != "" {
                    if i == 0 {
                        midCategory += "midCategory LIKE '*\(cate)*' "
                    }else{
                        midCategory += "OR midCategory LIKE '*\(cate)*'"
                    }
                }
                
                i += 1
            }
            
            if midCategory == "" {
                self.facilities = Array(realm.objects(Facility.self).filter(terminalPredicate).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
            }else {
                self.facilities = Array(realm.objects(Facility.self).filter(terminalPredicate).filter(NSPredicate(format: midCategory)).sorted(byKeyPath: "name.\(CommonUtils.getLocaleId())", ascending: true))
            }
            
        }
        
        if self.facilities.count == 0 {
            self.search_no_result.isHidden = false
        }
        
        self.facility_tableview.reloadData()
        
    }
}
extension FacilityListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let facilityDetailVC = FacilityDetailViewController()
        facilityDetailVC.paramType = self.paramType
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
