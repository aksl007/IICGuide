//
//  ArrCongestionViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/24.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArrCongestionViewController: BaseViewController {
    
    var terminalType = "T1" //T1, T2

    var arrCongestionInfos = [ArrCongestionInfo]()
    var tempArrCongestionInfos = [ArrCongestionInfo]()
    
    var entryMoveTimes = [EntryMoveTime]()
    
    var isSelected0 = true
    var isSelected1 = true
    var isSelected2 = true
    var isSelected3 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ArrCongestionViewController.self))
        
        self.initUi()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        self.getEntryMoveTimeList(terminalId: terminalId)
        
        if terminalType == "T1" {
            self.getEntryMoveTimeList(terminalId: "P02")
        }
    }

    private let refreshView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
        return view
    }()
    
    private let refreshTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "2020.07.30 10:41"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.information, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let refreshButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "popup_btn_update_2_nor"), for: .normal)
        button.setImage(UIImage(named: "popup_btn_update_touch"), for: .highlighted)
        button.addTarget(self, action: #selector(refreshList(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()

    private let tableView : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 1
        view.sizeToFit()
        return view
    }()
    
    private let ll_arr_congestion_check_t1: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let ll_area_b: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let ll_area_c: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let ll_area_d: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private let ll_area_e: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let cb_area_b : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_checkbox_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_checkbox_rel"), for: .selected)
        button.isSelected = true
        button.tag = 0
        button.addTarget(self, action: #selector(toggleChecker(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let cb_area_b_label: UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_b".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let cb_area_c : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_checkbox_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_checkbox_rel"), for: .selected)
        button.addTarget(self, action: #selector(toggleChecker(_:)), for: .touchUpInside)
        button.isSelected = true
        button.tag = 1
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let cb_area_c_label: UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_c".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let cb_area_d : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_checkbox_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_checkbox_rel"), for: .selected)
        button.addTarget(self, action: #selector(toggleChecker(_:)), for: .touchUpInside)
        button.isSelected = true
        button.tag = 2
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let cb_area_d_label: UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_d".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let cb_area_e : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_checkbox_nor"), for: .normal)
        button.setImage(UIImage(named: "btn_checkbox_rel"), for: .selected)
        button.addTarget(self, action: #selector(toggleChecker(_:)), for: .touchUpInside)
        button.isSelected = true
        button.tag = 3
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.sizeToFit()
        return button
    }()
    private let cb_area_e_label: UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_e".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    func makeHeaderCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }
    
    private var arr_congestion_section : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_section".localized
        return label
    }()
    private var arr_congestion_from : UILabel = {
        let label = UILabel()
        label.text = "\("arr_congestion_from".localized)\n\("arr_congestion_flight".localized)"
        return label
    }()
    private var arr_congestion_sch_time : UILabel = {
        let label = UILabel()
        label.text = "\("arr_congestion_sch_time".localized)\n\("arr_congestion_est_time".localized)"
        return label
    }()
    private var arr_congestion_div_kor : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_div_kor".localized
        return label
    }()
    private var arr_congestion_div_for : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_div_for".localized
        return label
    }()
    private var arr_congestion_gate : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_gate".localized
        return label
    }()
    
    private let resultTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
}
//Func
extension ArrCongestionViewController {
    func initUi(){
        
        self.view.addSubview(self.refreshView)
        self.refreshView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        self.refreshView.addSubview(self.refreshTimeLabel)
        self.refreshTimeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.refreshView.addSubview(self.refreshButton)
        self.refreshButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.tableSmallHeight * 5)
        }
        
        
        if self.terminalType == "T2" {
            let arrCongestionT2VC = ArrCongestionT2ViewController()
            self.addChild(arrCongestionT2VC)
            arrCongestionT2VC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - (SizeUtils.sideMargin * 2), height: SizeUtils.tableSmallHeight * 5)
            self.tableView.addSubview(arrCongestionT2VC.view)
        }else {
            let arrCongestionT1VC = ArrCongestionT1ViewController()
            self.addChild(arrCongestionT1VC)
            arrCongestionT1VC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - (SizeUtils.sideMargin * 2), height: SizeUtils.tableSmallHeight * 5)
            self.tableView.addSubview(arrCongestionT1VC.view)
        }
        
        self.view.addSubview(self.ll_arr_congestion_check_t1)
        self.ll_arr_congestion_check_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableView.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        if terminalType == "T2" {
            self.ll_area_b.isHidden = true
            self.ll_area_e.isHidden = true
            
            self.cb_area_c_label.text = "arr_congestion_area_t2_a".localized
            self.cb_area_d_label.text = "arr_congestion_area_t2_b".localized
        }
        self.ll_arr_congestion_check_t1.addSubview(self.ll_area_b)
        self.ll_area_b.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.bottom.equalToSuperview()
        }
        
        self.ll_area_b.addSubview(self.cb_area_b)
        self.cb_area_b.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerX.equalToSuperview()
        }
        self.ll_area_b.addSubview(self.cb_area_b_label)
        self.cb_area_b_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.cb_area_b.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
        }
        
        self.ll_arr_congestion_check_t1.addSubview(self.ll_area_c)
        self.ll_area_c.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.ll_area_b.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
        }
        
        self.ll_area_c.addSubview(self.cb_area_c)
        self.cb_area_c.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerX.equalToSuperview()
        }
        self.ll_area_c.addSubview(self.cb_area_c_label)
        self.cb_area_c_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.cb_area_c.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
        }
        
        self.ll_arr_congestion_check_t1.addSubview(self.ll_area_d)
        self.ll_area_d.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.ll_area_c.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
        }
        
        self.ll_area_d.addSubview(self.cb_area_d)
        self.cb_area_d.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerX.equalToSuperview()
        }
        self.ll_area_d.addSubview(self.cb_area_d_label)
        self.cb_area_d_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.cb_area_b.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
        }
        
        self.ll_arr_congestion_check_t1.addSubview(self.ll_area_e)
        self.ll_area_e.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.ll_area_d.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
        }
        
        self.ll_area_e.addSubview(self.cb_area_e)
        self.cb_area_e.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
            make.centerX.equalToSuperview()
        }
        self.ll_area_e.addSubview(self.cb_area_e_label)
        self.cb_area_e_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.cb_area_e.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.topMargin)
        }
        
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_arr_congestion_check_t1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.arr_congestion_section = self.makeHeaderCell(label: self.arr_congestion_section)
        self.arr_congestion_from = self.makeHeaderCell(label: self.arr_congestion_from)
        self.arr_congestion_sch_time = self.makeHeaderCell(label: self.arr_congestion_sch_time)
        self.arr_congestion_div_kor = self.makeHeaderCell(label: self.arr_congestion_div_kor)
        self.arr_congestion_div_for = self.makeHeaderCell(label: self.arr_congestion_div_for)
        self.arr_congestion_gate = self.makeHeaderCell(label: self.arr_congestion_gate)
        
        self.headerView.addSubview(self.arr_congestion_section)
        self.arr_congestion_section.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 7 / 100)
            make.height.equalTo(SizeUtils.tableBigHeight)
            make.bottom.equalToSuperview()
        }
        self.headerView.addSubview(self.arr_congestion_from)
        self.arr_congestion_from.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_section.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 24 / 100)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.arr_congestion_sch_time)
        self.arr_congestion_sch_time.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_from.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 24 / 100)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.arr_congestion_div_kor)
        self.arr_congestion_div_kor.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_sch_time.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 15 / 100)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.arr_congestion_div_for)
        self.arr_congestion_div_for.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_div_kor.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 15 / 100)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.headerView.addSubview(self.arr_congestion_gate)
        self.arr_congestion_gate.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_div_for.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 15 / 100)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }

        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        self.resultTableView.backgroundColor = .white
        self.resultTableView.separatorStyle = .none
        
        self.resultTableView.register(ArrCongestionTableViewCell.self, forCellReuseIdentifier: "ArrCongestionTableViewCell")
        self.view.addSubview(self.resultTableView)
        
        self.resultTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.headerView.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(self.view.frame.height - CommonUtils.getTopPadding() - CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 6) - 5)
        }
    }
}
//Button
extension ArrCongestionViewController {
    @objc func refreshList(_ sender : UIButton){
        self.getCongestionArrivalsEntryInfos()
    }
    @objc func toggleChecker(_ sender : UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.tag == 0 {
            isSelected0 = sender.isSelected
        }else if sender.tag == 1 {
            isSelected1 = sender.isSelected
        }else if sender.tag == 2 {
            isSelected2 = sender.isSelected
        }else if sender.tag == 3 {
            isSelected3 = sender.isSelected
        }
        
        var tempString:String = ""
        
        if terminalType == "T2" {
            if isSelected1 {
                tempString += "A"
            }
            if isSelected2 {
                tempString += "B"
            }
        }else{
            if isSelected0 {
                tempString += "B"
            }
            if isSelected1 {
                tempString += "C"
            }
            if isSelected2 {
                tempString += "D"
            }
            if isSelected3 {
                tempString += "E"
            }
        }
        
        self.tempArrCongestionInfos.removeAll()
        for arrCongestionInfo in self.arrCongestionInfos {
            if tempString.contains(arrCongestionInfo.zone!) {
                self.tempArrCongestionInfos.append(arrCongestionInfo)
            }
        }
        
        self.resultTableView.reloadData()
    }
}
extension ArrCongestionViewController {
    func getCongestionArrivalsEntryInfos(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getArrCongestionInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.congestionArrivalsEntryInfos + terminalId
        
        Session.default.request(
            apiUrl,
            method: .get,
//            parameters:
//            [
//                "terminalId": terminalId
//            ],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
        )
            .validate(statusCode: 200..<400)
            .responseJSON {response in
                switch response.result{
                case .success(let obj):
                    let json = JSON(obj)
//                    print(json)
                    let code = json["code"]
                    if code == 200 {
                        do {
                            let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                            let result = try? JSONDecoder().decode(BaseResult<[ArrCongestionInfo]>.self, from: dataJson)
                            
                            self.arrCongestionInfos = result?.data as! [ArrCongestionInfo]
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd HH:mm")
                        
                        self.tempArrCongestionInfos = self.arrCongestionInfos
                        self.resultTableView.reloadData()
                        
                        if self.terminalType == "T2" {
                            
                        }else {
                            var iSumKorB5 = 0
                            var iSumForB5 = 0
                            var iSumKorB10 = 0
                            var iSumForB10 = 0
                            var iSumKorC5 = 0
                            var iSumForC5 = 0
                            var iSumKorC10 = 0
                            var iSumForC10 = 0
                            var iSumKorD5 = 0
                            var iSumForD5 = 0
                            var iSumKorD10 = 0
                            var iSumForD10 = 0
                            var iSumKorE5 = 0
                            var iSumForE5 = 0
                            var iSumKorE10 = 0
                            var iSumForE10 = 0
                            
                            for arrCongestionInfo in self.arrCongestionInfos {
                                if let estimatedDateTime = arrCongestionInfo.estimatedDateTime, estimatedDateTime != "" {
                                    let lPlusTime = self.getAreaEntTimePlus(gate: arrCongestionInfo.gate ?? "", lTime: estimatedDateTime)
                                    let diffMin = CommonUtils.minDiffByString(start: CommonUtils.getTodayDate(format: "yyyyMMddkkmm"), end: lPlusTime, inputFormat: "yyyyMMddkkmm")
                                    if diffMin >= 0 && diffMin <= 5 {
                                        if arrCongestionInfo.zone == "B" {
                                            iSumKorB5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForB5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "C" {
                                            iSumKorC5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForC5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "D" {
                                            iSumKorD5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForD5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "E" {
                                            iSumKorE5 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForE5 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        }
                                    }
                                    
                                    if diffMin >= 0 && diffMin <= 10 {
                                        if arrCongestionInfo.zone == "B" {
                                            iSumKorB10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForB10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "C" {
                                            iSumKorC10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForC10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "D" {
                                            iSumKorD10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForD10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        } else if arrCongestionInfo.zone == "E" {
                                            iSumKorE10 += self.getStandByPeople(total: arrCongestionInfo.koreanTotalCount ?? 0, judge: arrCongestionInfo.koreanJudgeCount ?? 0)
                                            iSumForE10 += self.getStandByPeople(total: arrCongestionInfo.foreignerTotalCount ?? 0, judge: arrCongestionInfo.foreignerJudgeCount ?? 0)
                                        }
                                    }
                                }
                            }
                            
                            for view in self.tableView.subviews {
                                view.removeFromSuperview()
                            }
                            let arrCongestionT1VC = ArrCongestionT1ViewController()
                            arrCongestionT1VC.iSumKorB5 = iSumKorB5
                            arrCongestionT1VC.iSumForB5 = iSumForB5
                            arrCongestionT1VC.iSumKorB10 = iSumKorB10
                            arrCongestionT1VC.iSumForB10 = iSumForB10
                            arrCongestionT1VC.iSumKorC5 = iSumKorC5
                            arrCongestionT1VC.iSumForC5 = iSumForC5
                            arrCongestionT1VC.iSumKorC10 = iSumKorC10
                            arrCongestionT1VC.iSumForC10 = iSumForC10
                            arrCongestionT1VC.iSumKorD5 = iSumKorD5
                            arrCongestionT1VC.iSumForD5 = iSumForD5
                            arrCongestionT1VC.iSumKorD10 = iSumKorD10
                            arrCongestionT1VC.iSumForD10 = iSumForD10
                            arrCongestionT1VC.iSumKorE5 = iSumKorE5
                            arrCongestionT1VC.iSumForE5 = iSumForE5
                            arrCongestionT1VC.iSumKorE10 = iSumKorE10
                            arrCongestionT1VC.iSumForE10 = iSumForE10
                            self.addChild(arrCongestionT1VC)
                            arrCongestionT1VC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - (SizeUtils.sideMargin * 2), height: SizeUtils.tableSmallHeight * 5)
                            self.tableView.addSubview(arrCongestionT1VC.view)
                            
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
    
    func getStandByPeople(total: Int, judge: Int) -> Int{
        var sum = total - judge
        if sum < 0 {
            sum = 0
        }
        return sum
    }
    
    func getAreaEntTimePlus(gate: String, lTime: String) -> String{
        var walkTime: Int = 0
        if gate != "" {
            for entryMoveTime in self.entryMoveTimes {
                if "\(entryMoveTime.gate ?? -1)" == gate {
                    walkTime = entryMoveTime.time ?? 0
                }
            }
        }
        if walkTime == 0 {
            if self.terminalType == "T1" {
                if gate != "" {
                    if Int(gate) ?? 0 < 100 {
                        walkTime = 981
                    }else{
                        walkTime = 1848
                    }
                }else {
                    walkTime = 1848
                }
            }else{
                walkTime = 955
            }
        }

        return CommonUtils.getDatePlusSec(start: CommonUtils.convertToDateFromStringDate(inputString: lTime, inputFormat: "yyyyMMddkkmm"), sec: walkTime, format: "yyyyMMddkkmm")
    }
    
    func getEntryMoveTimeList(terminalId: String){
            Loading.show()
            
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getEntryMoveTimeInfo")
        
            let apiUrl = ServerUtils.serverUrl + ServerUtils.congestionEntryMovementTims + terminalId
            
            Session.default.request(
                apiUrl,
                method: .get,
    //            parameters:
    //            [
    //                "terminalId": terminalId
    //            ],
                encoding: URLEncoding.default,
                headers: ["Content-Type":"application/json", "Accept":"application/json", "apikey": ServerUtils.apiKey]
            )
                .validate(statusCode: 200..<400)
                .responseJSON {response in
                    switch response.result{
                    case .success(let obj):
                        let json = JSON(obj)
//                        print(json)
                        let code = json["code"]
                        if code == 200 {
                            do {
                                let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                                let result = try? JSONDecoder().decode(BaseResult<[EntryMoveTime]>.self, from: dataJson)

                                let tempEntryMoveTimes = result?.data as! [EntryMoveTime]
                                if terminalId == "P02" {
                                    for tempEntryMoveTime in tempEntryMoveTimes {
                                    self.entryMoveTimes.append(tempEntryMoveTime)
                                    }
                                    
                                }else{
                                    self.entryMoveTimes = tempEntryMoveTimes
                                    
                                    
                                }
                                
                            } catch {
                                print(error.localizedDescription)
                            }

                            if terminalId == "P02" || terminalId == "P03" {
                                self.getCongestionArrivalsEntryInfos()
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
extension ArrCongestionViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tempArrCongestionInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArrCongestionTableViewCell")! as! ArrCongestionTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.width = self.view.frame.width
        
        cell.arrCongestionInfo = self.tempArrCongestionInfos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeUtils.tableBigHeight
    }
}

