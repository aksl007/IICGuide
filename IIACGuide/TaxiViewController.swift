//
//  TaxiViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TaxiViewController: BaseViewController {

    var terminalType = "T1"
    
    var taxiWait: TaxiWait?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: TaxiViewController.self))
        self.initUi()
        self.refreshList(UIButton())
    }
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
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
    
    private let taxi_map_t1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taxi_map_t1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let taxi_title_1: UILabel = {
        let label = UILabel()
        label.text = "taxi_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private var taxi_wait_table_header_1: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_header_1".localized
        return label
    }()
    private var taxi_wait_table_header_2: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_header_2".localized
        return label
    }()
    
    private var taxi_wait_table_t1_div_1: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_t1_div_1".localized
        return label
    }()
    private var taxi_wait_table_t1_div_2: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_t1_div_2".localized
        return label
    }()
    private var taxi_wait_table_t1_div_3: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_t1_div_3".localized
        return label
    }()
    private var taxi_wait_table_t1_div_4: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_t1_div_4".localized
        return label
    }()
    private var taxi_wait_table_t1_div_5: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_t1_div_5".localized
        return label
    }()
    private var taxi_wait_table_t2_div_6: UILabel = {
        let label = UILabel()
        label.text = "taxi_wait_table_t2_div_6".localized
        return label
    }()
    
    private var taxi_wait_table_count_1: UILabel = {
        let label = UILabel()
        return label
    }()
    private var taxi_wait_table_count_2: UILabel = {
        let label = UILabel()
        return label
    }()
    private var taxi_wait_table_count_3: UILabel = {
        let label = UILabel()
        return label
    }()
    private var taxi_wait_table_count_4: UILabel = {
        let label = UILabel()
        return label
    }()
    private var taxi_wait_table_count_5: UILabel = {
        let label = UILabel()
        return label
    }()
    private var taxi_wait_table_count_6: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let taxi_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let taxi_link_1 : UILabel = {
        let label = UILabel()
        label.text = "taxi_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let taxi_link_1_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    
}
extension TaxiViewController {
    func initUi(){
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getTopPadding() - (SizeUtils.navigationHeight * 3) - CommonUtils.getBottomPadding())
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.refreshView)
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
        
        self.taxi_map_t1.tag = 10
        self.taxi_map_t1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveTaxiInfo)))
        self.taxi_map_t1.isUserInteractionEnabled = true
        if self.terminalType == "T2" {
            self.taxi_map_t1.image = UIImage(named: "taxi_map_t2")
        }
        self.contentsView.addSubview(self.taxi_map_t1)
        self.taxi_map_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.refreshView.snp.bottom)
            make.size.equalTo(self.view.frame.width)
        }
        
        self.contentsView.addSubview(self.taxi_title_1)
        self.taxi_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_map_t1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.taxi_wait_table_header_1 = self.makeHeaderCell(label: self.taxi_wait_table_header_1)
        self.taxi_wait_table_header_2 = self.makeHeaderCell(label: self.taxi_wait_table_header_2)
        
        self.contentsView.addSubview(self.taxi_wait_table_header_1)
        self.taxi_wait_table_header_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_header_2)
        self.taxi_wait_table_header_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        
        self.taxi_wait_table_t1_div_1 = self.makeCell(label: self.taxi_wait_table_t1_div_1)
        self.taxi_wait_table_t1_div_2 = self.makeCell(label: self.taxi_wait_table_t1_div_2)
        self.taxi_wait_table_t1_div_3 = self.makeCell(label: self.taxi_wait_table_t1_div_3)
        self.taxi_wait_table_t1_div_4 = self.makeCell(label: self.taxi_wait_table_t1_div_4)
        self.taxi_wait_table_t1_div_5 = self.makeCell(label: self.taxi_wait_table_t1_div_5)
        self.taxi_wait_table_t2_div_6 = self.makeCell(label: self.taxi_wait_table_t2_div_6)
        
        
        if self.terminalType == "T2" {
            self.taxi_wait_table_t1_div_1.text = "taxi_wait_table_t2_div_1".localized
            self.taxi_wait_table_t1_div_2.text = "taxi_wait_table_t2_div_2".localized
            self.taxi_wait_table_t1_div_3.text = "taxi_wait_table_t2_div_3".localized
            self.taxi_wait_table_t1_div_4.text = "taxi_wait_table_t2_div_4".localized
            self.taxi_wait_table_t1_div_5.text = "taxi_wait_table_t2_div_5".localized
        }
        
        self.contentsView.addSubview(self.taxi_wait_table_t1_div_1)
        self.taxi_wait_table_t1_div_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_header_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_t1_div_2)
        self.taxi_wait_table_t1_div_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_t1_div_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_t1_div_3)
        self.taxi_wait_table_t1_div_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_t1_div_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_t1_div_4)
        self.taxi_wait_table_t1_div_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_t1_div_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_t1_div_5)
        self.taxi_wait_table_t1_div_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_t1_div_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_t2_div_6)
        self.taxi_wait_table_t2_div_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_t1_div_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            if self.terminalType == "T2" {
                make.height.equalTo(SizeUtils.tableHeaderHeight)
            }else{
                make.height.equalTo(0)
            }

        }

        self.taxi_wait_table_count_1 = self.makeCell(label: self.taxi_wait_table_count_1)
        self.taxi_wait_table_count_2 = self.makeCell(label: self.taxi_wait_table_count_2)
        self.taxi_wait_table_count_3 = self.makeCell(label: self.taxi_wait_table_count_3)
        self.taxi_wait_table_count_4 = self.makeCell(label: self.taxi_wait_table_count_4)
        self.taxi_wait_table_count_5 = self.makeCell(label: self.taxi_wait_table_count_5)
        self.taxi_wait_table_count_6 = self.makeCell(label: self.taxi_wait_table_count_6)
        
        self.contentsView.addSubview(self.taxi_wait_table_count_1)
        self.taxi_wait_table_count_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_header_1.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_count_2)
        self.taxi_wait_table_count_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_count_1.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_count_3)
        self.taxi_wait_table_count_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_count_2.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_count_4)
        self.taxi_wait_table_count_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_count_3.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_count_5)
        self.taxi_wait_table_count_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_count_4.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.taxi_wait_table_count_6)
        self.taxi_wait_table_count_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_count_5.snp.bottom)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2)/2)
            if self.terminalType == "T2" {
                make.height.equalTo(SizeUtils.tableHeaderHeight)
            }else{
                make.height.equalTo(0)
            }
        }
     
        self.contentsView.addSubview(self.taxi_link_1_line_view)
        self.taxi_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_wait_table_t2_div_6.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.taxi_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveTaxiInfo)))
        self.taxi_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.taxi_link_1)
        self.taxi_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.taxi_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.taxi_link_1_end_line_view)
        self.taxi_link_1_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxi_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
    
    func makeHeaderCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
}
extension TaxiViewController {
    @objc func refreshList(_ sender:UIButton){
        self.getTransportationTaxis()
    }
    @objc func moveTaxiInfo(_ sender:UITapGestureRecognizer){
        if sender.view?.tag == 10 {
            let imageZoomVC = ImageZoomViewController()
            imageZoomVC.paramTitle = "home_drag_menu_5".localized
            imageZoomVC.image = (sender.view as! UIImageView).image
            self.navigationController?.pushViewController(imageZoomVC, animated: true)
        }else{
            let taxiInfoVC = TaxiInfoViewController()
            self.navigationController?.pushViewController(taxiInfoVC, animated: true)
        }
    }
}
extension TaxiViewController {

    func getTransportationTaxis(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getTaxiWaitInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationTaxis + terminalId
        
        Session.default.request(
            apiUrl,
            method: .get,
            //            parameters:
            //            [
            //                "terminalId": terminalId,
            //                "busUsid": busId
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
                            let result = try? JSONDecoder().decode(BaseResult<TaxiWait>.self, from: dataJson)
                            
                            self.taxiWait = result?.data
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        self.refreshTimeLabel.text = CommonUtils.getTodayDate(format: "yyyy.MM.dd kk:mm")
                        
                        self.taxi_wait_table_count_1.text = "\(self.taxiWait?.seoulTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                        self.taxi_wait_table_count_2.text = "\(self.taxiWait?.incheonTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                        self.taxi_wait_table_count_3.text = "\(self.taxiWait?.gyeonggiTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                        self.taxi_wait_table_count_4.text = "\(self.taxiWait?.deluxeTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                        self.taxi_wait_table_count_5.text = "\(self.taxiWait?.vanTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                        
                        if self.terminalType == "T2" {
                            self.taxi_wait_table_count_4.text = "\(self.taxiWait?.intercityTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                            self.taxi_wait_table_count_5.text = "\(self.taxiWait?.deluxeTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
                            self.taxi_wait_table_count_6.text = "\(self.taxiWait?.vanTaxiCount ?? 0) \("taxi_wait_table_count".localized)"
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
