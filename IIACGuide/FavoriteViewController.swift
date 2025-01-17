//
//  FavoriteViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/07/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FavoriteViewController : BaseViewController{
    
    var terminalType = "T1"
    var category = "0"
    var favoriteDatas = [FavoriteData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FavoriteViewController.self))
        self.initUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setData()
    }

    private let favorite_top_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let favorite_empty_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let bookmark_none : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookmark_none")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private let favorite_no_result_1 : UILabel = {
        let label = UILabel()
        label.text = "favorite_no_result_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let favorite_no_result_2 : UILabel = {
        let label = UILabel()
        label.text = "favorite_no_result_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let favorite_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    
}
extension FavoriteViewController {
    func initUI(){
        
        self.view.addSubview(self.favorite_top_line_view)
        self.favorite_top_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.view.addSubview(self.favorite_empty_view)
        self.favorite_empty_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.favorite_top_line_view.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        self.favorite_empty_view.addSubview(self.bookmark_none)
        self.bookmark_none.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.width / 2)
            make.size.equalTo(SizeUtils.iconSizeBig)
        }
        self.favorite_empty_view.addSubview(self.favorite_no_result_1)
        self.favorite_no_result_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.bookmark_none.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview()
        }
        self.favorite_empty_view.addSubview(self.favorite_no_result_2)
        self.favorite_no_result_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.favorite_no_result_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview()
        }
        
        self.favorite_tableview.delegate = self
        self.favorite_tableview.dataSource = self
        self.favorite_tableview.separatorStyle = .none
        self.favorite_tableview.register(FacilityTableViewCell.self, forCellReuseIdentifier: "FacilityTableViewCell")
        self.favorite_tableview.register(BusDetailTableViewCell.self, forCellReuseIdentifier: "BusDetailTableViewCell")
        
        
        self.view.addSubview(self.favorite_tableview)        
        self.favorite_tableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.favorite_top_line_view.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setData(){
        
        if self.terminalType == "T2" {
            if self.category == "0" {
                self.favoriteDatas = Array(self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "terminalId == 'P03'")).sorted(byKeyPath: "favoriteDate", ascending: true))
            }else{
                self.favoriteDatas = Array(self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "terminalId == 'P03' AND category = '\(category)'")).sorted(byKeyPath: "favoriteDate", ascending: true))
            }
            
        }else{
            if self.category == "0" {
                self.favoriteDatas = Array(self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "terminalId != 'P03'")).sorted(byKeyPath: "favoriteDate", ascending: true))
            }else{
                self.favoriteDatas = Array(self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "terminalId != 'P03' AND category = '\(category)'")).sorted(byKeyPath: "favoriteDate", ascending: true))
            }
        }
        
        if self.favoriteDatas.count > 0 {
            self.favorite_tableview.isHidden = false
            self.favorite_tableview.snp.remakeConstraints { (make) in
                make.top.equalTo(self.favorite_top_line_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 3) - 5)
            }
            self.favorite_tableview.reloadData()
            
        }else{
            self.favorite_tableview.isHidden = true
            
            self.favorite_tableview.snp.remakeConstraints { (make) in
                make.top.equalTo(self.favorite_top_line_view.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }
        
    }
}
extension FavoriteViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        if self.favoriteDatas[indexPath.row].category == "3" {
            let busRouteDetailVC = BusRouteDetailViewController()
            busRouteDetailVC.terminalType = self.terminalType
            busRouteDetailVC.busId = self.favoriteDatas[indexPath.row].usid ?? ""
            busRouteDetailVC.platform = self.favoriteDatas[indexPath.row].areaCode ?? ""
            self.navigationController?.pushViewController(busRouteDetailVC, animated: true)
            
        }else{
            let facilityDetailVC = FacilityDetailViewController()
            
            let tempString: String = self.favoriteDatas[indexPath.row].usid ?? ""
            
            facilityDetailVC.paramType = ""
            facilityDetailVC.facility = self.realm.objects(Facility.self).filter(NSPredicate(format: "usid == %@", tempString)).first
            self.navigationController?.pushViewController(facilityDetailVC, animated: true)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.favoriteDatas[indexPath.row].category == "3" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusDetailTableViewCell")! as! BusDetailTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            let favoriteData = self.favoriteDatas[indexPath.row]
            let busData = BusData(terminalID: favoriteData.terminalId, regionName: "", busTypeName: "", busName: favoriteData.busName, busNo: favoriteData.busNo, depots: nil, weekdayOffPeakAllocationTime: favoriteData.busAlllocation, busID: favoriteData.usid, weekendPeakAllocationTime: favoriteData.busAlllocation, weekendOffPeakAllocationTime: favoriteData.busAlllocation, region: "", weekdayPeakAllocationTime: favoriteData.busAlllocation)
            cell.displayDepot = favoriteData.displayDepot
            cell.busData = busData
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityTableViewCell")! as! FacilityTableViewCell
     
            let tempString: String = self.favoriteDatas[indexPath.row].usid ?? ""
            let coupon = Array(self.realm.objects(CampaignTarget.self).filter(NSPredicate(format: "targetID == %@", tempString)))

            if coupon.count > 0 {
                cell.isCoupon = true
            }else{
                cell.isCoupon = false
            }
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.viewWidth = self.view.frame.width
            cell.facility = self.realm.objects(Facility.self).filter(NSPredicate(format: "usid == %@", tempString)).first
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 + SizeUtils.sideMargin * 2
        
    }

}
