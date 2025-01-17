//
//  ArrCongestionT2ViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/08/31.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ArrCongestionT2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUi()
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
    
    private var arr_congestion_time : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_time".localized
        return label
    }()
    private var arr_congestion_div : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_div".localized
        return label
    }()
    private var arr_congestion_area_t2_a : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_t2_a".localized
        return label
    }()
    private var arr_congestion_area_t2_b : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_t2_b".localized
        return label
    }()
    
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.sizeToFit()
        return label
    }
    
    private var arr_congestion_time_5 : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_time_5".localized
        return label
    }()
    private var arr_congestion_time_10 : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_time_10".localized
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
    private var arr_congestion_div_kor_10 : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_div_kor".localized
        return label
    }()
    private var arr_congestion_div_for_10 : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_div_for".localized
        return label
    }()
    
    private var tv_arr_congestion_a_1 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_a_2 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_a_3 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_a_4 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    
    private var tv_arr_congestion_b_1 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_b_2 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_b_3 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_b_4 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
}
//UI
extension ArrCongestionT2ViewController {
    func initUi(){
        self.arr_congestion_time = self.makeHeaderCell(label: self.arr_congestion_time)
        self.arr_congestion_div = self.makeHeaderCell(label: self.arr_congestion_div)
        self.arr_congestion_area_t2_a = self.makeHeaderCell(label: self.arr_congestion_area_t2_a)
        self.arr_congestion_area_t2_b = self.makeHeaderCell(label: self.arr_congestion_area_t2_b)

        self.view.addSubview(self.arr_congestion_time)
        self.arr_congestion_time.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_div)
        self.arr_congestion_div.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_time.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_area_t2_a)
        self.arr_congestion_area_t2_a.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_div.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_area_t2_b)
        self.arr_congestion_area_t2_b.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_area_t2_a.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        
        self.arr_congestion_time_5 = self.makeCell(label: self.arr_congestion_time_5)
        self.arr_congestion_time_10 = self.makeCell(label: self.arr_congestion_time_10)
        self.arr_congestion_div_kor = self.makeCell(label: self.arr_congestion_div_kor)
        self.arr_congestion_div_for = self.makeCell(label: self.arr_congestion_div_for)
        self.arr_congestion_div_kor_10 = self.makeCell(label: self.arr_congestion_div_kor_10)
        self.arr_congestion_div_for_10 = self.makeCell(label: self.arr_congestion_div_for_10)
        
        self.view.addSubview(self.arr_congestion_time_5)
        self.arr_congestion_time_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableSmallHeight * 2)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_div_kor)
        self.arr_congestion_div_kor.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_div_for)
        self.arr_congestion_div_for.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_div_kor.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        
        self.view.addSubview(self.arr_congestion_time_10)
        self.arr_congestion_time_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time_5.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableSmallHeight * 2)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_div_kor_10)
        self.arr_congestion_div_kor_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time_5.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.arr_congestion_div_for_10)
        self.arr_congestion_div_for_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_div_kor_10.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        
        self.tv_arr_congestion_a_1 = self.makeCell(label: self.tv_arr_congestion_a_1)
        self.tv_arr_congestion_a_2 = self.makeCell(label: self.tv_arr_congestion_a_2)
        self.tv_arr_congestion_a_3 = self.makeCell(label: self.tv_arr_congestion_a_3)
        self.tv_arr_congestion_a_4 = self.makeCell(label: self.tv_arr_congestion_a_4)
        self.tv_arr_congestion_b_1 = self.makeCell(label: self.tv_arr_congestion_b_1)
        self.tv_arr_congestion_b_2 = self.makeCell(label: self.tv_arr_congestion_b_2)
        self.tv_arr_congestion_b_3 = self.makeCell(label: self.tv_arr_congestion_b_3)
        self.tv_arr_congestion_b_4 = self.makeCell(label: self.tv_arr_congestion_b_4)
        
        self.view.addSubview(self.tv_arr_congestion_a_1)
        self.tv_arr_congestion_a_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_area_t2_a.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_a)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.tv_arr_congestion_a_2)
        self.tv_arr_congestion_a_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_a_1.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_a)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.tv_arr_congestion_a_3)
        self.tv_arr_congestion_a_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_a_2.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_a)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.tv_arr_congestion_a_4)
        self.tv_arr_congestion_a_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_a_3.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_a)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        
        self.view.addSubview(self.tv_arr_congestion_b_1)
        self.tv_arr_congestion_b_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_area_t2_b.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.tv_arr_congestion_b_2)
        self.tv_arr_congestion_b_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_b_1.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.tv_arr_congestion_b_3)
        self.tv_arr_congestion_b_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_b_2.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }
        self.view.addSubview(self.tv_arr_congestion_b_4)
        self.tv_arr_congestion_b_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_b_3.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_t2_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.view.frame.width - (SizeUtils.sideMargin * 2))/4)
        }

    }
}
