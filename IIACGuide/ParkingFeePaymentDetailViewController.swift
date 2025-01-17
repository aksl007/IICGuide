//
//  ParkingFeePaymentDetailViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/09/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ParkingFeePaymentDetailViewController: BaseViewController {
    
    var carNumber: String = "05루 1231"
    var terminalType = "T1"
    var parkingPaymentInfo : ParkingPaymentInfo?
    var timeOutFlag = true
    var successFlag = true
    
    var timeResult: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ParkingFeePaymentDetailViewController.self))
        initUi()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.timeOutFlag = true
        getParkingPaymentFee()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        
        self.timeOutFlag = false
    }
    

    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let car_number : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_location_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_location_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_location : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_location".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_location_result : UILabel = {
        let label = UILabel()
        label.text = "장기주차장"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_entry_time_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_entry_time_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_entry_time : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_entry_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_entry_time_result : UILabel = {
        let label = UILabel()
        label.text = "2020.09.03 07:02"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_current_time_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_current_time_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_current_time : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_current_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_current_time_result : UILabel = {
        let label = UILabel()
        label.text = "2020.09.03 16:03"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_parking_time_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_parking_time_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let parking_fee_payment_parking_time : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_parking_time".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_parking_time_result : UILabel = {
        let label = UILabel()
        label.text = "0일 0시간 0분"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let cal_fee_label : UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayResultBackground).cgColor
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_btn : UIButton = {
        let button = UIButton()
        button.setTitle("parking_fee_payment_btn".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()
    
    private let parking_fee_payment_sub_title_1: UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_sub_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_desc_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "parking_fee_payment_desc_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let parking_fee_payment_desc_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "parking_fee_payment_desc_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    private let successContentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let successImageP: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image_p")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let successCarNumberLabel : UILabel = {
         let label = UILabel()
         label.text = ""
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
         label.font = UIFont.systemFont(ofSize: SizeUtils.counterNoRange, weight: UIFont.Weight.regular)
         label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
         label.textAlignment = .center
         label.sizeToFit()
         return label
     }()
    private let parking_fee_payment_finish_01 : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_finish_02 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_finish_02".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_finish_02_v_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let tv_payment_finish_time : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_finish_03 : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_finish_03".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let parking_fee_payment_desc_1_success : UILabel = {
        let label = UILabel()
        label.text = "parking_fee_payment_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
  
}
extension ParkingFeePaymentDetailViewController {
    func initUi(){
        setNavigationItemTitle(title: "parking_fee_payment_title".localized)
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        self.successContentsView.isHidden = true
        self.scrollView.addSubview(self.successContentsView)
        self.successContentsView.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.car_number.text = self.carNumber
        self.contentsView.addSubview(self.car_number)
        self.car_number.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.parking_fee_payment_location_h_line_view)
        self.parking_fee_payment_location_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.car_number.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_location)
        self.parking_fee_payment_location.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_location_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_payment_location_v_line_view)
        self.parking_fee_payment_location_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_location)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 2)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_location_result)
        self.parking_fee_payment_location_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_location)
            make.leading.equalTo(self.parking_fee_payment_location_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.parking_fee_payment_entry_time_h_line_view)
        self.parking_fee_payment_entry_time_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_location.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_entry_time)
        self.parking_fee_payment_entry_time.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_entry_time_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_payment_entry_time_v_line_view)
        self.parking_fee_payment_entry_time_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_entry_time)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 2)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_entry_time_result)
        self.parking_fee_payment_entry_time_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_entry_time)
            make.leading.equalTo(self.parking_fee_payment_entry_time_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.parking_fee_payment_current_time_h_line_view)
        self.parking_fee_payment_current_time_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_entry_time.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_current_time)
        self.parking_fee_payment_current_time.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_current_time_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_payment_current_time_v_line_view)
        self.parking_fee_payment_current_time_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_current_time)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 2)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_current_time_result)
        self.parking_fee_payment_current_time_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_current_time)
            make.leading.equalTo(self.parking_fee_payment_current_time_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.parking_fee_payment_parking_time_h_line_view)
        self.parking_fee_payment_parking_time_h_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_current_time.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_parking_time)
        self.parking_fee_payment_parking_time.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_parking_time_h_line_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_payment_parking_time_v_line_view)
        self.parking_fee_payment_parking_time_v_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_parking_time)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 2)
            make.height.equalTo(SizeUtils.titleSmall)
            make.width.equalTo(1)
        }
        self.contentsView.addSubview(self.parking_fee_payment_parking_time_result)
        self.parking_fee_payment_parking_time_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.parking_fee_payment_parking_time)
            make.leading.equalTo(self.parking_fee_payment_parking_time_v_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.cal_fee_label)
        self.cal_fee_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_parking_time.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.parking_fee_payment_btn.addTarget(self, action: #selector(openPaymentWebview(_:)), for: .touchUpInside)
        self.contentsView.addSubview(self.parking_fee_payment_btn)
        self.parking_fee_payment_btn.snp.makeConstraints { (make) in
            make.top.equalTo(self.cal_fee_label.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        
        self.contentsView.addSubview(self.parking_fee_payment_sub_title_1)
        self.parking_fee_payment_sub_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_btn.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.parking_fee_payment_desc_1)
        self.parking_fee_payment_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_sub_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.parking_fee_payment_desc_2)
        self.parking_fee_payment_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
    }
    func successParkingPay(){
        
        self.successFlag = false
        
        self.contentsView.isHidden = true
        self.scrollView.addSubview(self.contentsView)
        self.contentsView.snp.remakeConstraints { (make) in
            make.width.equalTo(0)
            make.centerX.top.bottom.equalToSuperview()
        }
        self.successContentsView.isHidden = false
        self.scrollView.addSubview(self.successContentsView)
        self.successContentsView.snp.remakeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        self.successContentsView.addSubview(self.successImageP)
        self.successImageP.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin * 2)
            make.centerX.equalToSuperview()
            make.size.equalTo(80)
        }
        self.successCarNumberLabel.text = self.carNumber
        self.successContentsView.addSubview(self.successCarNumberLabel)
        self.successCarNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.successImageP.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width / 2)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.parking_fee_payment_finish_01.text = String(format: "parking_fee_payment_finish_01".localized, self.parkingPaymentInfo?.fee?.convertToDecimalNumber as! CVarArg)
        self.successContentsView.addSubview(self.parking_fee_payment_finish_01)
        self.parking_fee_payment_finish_01.snp.makeConstraints { (make) in
            make.top.equalTo(self.successCarNumberLabel.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width * 2 / 3)
        }
        
        self.successContentsView.addSubview(self.parking_fee_payment_finish_02)
        self.parking_fee_payment_finish_02.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_finish_01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalTo(self.parking_fee_payment_finish_01.snp.leading)
            make.width.equalTo((self.view.frame.width * 2 / 3) / 3)
            
        }
        
        self.successContentsView.addSubview(self.parking_fee_payment_finish_02_v_line_view)
        self.parking_fee_payment_finish_02_v_line_view.snp.makeConstraints { (make) in
            make.leading.equalTo(self.parking_fee_payment_finish_02.snp.trailing).offset(SizeUtils.contentsMargin)
            make.centerY.equalTo(self.parking_fee_payment_finish_02)
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
        
        self.tv_payment_finish_time.text = self.timeResult
        self.successContentsView.addSubview(self.tv_payment_finish_time)
        self.tv_payment_finish_time.snp.makeConstraints { (make) in
            make.leading.equalTo(self.parking_fee_payment_finish_02_v_line_view.snp.trailing).offset(SizeUtils.verticalMargin)
            make.centerY.equalTo(self.parking_fee_payment_finish_02_v_line_view)
        }
        self.successContentsView.addSubview(self.parking_fee_payment_finish_03)
        self.parking_fee_payment_finish_03.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_finish_02.snp.bottom).offset(SizeUtils.verticalMargin)
            make.centerX.equalToSuperview()
        }
        self.successContentsView.addSubview(self.parking_fee_payment_desc_1_success)
        self.parking_fee_payment_desc_1_success.snp.makeConstraints { (make) in
            make.top.equalTo(self.parking_fee_payment_finish_03.snp.bottom).offset(SizeUtils.verticalMargin)
            make.width.equalTo(self.view.frame.width * 2 / 3)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
  
    func failParkingPay(){
        self.openOneButtonPopup(title: "parking_fee_payment_fail_title".localized, contents: "parking_fee_payment_fail_popup_desc".localized, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    func closeParkingFeePayment() {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ParkingFeePaymentDetailViewController {
    @objc func openPaymentWebview(_ sender:UIButton){
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        let url:String = "\(ServerUtils.PARKING_URL)\(ServerUtils.URL_WEB_PAY)terminalId=\(terminalId)&parkid=\(self.parkingPaymentInfo?.parkingProcNo ?? "0")&amt=\(self.parkingPaymentInfo?.fee ?? "0")&carno=\(self.carNumber)"
        
        let webVC = ParkingFeePaymentWebViewController()
        webVC.webViewTitle = "parking_category_2".localized
        webVC.webViewUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        webVC.parkingFeePaymentDetail = self
        self.navigationController?.pushViewController(webVC, animated: true)
    }
}
extension ParkingFeePaymentDetailViewController {
    func getParkingPaymentFee(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getParkingPaymentInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.parkingPaymentFee + terminalId
            
            Session.default.request(
                apiUrl,
                method: .get,
                parameters:
                [
                    "fullCarNo": self.carNumber
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
                                let result = try? JSONDecoder().decode(BaseResult<ParkingPaymentInfo>.self, from: dataJson)

                                self.parkingPaymentInfo = result?.data
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                        
                            if self.parkingPaymentInfo?.cmd == "FEEREP" {
                                if self.terminalType == "T1" {
                                    if self.parkingPaymentInfo?.parkingLot == "단기주차장" {
                                        self.parking_fee_payment_location_result.text = "real_time_info_parking_short_term".localized
                                    }else {
                                        self.parking_fee_payment_location_result.text = "real_time_info_parking_long_term".localized
                                    }
                                }else {
                                    if self.parkingPaymentInfo?.parkingLot == "단기" {
                                        self.parking_fee_payment_location_result.text = "real_time_info_parking_short_term".localized
                                    }else {
                                        self.parking_fee_payment_location_result.text = "real_time_info_parking_long_term".localized
                                    }
                                }
                                
                                self.parking_fee_payment_entry_time_result.text = CommonUtils.convertToStringFromStringDate(inputString: self.parkingPaymentInfo?.entryDateTime, inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy.MM.dd kk:mm")
                                self.parking_fee_payment_current_time_result.text = CommonUtils.convertToStringFromStringDate(inputString: self.parkingPaymentInfo?.paymentDateTime, inputFormat: "yyyyMMddkkmm", outputFormat: "yyyy.MM.dd kk:mm")
                                
                                let str: String = (self.parkingPaymentInfo?.parkingTime)!
                                
                                let dIdx: String.Index = str.index(str.startIndex, offsetBy: 4)
                                let dResult = String(str[...dIdx])
                                
                                let hIdx: String.Index = str.index(str.startIndex, offsetBy: 6)
                                let hResult = String(str[dIdx...hIdx])
                                
                                let mResult = String(str[hIdx...])
                                
                                self.timeResult = "\(Int(dResult) ?? 0)\("parking_fee_payment_min".localized) \(Int(hResult) ?? 0)\("parking_fee_payment_hour".localized) \(Int(mResult) ?? 0)\("parking_fee_payment_min".localized)"
                                self.parking_fee_payment_parking_time_result.text = "\(Int(dResult) ?? 0)\("parking_fee_payment_min".localized) \(Int(hResult) ?? 0)\("parking_fee_payment_hour".localized) \(Int(mResult) ?? 0)\("parking_fee_payment_min".localized)"
                                
                                self.cal_fee_label.text = "\(self.parkingPaymentInfo?.fee?.convertToDecimalNumber ?? "0")\("parking_fee_payment_unit".localized)"
                                
                                if self.parkingPaymentInfo?.fee == "0" {
                                    self.contentsView.addSubview(self.parking_fee_payment_btn)
                                    self.parking_fee_payment_btn.snp.remakeConstraints { (make) in
                                        make.top.equalTo(self.cal_fee_label.snp.bottom).offset(SizeUtils.verticalMargin)
                                        make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                                        make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                                        make.height.equalTo(0)
                                    }
                                }
                                
                                DispatchQueue.global(qos: .background).async {
                                    Thread.sleep(forTimeInterval: 40)
                                    DispatchQueue.main.async {
                                        if self.timeOutFlag && self.successFlag {
                                            self.openOneButtonPopup(title: "parking_fee_payment_fail_title".localized, contents: "parking_fee_payment_time_out".localized, completion: {
                                                self.navigationController?.popViewController(animated: true)
                                            })
                                            
                                        }
                                    }
                                 }
                                
                            }else{
                                var contents = "parking_fee_payment_fail_desc_1".localized
                                if self.parkingPaymentInfo?.errorNo == "11" {
                                    contents = "parking_fee_payment_fail_desc_2".localized
                                }else if self.parkingPaymentInfo?.errorNo == "12" {
                                    contents = "parking_fee_payment_fail_desc_3".localized
                                }else if self.parkingPaymentInfo?.errorNo == "13" {
                                    contents = "parking_fee_payment_fail_desc_4".localized
                                }else if self.parkingPaymentInfo?.errorNo == "14" {
                                    contents = self.parkingPaymentInfo?.errorMsg ?? ""
                                }else if self.parkingPaymentInfo?.errorNo == "17" {
                                    contents = "parking_fee_payment_fail_desc_5".localized
                                }
                                self.openOneButtonPopup(title: "parking_fee_payment_fail_title".localized, contents: contents, completion: {
                                    self.navigationController?.popViewController(animated: true)
                                })
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
