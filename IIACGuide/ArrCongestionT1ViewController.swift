//
//  ArrCongestionT1ViewController.swift
//  incheon
//
//  Created by 김진성 on 2020/08/31.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ArrCongestionT1ViewController: UIViewController {
    
    var viewWidth : CGFloat = 0.0

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewWidth == 0.0 {
            viewWidth = self.view.frame.width
        }

        self.initUi()
    }
    
    func makeHeaderCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
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
    private var arr_congestion_area_b : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_b".localized
        return label
    }()
    private var arr_congestion_area_c : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_c".localized
        return label
    }()
    private var arr_congestion_area_d : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_d".localized
        return label
    }()
    private var arr_congestion_area_e : UILabel = {
        let label = UILabel()
        label.text = "arr_congestion_area_e".localized
        return label
    }()
    
    //    "arr_congestion_time" = "시간";
    //    "arr_congestion_div" = "구분";
    //    "arr_congestion_area_b" = "B구역";
    //    "arr_congestion_area_c" = "C구역";
    //    "arr_congestion_area_d" = "D구역";
    //    "arr_congestion_area_e" = "E구역";
    //    "arr_congestion_time_5" = "5분 후";
    //    "arr_congestion_time_10" = "10분 후";
    //    "arr_congestion_div_kor" = "내국인";
    //    "arr_congestion_div_for" = "외국인";
    //    "arr_congestion_section" = "구역";
    //    "arr_congestion_from" = "출발지";
    //    "arr_congestion_flight" = "(항공편)";
    //    "arr_congestion_sch_time" = "도착예정";
    //    "arr_congestion_est_time" = "(도착시간)";
    //    "arr_congestion_gate" = "게이트";
    //    "arr_congestion_area_t2_a" = "A구역";
    //    "arr_congestion_area_t2_b" = "B구역";
    
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
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
    
    private var tv_arr_congestion_c_1 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_c_2 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_c_3 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_c_4 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    
    private var tv_arr_congestion_d_1 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_d_2 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_d_3 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_d_4 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    
    private var tv_arr_congestion_e_1 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_e_2 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_e_3 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    private var tv_arr_congestion_e_4 : UILabel = {
        let label = UILabel()
        label.text = "0".localized
        return label
    }()
    
}
//UI
extension ArrCongestionT1ViewController {
    func initUi(){
        
        self.arr_congestion_time = self.makeHeaderCell(label: self.arr_congestion_time)
        self.arr_congestion_div = self.makeHeaderCell(label: self.arr_congestion_div)
        self.arr_congestion_area_b = self.makeHeaderCell(label: self.arr_congestion_area_b)
        self.arr_congestion_area_c = self.makeHeaderCell(label: self.arr_congestion_area_c)
        self.arr_congestion_area_d = self.makeHeaderCell(label: self.arr_congestion_area_d)
        self.arr_congestion_area_e = self.makeHeaderCell(label: self.arr_congestion_area_e)
        self.view.addSubview(self.arr_congestion_time)
        self.arr_congestion_time.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_div)
        self.arr_congestion_div.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_time.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_area_b)
        self.arr_congestion_area_b.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_div.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_area_c)
        self.arr_congestion_area_c.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_area_b.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_area_d)
        self.arr_congestion_area_d.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_area_c.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_area_e)
        self.arr_congestion_area_e.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.arr_congestion_area_d.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
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
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_div_kor)
        self.arr_congestion_div_kor.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_div_for)
        self.arr_congestion_div_for.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_div_kor.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        
        self.view.addSubview(self.arr_congestion_time_10)
        self.arr_congestion_time_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time_5.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableSmallHeight * 2)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_div_kor_10)
        self.arr_congestion_div_kor_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_time_5.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.arr_congestion_div_for_10)
        self.arr_congestion_div_for_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_div_kor_10.snp.bottom)
            make.leading.equalTo(self.arr_congestion_time_5.snp.trailing)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        
        self.tv_arr_congestion_b_1 = self.makeCell(label: self.tv_arr_congestion_b_1)
        self.tv_arr_congestion_b_2 = self.makeCell(label: self.tv_arr_congestion_b_2)
        self.tv_arr_congestion_b_3 = self.makeCell(label: self.tv_arr_congestion_b_3)
        self.tv_arr_congestion_b_4 = self.makeCell(label: self.tv_arr_congestion_b_4)
        self.tv_arr_congestion_c_1 = self.makeCell(label: self.tv_arr_congestion_c_1)
        self.tv_arr_congestion_c_2 = self.makeCell(label: self.tv_arr_congestion_c_2)
        self.tv_arr_congestion_c_3 = self.makeCell(label: self.tv_arr_congestion_c_3)
        self.tv_arr_congestion_c_4 = self.makeCell(label: self.tv_arr_congestion_c_4)
        self.tv_arr_congestion_d_1 = self.makeCell(label: self.tv_arr_congestion_d_1)
        self.tv_arr_congestion_d_2 = self.makeCell(label: self.tv_arr_congestion_d_2)
        self.tv_arr_congestion_d_3 = self.makeCell(label: self.tv_arr_congestion_d_3)
        self.tv_arr_congestion_d_4 = self.makeCell(label: self.tv_arr_congestion_d_4)
        self.tv_arr_congestion_e_1 = self.makeCell(label: self.tv_arr_congestion_e_1)
        self.tv_arr_congestion_e_2 = self.makeCell(label: self.tv_arr_congestion_e_2)
        self.tv_arr_congestion_e_3 = self.makeCell(label: self.tv_arr_congestion_e_3)
        self.tv_arr_congestion_e_4 = self.makeCell(label: self.tv_arr_congestion_e_4)
        
        self.view.addSubview(self.tv_arr_congestion_b_1)
        self.tv_arr_congestion_b_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_area_b.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_b_2)
        self.tv_arr_congestion_b_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_b_1.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_b_3)
        self.tv_arr_congestion_b_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_b_2.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_b_4)
        self.tv_arr_congestion_b_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_b_3.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_b)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        
        self.view.addSubview(self.tv_arr_congestion_c_1)
        self.tv_arr_congestion_c_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_area_c.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_c)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_c_2)
        self.tv_arr_congestion_c_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_c_1.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_c)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_c_3)
        self.tv_arr_congestion_c_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_c_2.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_c)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_c_4)
        self.tv_arr_congestion_c_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_c_3.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_c)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        
        self.view.addSubview(self.tv_arr_congestion_d_1)
        self.tv_arr_congestion_d_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_area_d.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_d)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_d_2)
        self.tv_arr_congestion_d_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_d_1.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_d)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_d_3)
        self.tv_arr_congestion_d_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_d_2.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_d)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_d_4)
        self.tv_arr_congestion_d_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_d_3.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_d)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        
        self.view.addSubview(self.tv_arr_congestion_e_1)
        self.tv_arr_congestion_e_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arr_congestion_area_e.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_e)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_e_2)
        self.tv_arr_congestion_e_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_e_1.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_e)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_e_3)
        self.tv_arr_congestion_e_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_e_2.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_e)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
        self.view.addSubview(self.tv_arr_congestion_e_4)
        self.tv_arr_congestion_e_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tv_arr_congestion_e_3.snp.bottom)
            make.centerX.equalTo(self.arr_congestion_area_e)
            make.height.equalTo(SizeUtils.tableSmallHeight)
            make.width.equalTo((self.viewWidth - (SizeUtils.sideMargin * 2))/6)
        }
    }
}
