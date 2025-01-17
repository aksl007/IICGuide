//
//  CouponListViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/17.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class CouponListViewController: BaseViewController {
    
    var campaignType = ""

    var coupons = [Coupon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: CouponListViewController.self))
        self.initUi()
        self.setData()
    }
    private let coupon_tableview: UITableView = {
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
extension CouponListViewController {
    func initUi(){
        self.coupon_tableview.delegate = self
        self.coupon_tableview.dataSource = self
        self.coupon_tableview.separatorStyle = .none
        self.coupon_tableview.register(CouponTableViewCell.self, forCellReuseIdentifier: "CouponTableViewCell")
        
        self.view.addSubview(self.coupon_tableview)
        self.coupon_tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 3) - 5)
        }
        
        self.search_no_result.isHidden = true
        self.view.addSubview(self.search_no_result)
        self.search_no_result.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset((-CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 3) - 5)/2)
        }
    }
    
    func setData(){
        self.coupons = Array(self.realm.objects(Coupon.self).filter(NSPredicate(format: "campaignType == %@", campaignType)))
        
        if self.coupons.count == 0 {
            self.search_no_result.isHidden = false
        }else{
            self.search_no_result.isHidden = true
            self.coupon_tableview.reloadData()
        }
    }
}
extension CouponListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let couponDetailVC = CouponDetailViewController()
        couponDetailVC.coupon = self.coupons[indexPath.row]
        self.navigationController?.pushViewController(couponDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coupons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CouponTableViewCell")! as! CouponTableViewCell
 
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.viewWidth = self.view.frame.width
        cell.coupon = self.coupons[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 + SizeUtils.sideMargin * 2
        
    }

}
