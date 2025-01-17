//
//  NoticeViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/29.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class NoticeViewController: BaseViewController {
    
    var notices = [Notice]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: NoticeViewController.self))
        self.initUi()
        self.setData()
    }
    
    private let notice_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    private let common_facility_no_result : UILabel = {
        let label = UILabel()
        label.text = "common_facility_no_result".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
}
extension NoticeViewController{
    func initUi(){
        self.setNavigationItemTitle(title: "slide_main_menu_notice".localized)
        
        self.common_facility_no_result.isHidden = true
        self.view.addSubview(self.common_facility_no_result)
        self.common_facility_no_result.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.notice_tableview.delegate = self
        self.notice_tableview.dataSource = self
        self.notice_tableview.separatorStyle = .none
        self.notice_tableview.register(NoticeTableViewCell.self, forCellReuseIdentifier: "NoticeTableViewCell")
        
        self.view.addSubview(self.notice_tableview)
        self.notice_tableview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    func setData(){
        
        self.notices = Array(self.realm.objects(Notice.self))
        
        if self.notices.count == 0 {
            self.notice_tableview.isHidden = true
            self.notice_tableview.snp.remakeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(0)
            }
        }else{
            self.notice_tableview.isHidden = false
            self.notice_tableview.snp.remakeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            self.notice_tableview.reloadData()
        }
        
        
    }
}
extension NoticeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let noticeDetailVC = NoticeDetailViewController()
        noticeDetailVC.notice = self.notices[indexPath.row]
        self.navigationController?.pushViewController(noticeDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell")! as! NoticeTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.viewWidth = self.view.frame.width
        cell.notice = self.notices[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 + SizeUtils.sideMargin * 2
        
    }

}

