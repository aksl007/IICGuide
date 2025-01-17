//
//  AirportTransfer1ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransfer1ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransfer1ViewController.self))
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
    private let transfer_process_title_1: UILabel = {
        let label = UILabel()
        label.text = "transfer_process_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_leadtime_map : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer_leadtime_map")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_process_title_2: UILabel = {
        let label = UILabel()
        label.text = "transfer_process_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let transfer_process_tool_arrow_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let transfer_process_tool_arrow_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_process_tool_arrow_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let transfer_process_tool_arrow_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let transfer_process_tool_arrow_2 : UILabel = {
        let label = UILabel()
        label.text = "transfer_process_tool_arrow_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let transfer_process_tool_arrow_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let transfer_process_tool_arrow_3 : UILabel = {
        let label = UILabel()
        label.text = "transfer_process_tool_arrow_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let transfer_process_tool_arrow_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    //        "transfer_process_tool_arrow_1" = "제1여객터미널 탑승구 1 - 59";
    //        "transfer_process_tool_arrow_2" = "탑승동 탑승구 101-132";
    //        "transfer_process_tool_arrow_3" = "제2여객터미널 탑승구 230-270";
}
extension AirportTransfer1ViewController {
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
        
        self.contentsView.addSubview(self.transfer_process_title_1)
        self.transfer_process_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_leadtime_map)
        self.transfer_leadtime_map.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.8)
        }
        self.contentsView.addSubview(self.transfer_process_title_2)
        self.transfer_process_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_leadtime_map.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.transfer_process_tool_arrow_1.tag = 0
        self.transfer_process_tool_arrow_1.isUserInteractionEnabled = true
        self.transfer_process_tool_arrow_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTransfer1(_:))))
        
        self.contentsView.addSubview(self.transfer_process_tool_arrow_1_start_line_view)
        self.transfer_process_tool_arrow_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_title_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.transfer_process_tool_arrow_1)
        self.transfer_process_tool_arrow_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_tool_arrow_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.transfer_process_tool_arrow_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.transfer_process_tool_arrow_1_line_view)
        self.transfer_process_tool_arrow_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_tool_arrow_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.transfer_process_tool_arrow_2.tag = 1
        self.transfer_process_tool_arrow_2.isUserInteractionEnabled = true
        self.transfer_process_tool_arrow_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTransfer1(_:))))
        self.contentsView.addSubview(self.transfer_process_tool_arrow_2)
        self.transfer_process_tool_arrow_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_tool_arrow_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.transfer_process_tool_arrow_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.transfer_process_tool_arrow_2_line_view)
        self.transfer_process_tool_arrow_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_tool_arrow_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.transfer_process_tool_arrow_3.tag = 2
        self.transfer_process_tool_arrow_3.isUserInteractionEnabled = true
        self.transfer_process_tool_arrow_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTransfer1(_:))))
        self.contentsView.addSubview(self.transfer_process_tool_arrow_3)
        self.transfer_process_tool_arrow_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_tool_arrow_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.transfer_process_tool_arrow_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.transfer_process_tool_arrow_3_line_view)
        self.transfer_process_tool_arrow_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_process_tool_arrow_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }

    }
}
extension AirportTransfer1ViewController{
    @objc func tapTransfer1(_ sender: UITapGestureRecognizer){
        let airlineAssignTabVC = AirlineAssignTabViewController()
        airlineAssignTabVC.currentTap = sender.view?.tag as! Int
        self.navigationController?.pushViewController(airlineAssignTabVC, animated: true)
    }
}
