//
//  ValetParkingInfoViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ValetParkingInfoViewController: BaseViewController {
    
    var terminalType = "T1"

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ValetParkingInfoViewController.self))
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
    
    private let valet_parking_title : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_title".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let parkingproxy_map_1t : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "parkingproxy_map_1t")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private let valet_parking_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let valet_parking_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let valet_parking_link_1 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let valet_parking_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let valet_parking_link_2 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let valet_parking_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let valet_parking_link_3 : UILabel = {
        let label = UILabel()
        label.text = "valet_parking_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let valet_parking_link_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
//
//    "valet_parking_title" = "공식 주차대행 접수장";
//    "valet_parking_desc_1" = "차량번호를 확인하시기 바랍니다.\n결제한 차량이 본인 차량이 아닐 경우 추가 결제를 하셔야 합니다.\n차량조회가 안될 시 다른 터미널을 선택바랍니다";
//    "valet_parking_link_1" = "주차대행 이용 안내";
//    "valet_parking_link_2" = "주차대행 문의";
//    "valet_parking_link_3" = "주차대행 예약";
//    "valet_parking_t1_call_title" = "주차대행(T1)";
//    "valet_parking_t1_call_num" = "032-743-0123";
//    "valet_parking_t2_call_title" = "주차대행(T2)";
//    "valet_parking_t2_call_num" = "032-743-0751";

}
extension ValetParkingInfoViewController {
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

        self.contentsView.addSubview(self.valet_parking_title)
        self.valet_parking_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        if self.terminalType == "T2" {
            self.parkingproxy_map_1t.image = UIImage(named: "parkingproxy_map_2t")
        }
        self.contentsView.addSubview(self.parkingproxy_map_1t)
        self.parkingproxy_map_1t.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_title.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width)
            
        }
        if self.terminalType == "T2" {
            self.valet_parking_desc_1.isHidden = true
        }
        self.contentsView.addSubview(self.valet_parking_desc_1)
        self.valet_parking_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.parkingproxy_map_1t.snp.bottom).offset(-40)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }
        }
        
        self.contentsView.addSubview(self.valet_parking_link_1_line_view)
        self.valet_parking_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.valet_parking_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveValetParkingInfo)))
        self.valet_parking_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.valet_parking_link_1)
        self.valet_parking_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.valet_parking_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.valet_parking_link_2_line_view)
        self.valet_parking_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.valet_parking_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callValetParkingInfo)))
        self.valet_parking_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.valet_parking_link_2)
        self.valet_parking_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.valet_parking_link_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.valet_parking_link_3_line_view)
        self.valet_parking_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.valet_parking_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reserveValetParking)))
        self.valet_parking_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.valet_parking_link_3)
        self.valet_parking_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.valet_parking_link_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.valet_parking_link_end_line_view)
        self.valet_parking_link_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.valet_parking_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension ValetParkingInfoViewController {
    @objc func moveValetParkingInfo(){
        
        let valetParkingInfoDetailVC = ValetParkingInfoDetailViewController()
        valetParkingInfoDetailVC.terminalType = self.terminalType
        self.navigationController?.pushViewController(valetParkingInfoDetailVC, animated: true)
    }
    
    @objc func callValetParkingInfo(){
        var phoneNumberString = "valet_parking_t1_call_num".localized.replacingOccurrences(of: "-", with: "")
        if self.terminalType == "T2" {
                 phoneNumberString = "valet_parking_t2_call_num".localized.replacingOccurrences(of: "-", with: "")
             }
        if let url = URL(string: "tel://\(phoneNumberString)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func reserveValetParking(){
        
        var urlString = ServerUtils.URL_T1_VALET_PARKING
        
        if self.terminalType == "T2" {
            urlString = ServerUtils.URL_T2_VALET_PARKING
        }
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
