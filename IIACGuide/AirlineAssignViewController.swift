//
//  AirlineAssignViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirlineAssignViewController: BaseViewController{
    
    var currentTab = 0
    
    var airlineAssigns = [AirlineAssign]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirlineAssignViewController.self))
        self.initUi()
        
        
        self.setData()
        
    }
    private let assign_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
}
extension AirlineAssignViewController {
    func initUi(){
        self.assign_tableview.delegate = self
        self.assign_tableview.dataSource = self
        self.assign_tableview.separatorStyle = .none
        self.assign_tableview.register(AirlineAssignTableViewCell.self, forCellReuseIdentifier: "AirlineAssignTableViewCell")
        self.assign_tableview.register(AirlineAssignHeaderTableViewCell.self, forCellReuseIdentifier: "AirlineAssignHeaderTableViewCell")
        
        self.view.addSubview(self.assign_tableview)
        self.assign_tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 2) - CommonUtils.getTopPadding())
        }
    }
    
    func setData(){
        
        if self.currentTab == 0 {
            for i in 1...22 {
                
                if i == 22 {
                    airlineAssigns.append(AirlineAssign(airline1: "transfer_assignment_table_\(i)_1".localized,airlineCode1: "transfer_assignment_table_\(i)_2".localized, airline2: "", airlineCode2:
                    ""))
                }else{
                airlineAssigns.append(AirlineAssign(airline1: "transfer_assignment_table_\(i)_1".localized,airlineCode1: "transfer_assignment_table_\(i)_2".localized, airline2: "transfer_assignment_table_\(i)_3".localized, airlineCode2: "transfer_assignment_table_\(i)_4".localized))
                }
            }
        }else if self.currentTab == 1 {
            for i in 1...9 {
                
                if i == 9 {
                    airlineAssigns.append(AirlineAssign(airline1: "transfer_assignment_con_table_\(i)_1".localized,airlineCode1: "transfer_assignment_con_table_\(i)_2".localized, airline2: "", airlineCode2:
                    ""))
                }else{
                    airlineAssigns.append(AirlineAssign(airline1: "transfer_assignment_con_table_\(i)_1".localized,airlineCode1: "transfer_assignment_con_table_\(i)_2".localized, airline2: "transfer_assignment_con_table_\(i)_3".localized, airlineCode2: "transfer_assignment_con_table_\(i)_4".localized))
                }
            }
        }else if self.currentTab == 2 {
            for i in 1...6 {
                
                if i == 6 {
                    airlineAssigns.append(AirlineAssign(airline1: "transfer_assignment_t2_table_\(i)_1".localized,airlineCode1: "transfer_assignment_t2_table_\(i)_2".localized, airline2: "", airlineCode2:
                    ""))
                }else{
                    airlineAssigns.append(AirlineAssign(airline1: "transfer_assignment_t2_table_\(i)_1".localized,airlineCode1: "transfer_assignment_t2_table_\(i)_2".localized, airline2: "transfer_assignment_t2_table_\(i)_3".localized, airlineCode2: "transfer_assignment_t2_table_\(i)_4".localized))
                }
            }
        }
        self.assign_tableview.reloadData()
    }
}
extension AirlineAssignViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.airlineAssigns.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AirlineAssignHeaderTableViewCell")! as! AirlineAssignHeaderTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if self.currentTab == 0 {
                cell.headerImage = UIImage(named: "transfer_airline_assign_t1")
            }else if self.currentTab == 1 {
                cell.headerImage = UIImage(named: "transfer_airline_assign_concourse")
            }else if self.currentTab == 2 {
                cell.headerImage = UIImage(named: "transfer_airline_assign_t2")
            }
            
            return cell
                   
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AirlineAssignTableViewCell")! as! AirlineAssignTableViewCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.airlineAssign = self.airlineAssigns[indexPath.row - 1]
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            return self.view.frame.width * 0.8
        }else{
            return SizeUtils.contentsBig + SizeUtils.sideMargin * 2
        }

    }
    
}

