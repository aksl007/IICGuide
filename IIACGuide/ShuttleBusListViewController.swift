//
//  ShuttleBusListViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ShuttleBusListViewController: BaseViewController {
    
    var shuttleStops = [ShuttleStop]()
    
    var shuttleBusData : ShuttleBusData?
    
    var usid = "00000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ShuttleBusListViewController.self))
        self.initUi()
        
        self.getShuttleBusTimeInfo()
    }
    private let top_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
}
extension ShuttleBusListViewController {
    func initUi(){
        self.view.addSubview(self.top_line_view)
        self.top_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.bus_tableview.delegate = self
        self.bus_tableview.dataSource = self
        self.bus_tableview.separatorStyle = .none
        self.bus_tableview.register(ShuttleBusTableViewCell.self, forCellReuseIdentifier: "ShuttleBusTableViewCell")
        
        self.view.addSubview(self.bus_tableview)
        self.bus_tableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 2) - CommonUtils.getTopPadding())
        }
    }
}
extension ShuttleBusListViewController {
    
    
    func getShuttleBusTimeInfo(){
        Loading.show()
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getShuttleBusTimeInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.getShuttleBusTimeInfo + self.usid
        
        Session.default.request(
            apiUrl,
            method: .get,
//            parameters:
//            [
//                "keyword": self.keyword
//            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<ShuttleBusData>.self, from: dataJson)

                            self.shuttleBusData = result?.data
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.shuttleStops = self.shuttleBusData?.stops as! [ShuttleStop]
                        
                        self.bus_tableview.reloadData()
                        
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
extension ShuttleBusListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        let busStopTimeVC = BusStopTimeViewController()
        busStopTimeVC.shuttleStop = self.shuttleStops[indexPath.row]
        busStopTimeVC.type = "staff_shuttle"
        self.navigationController?.pushViewController(busStopTimeVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shuttleStops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShuttleBusTableViewCell")! as! ShuttleBusTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.shuttleStop = self.shuttleStops[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30 + SizeUtils.sideMargin * 2
        
    }
    
}
