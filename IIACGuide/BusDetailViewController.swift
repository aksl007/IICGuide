//
//  BusDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BusDetailViewController: BaseViewController {
    
    var terminalType = "T1"
    var platform = "S" // S - 서울방면, G - 경기방면, I - 인천방면, N - 심야버스, C - 지방행
    
    var busDatas = [BusData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BusDetailViewController.self))
        self.initUi()
        self.getTransportationBuses()
    }
    
    private let busDetailView: UITableView = {
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
extension BusDetailViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "bus_link_1".localized)
        if self.platform == "G" {
            self.setNavigationItemTitle(title: "bus_link_2".localized)
        }else if self.platform == "I" {
            self.setNavigationItemTitle(title: "bus_link_3".localized)
        }else if self.platform == "N" {
            self.setNavigationItemTitle(title: "bus_link_4".localized)
        }else if self.platform == "C" {
            self.setNavigationItemTitle(title: "bus_link_5".localized)
        }
        
        self.busDetailView.delegate = self
        self.busDetailView.dataSource = self
        self.busDetailView.separatorStyle = .none
        self.busDetailView.register(BusDetailTableViewCell.self, forCellReuseIdentifier: "BusDetailTableViewCell")
        
        self.view.addSubview(self.busDetailView)
        self.busDetailView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
        self.search_no_result.isHidden = true
        self.view.addSubview(self.search_no_result)
        self.search_no_result.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
extension BusDetailViewController {
    func getTransportationBuses(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getBusInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationBuses
        
        Session.default.request(
            apiUrl,
            method: .get,
            parameters:
            [
                "terminalId": terminalId,
                "platformSector": self.platform
            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
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
                            let result = try? JSONDecoder().decode(BaseResult<[BusData]>.self, from: dataJson)
                            
                            self.busDatas = result?.data as! [BusData]
                                
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.busDetailView.reloadData()
                        
                        if self.busDatas.count == 0 {
                            self.search_no_result.isHidden = false
                        }
                        
                    } else {
                        
                    }
                    Loading.hide()
                case .failure(let error):
                    print(error)
                    
                    Loading.hide()
                }
        }
    }
}
extension BusDetailViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let busRouteDetailVC = BusRouteDetailViewController()
        busRouteDetailVC.terminalType = self.terminalType
        busRouteDetailVC.busId = self.busDatas[indexPath.row].busID ?? ""
        busRouteDetailVC.platform = self.platform
        self.navigationController?.pushViewController(busRouteDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.busDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusDetailTableViewCell")! as! BusDetailTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.busData = self.busDatas[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
