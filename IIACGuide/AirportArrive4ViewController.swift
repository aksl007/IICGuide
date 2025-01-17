//
//  AirportArrive4ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportArrive4ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportArrive4ViewController.self))
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
    private let arrival_baggage_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let flights_list_t1 : UILabelPadding = {
        let label = UILabelPadding()
        label.text = "flights_list_t1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueGreenBackground).cgColor
        label.sizeToFit()
        return label
    }()
    private let arrival05_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrival05_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let flights_list_t2 : UILabelPadding = {
        let label = UILabelPadding()
        label.text = "flights_list_t2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.sizeToFit()
        return label
    }()
    private let arrival05_img02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrival05_img02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let arrival_baggage_section_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let arrival_baggage_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let arrival_baggage_section_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let arrival_baggage_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let arrival_baggage_section_desc_3_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_desc_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_baggage_section_desc_3_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_baggage_section_desc_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

}
extension AirportArrive4ViewController{
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
        
        self.contentsView.addSubview(self.arrival_baggage_section_title_1)
        self.arrival_baggage_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.flights_list_t1)
        self.flights_list_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_baggage_section_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival05_img01)
        self.arrival05_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.flights_list_t1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.6)
        }
        self.contentsView.addSubview(self.flights_list_t2)
        self.flights_list_t2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival05_img01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival05_img02)
        self.arrival05_img02.snp.makeConstraints { (make) in
            make.top.equalTo(self.flights_list_t2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.6)
        }
        
        self.contentsView.addSubview(self.arrival_baggage_section_desc_1)
        self.arrival_baggage_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival05_img02.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.arrival_baggage_section_title_2)
        self.arrival_baggage_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_baggage_section_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_baggage_section_desc_2)
        self.arrival_baggage_section_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_baggage_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_baggage_section_title_3)
        self.arrival_baggage_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_baggage_section_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_baggage_section_desc_3_1)
        self.arrival_baggage_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_baggage_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_baggage_section_desc_3_2)
        self.arrival_baggage_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_baggage_section_desc_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }

    }
}
