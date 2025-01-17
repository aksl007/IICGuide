//
//  StaffBusViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class StaffBusViewController: BaseViewController {
    
    var currentTab = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: StaffBusViewController.self))
        self.initUi()
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let staff_bus_reserve_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let staff_bus_reserve_link_1 : UILabel = {
        let label = UILabel()
        label.text = "staff_bus_reserve_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let staff_bus_reserve_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let staff_bus_reserve_link_2 : UILabel = {
        let label = UILabel()
        label.text = "staff_bus_reserve_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let staff_bus_reserve_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let staff_bus_reserve_link_3 : UILabel = {
        let label = UILabel()
        label.text = "staff_bus_reserve_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let staff_bus_reserve_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

//    "staff_bus_route_info_link_1" = "노선 / 운행정보";
//    "staff_bus_info_link_1" = "승차권예매 안내";
//    "staff_bus_info_link_2" = "예매변경 및 취소 안내";
//    "staff_bus_info_link_3" = "현금영수증 안내";
//    "staff_bus_help_1" = "공지사항";
//    "staff_bus_help_2" = "FAQ";
//    "staff_bus_help_3" = "고객의 소리";
}
extension StaffBusViewController{
    func initUi(){

        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-CommonUtils.getBottomPadding() - (SizeUtils.navigationHeight * 2) - CommonUtils.getTopPadding())
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.staff_bus_reserve_link_1.tag = 0
        self.staff_bus_reserve_link_1.isUserInteractionEnabled = true
        self.staff_bus_reserve_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapStaffBus(_:))))
        
        self.contentsView.addSubview(self.staff_bus_reserve_link_1_start_line_view)
        self.staff_bus_reserve_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.staff_bus_reserve_link_1)
        self.staff_bus_reserve_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.staff_bus_reserve_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.staff_bus_reserve_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.staff_bus_reserve_link_1_line_view)
        self.staff_bus_reserve_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.staff_bus_reserve_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.staff_bus_reserve_link_2.tag = 1
        self.staff_bus_reserve_link_2.isUserInteractionEnabled = true
        self.staff_bus_reserve_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapStaffBus(_:))))
        self.contentsView.addSubview(self.staff_bus_reserve_link_2)
        self.staff_bus_reserve_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.staff_bus_reserve_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.staff_bus_reserve_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.staff_bus_reserve_link_2_line_view)
        self.staff_bus_reserve_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.staff_bus_reserve_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.staff_bus_reserve_link_3.tag = 2
        self.staff_bus_reserve_link_3.isUserInteractionEnabled = true
        self.staff_bus_reserve_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapStaffBus(_:))))
        self.contentsView.addSubview(self.staff_bus_reserve_link_3)
        self.staff_bus_reserve_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.staff_bus_reserve_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.staff_bus_reserve_link_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.staff_bus_reserve_link_3_line_view)
        self.staff_bus_reserve_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.staff_bus_reserve_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
        if self.currentTab == 1 {
            
            self.staff_bus_reserve_link_1.text = "staff_bus_route_info_link_1".localized
            
            self.staff_bus_reserve_link_2.isHidden = true
            self.staff_bus_reserve_link_2_line_view.isHidden = true
            
            self.staff_bus_reserve_link_3.isHidden = true
            self.staff_bus_reserve_link_3_line_view.isHidden = true
        }else if self.currentTab == 2 {
            self.staff_bus_reserve_link_1.text = "staff_bus_info_link_1".localized
            self.staff_bus_reserve_link_2.text = "staff_bus_info_link_2".localized
            self.staff_bus_reserve_link_3.text = "staff_bus_info_link_3".localized
        }else if self.currentTab == 3 {
            self.staff_bus_reserve_link_1.text = "staff_bus_help_1".localized
            self.staff_bus_reserve_link_2.text = "staff_bus_help_2".localized
            self.staff_bus_reserve_link_3.text = "staff_bus_help_3".localized
        }
        
    }
}
extension StaffBusViewController{
    @objc func tapStaffBus(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            if self.currentTab == 0 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_RESERVE_1)
            }else if self.currentTab == 1 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_ROUTE_INFO)
            }else if self.currentTab == 2 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_INFO_1)
            }else if self.currentTab == 3 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_HELP_1)
            }
            
        }else if sender.view?.tag == 1 {
            if self.currentTab == 0 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_RESERVE_2)
            }else if self.currentTab == 2 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_INFO_2)
            }else if self.currentTab == 3 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_HELP_2)
            }
        }else if sender.view?.tag == 2 {
            if self.currentTab == 0 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_RESERVE_3)
            }else if self.currentTab == 2 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_INFO_3)
            }else if self.currentTab == 3 {
                self.openWebView(title: (sender.view as! UILabel).text ?? "" , url: ServerUtils.URL_STAFF_BUS_HELP_3)
            }
        }

    }
}
