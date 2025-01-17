//
//  AirportTransferPathViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportTransferPathViewController: BaseViewController {
    
    var currentTab = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportTransferPathViewController.self))
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
    
    private let transfer_path_t1_title_1: UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t1_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let transfer_root_1t_1t : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer_root_1t_1t")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_path_t2_1_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_1_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_1_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_1_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_1_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_1_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_1_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_1_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_1_desc_5 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_1_desc_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_1_desc_6 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_1_desc_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let transfer_path_t1_title_2: UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t1_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let transfer_root_1t_concourse : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer_root_1t_concourse")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_path_t2_2_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_5 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_6 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_7 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_7".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_8 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_8".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_2_desc_9 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_2_desc_9".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let transfer_path_t1_title_3: UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t1_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transfer_root_1t_2t : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transfer_root_1t_2t")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let transfer_path_t2_3_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_4 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_5 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_6 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_7 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_7".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_8 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_8".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_9 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_9".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let transfer_path_t2_3_desc_10 : UILabel = {
        let label = UILabel()
        label.text = "transfer_path_t2_3_desc_10".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
       
//    "transfer_path_t1_title_3" = "제1여객터미널 → 제2여객터미널";
//    "transfer_path_t1_3_desc_1" = "① 도착탑승구(2층)";
//    "transfer_path_t1_3_desc_2" = "② 환승보안검색(2층 → 3층)";
//    "transfer_path_t1_3_desc_3" = "③ 환승녹색안내판 따라가기(101~270)";
//    "transfer_path_t1_3_desc_4" = "④ 셔틀트레인(블루라인) 탑승 (지하1층)";
//    "transfer_path_t1_3_desc_5" = "⑤ 환승녹색안내판 따라가기(230~270)";
//    "transfer_path_t1_3_desc_6" = "⑥ 자동환승게이트(지하1층)";
//    "transfer_path_t1_3_desc_7" = "⑦ 셔틀트레인(오렌지라인) 탑승 (지하1층)";
//    "transfer_path_t1_3_desc_8" = "⑧ 환승안내데스크(4층)";
//    "transfer_path_t1_3_desc_9" = "⑨ 출발탑승구(3층)";
//


//    "transfer_path_con_title_3" = "탑승동 → 제2여객터미널";
//    "transfer_path_con_3_desc_1" = "① 도착탑승구(2층)";
//    "transfer_path_con_3_desc_2" = "② 환승녹색안내판 따라가기(101~270)";
//    "transfer_path_con_3_desc_3" = "③ 환승보안검색(2층 → 3층)";
//    "transfer_path_con_3_desc_4" = "④ 환승녹색안내판 따라가기(230~270)";
//    "transfer_path_con_3_desc_5" = "⑤ 자동환승게이트(3층)";
//    "transfer_path_con_3_desc_6" = "⑥ 셔틀트레인(오렌지라인) 탑승 (지하1층)";
//    "transfer_path_con_3_desc_7" = "⑦ 환승안내데스크(4층)";
//    "transfer_path_con_3_desc_8" = "⑧ 출발탑승구(3층)";
//

//    "transfer_path_t2_title_3" = "제2여객터미널 → 제1여객터미널";
//    "transfer_path_t2_3_desc_1" = "① 도착탑승구(2층)";
//    "transfer_path_t2_3_desc_2" = "② 환승녹색안내판 따라가기(1~132)";
//    "transfer_path_t2_3_desc_3" = "③ 자동환승게이트(2층)";
//    "transfer_path_t2_3_desc_4" = "④ 셔틀트레인(오렌지라인) 탑승 (지하1층)";
//    "transfer_path_t2_3_desc_5" = "⑤ 환승녹색안내판 따라가기(1~50)";
//    "transfer_path_t2_3_desc_6" = "⑥ 자동환승게이트(지하1층)";
//    "transfer_path_t2_3_desc_7" = "⑦ 셔틀트레인(블루라인) 탑승 (지하1층)";
//    "transfer_path_t2_3_desc_8" = "⑧ 환승보안검색(2층 → 3층)";
//    "transfer_path_t2_3_desc_9" = "⑨ 환승안내데스크(4층)";
//    "transfer_path_t2_3_desc_10" = "⑩ 출발탑승구(3층)";
}
extension AirportTransferPathViewController{
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
        
        self.contentsView.addSubview(self.transfer_path_t1_title_1)
        self.transfer_path_t1_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_root_1t_1t)
        self.transfer_root_1t_1t.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t1_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.8)
        }
        
        self.contentsView.addSubview(self.transfer_path_t2_1_desc_1)
        self.transfer_path_t2_1_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_root_1t_1t.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_1_desc_2)
        self.transfer_path_t2_1_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_1_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_1_desc_3)
        self.transfer_path_t2_1_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_1_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_1_desc_4)
        self.transfer_path_t2_1_desc_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_1_desc_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_1_desc_5)
        self.transfer_path_t2_1_desc_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_1_desc_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_1_desc_6)
        self.transfer_path_t2_1_desc_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_1_desc_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_path_t1_title_2)
        self.transfer_path_t1_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_1_desc_6.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_root_1t_concourse)
        self.transfer_root_1t_concourse.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t1_title_2.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.8)
        }
        
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_1)
        self.transfer_path_t2_2_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_root_1t_concourse.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_2)
        self.transfer_path_t2_2_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_3)
        self.transfer_path_t2_2_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_4)
        self.transfer_path_t2_2_desc_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_5)
        self.transfer_path_t2_2_desc_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_6)
        self.transfer_path_t2_2_desc_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_7)
        self.transfer_path_t2_2_desc_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_6.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_8)
        self.transfer_path_t2_2_desc_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_7.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_2_desc_9)
        self.transfer_path_t2_2_desc_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_8.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_path_t1_title_3)
        self.transfer_path_t1_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_2_desc_9.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.transfer_root_1t_2t)
        self.transfer_root_1t_2t.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t1_title_3.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.8)
        }
        
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_1)
        self.transfer_path_t2_3_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_root_1t_2t.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_2)
        self.transfer_path_t2_3_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_3)
        self.transfer_path_t2_3_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_4)
        self.transfer_path_t2_3_desc_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_5)
        self.transfer_path_t2_3_desc_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_6)
        self.transfer_path_t2_3_desc_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_7)
        self.transfer_path_t2_3_desc_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_6.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_8)
        self.transfer_path_t2_3_desc_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_7.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_9)
        self.transfer_path_t2_3_desc_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_8.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.transfer_path_t2_3_desc_10)
        self.transfer_path_t2_3_desc_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.transfer_path_t2_3_desc_9.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
        if self.currentTab == 1 {
            self.transfer_path_t1_title_1.text = "transfer_path_con_title_1".localized.getSubTitle
            self.transfer_root_1t_1t.image = UIImage(named: "transfer_root_concourse_concourse")
            
            self.transfer_path_t2_1_desc_1.text = "transfer_path_con_1_desc_1".localized
            self.transfer_path_t2_1_desc_2.text = "transfer_path_con_1_desc_2".localized
            self.transfer_path_t2_1_desc_3.text = "transfer_path_con_1_desc_3".localized
            self.transfer_path_t2_1_desc_4.text = "transfer_path_con_1_desc_4".localized
            self.transfer_path_t2_1_desc_5.text = "transfer_path_con_1_desc_5".localized
            self.transfer_path_t2_1_desc_6.text = ""
            
            self.transfer_path_t1_title_2.text = "transfer_path_con_title_2".localized.getSubTitle
            
            self.transfer_root_1t_concourse.image = UIImage(named: "transfer_root_concourse_1t")
            
            self.transfer_path_t2_2_desc_1.text = "transfer_path_con_2_desc_1".localized
            self.transfer_path_t2_2_desc_2.text = "transfer_path_con_2_desc_2".localized
            self.transfer_path_t2_2_desc_3.text = "transfer_path_con_2_desc_3".localized
            self.transfer_path_t2_2_desc_4.text = "transfer_path_con_2_desc_4".localized
            self.transfer_path_t2_2_desc_5.text = "transfer_path_con_2_desc_5".localized
            self.transfer_path_t2_2_desc_6.text = "transfer_path_con_2_desc_6".localized
            self.transfer_path_t2_2_desc_7.text = ""
            self.transfer_path_t2_2_desc_8.text = ""
            self.transfer_path_t2_2_desc_9.text = ""
            
            self.transfer_path_t2_2_desc_3.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
            
            self.transfer_path_t1_title_3.text = "transfer_path_con_title_3".localized.getSubTitle
            
            self.transfer_root_1t_2t.image = UIImage(named: "transfer_root_concourse_2t")
            
            self.transfer_path_t2_3_desc_1.text = "transfer_path_con_3_desc_1".localized
            self.transfer_path_t2_3_desc_2.text = "transfer_path_con_3_desc_2".localized
            self.transfer_path_t2_3_desc_3.text = "transfer_path_con_3_desc_3".localized
            self.transfer_path_t2_3_desc_4.text = "transfer_path_con_3_desc_4".localized
            self.transfer_path_t2_3_desc_5.text = "transfer_path_con_3_desc_5".localized
            self.transfer_path_t2_3_desc_6.text = "transfer_path_con_3_desc_6".localized
            self.transfer_path_t2_3_desc_7.text = "transfer_path_con_3_desc_7".localized
            self.transfer_path_t2_3_desc_8.text = "transfer_path_con_3_desc_8".localized
            self.transfer_path_t2_3_desc_9.text = ""
            self.transfer_path_t2_3_desc_10.text = ""
            
            self.transfer_path_t2_3_desc_6.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
            
        }else if self.currentTab == 2 {
            self.transfer_path_t1_title_1.text = "transfer_path_t2_title_1".localized.getSubTitle
            self.transfer_root_1t_1t.image = UIImage(named: "transfer_root_2t_2t")
            
            self.transfer_path_t1_title_2.text = "transfer_path_t2_title_2".localized.getSubTitle
            self.transfer_root_1t_concourse.image = UIImage(named: "transfer_root_2t_concourse")
            
            self.transfer_path_t2_2_desc_4.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
            
            self.transfer_path_t1_title_3.text = "transfer_path_t2_title_3".localized.getSubTitle
            
            self.transfer_root_1t_2t.image = UIImage(named: "transfer_root_2t_1t")
            
            self.transfer_path_t2_3_desc_4.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
            self.transfer_path_t2_3_desc_7.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
            
        }else{
            self.transfer_path_t2_1_desc_1.text = "transfer_path_t1_1_desc_1".localized
            self.transfer_path_t2_1_desc_2.text = "transfer_path_t1_1_desc_2".localized
            self.transfer_path_t2_1_desc_3.text = "transfer_path_t1_1_desc_3".localized
            self.transfer_path_t2_1_desc_4.text = "transfer_path_t1_1_desc_4".localized
            self.transfer_path_t2_1_desc_5.text = ""
            self.transfer_path_t2_1_desc_6.text = ""
            
            self.transfer_path_t2_2_desc_1.text = "transfer_path_t1_2_desc_1".localized
            self.transfer_path_t2_2_desc_2.text = "transfer_path_t1_2_desc_2".localized
            self.transfer_path_t2_2_desc_3.text = "transfer_path_t1_2_desc_3".localized
            self.transfer_path_t2_2_desc_4.text = "transfer_path_t1_2_desc_4".localized
            self.transfer_path_t2_2_desc_5.text = "transfer_path_t1_2_desc_5".localized
            self.transfer_path_t2_2_desc_6.text = "transfer_path_t1_2_desc_6".localized
            self.transfer_path_t2_2_desc_7.text = ""
            self.transfer_path_t2_2_desc_8.text = ""
            self.transfer_path_t2_2_desc_9.text = ""
            
            self.transfer_path_t2_2_desc_4.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
            
            self.transfer_path_t2_3_desc_1.text = "transfer_path_t1_3_desc_1".localized
            self.transfer_path_t2_3_desc_2.text = "transfer_path_t1_3_desc_2".localized
            self.transfer_path_t2_3_desc_3.text = "transfer_path_t1_3_desc_3".localized
            self.transfer_path_t2_3_desc_4.text = "transfer_path_t1_3_desc_4".localized
            self.transfer_path_t2_3_desc_5.text = "transfer_path_t1_3_desc_5".localized
            self.transfer_path_t2_3_desc_6.text = "transfer_path_t1_3_desc_6".localized
            self.transfer_path_t2_3_desc_7.text = "transfer_path_t1_3_desc_7".localized
            self.transfer_path_t2_3_desc_8.text = "transfer_path_t1_3_desc_8".localized
            self.transfer_path_t2_3_desc_9.text = "transfer_path_t1_3_desc_9".localized
            self.transfer_path_t2_3_desc_10.text = ""
            
            self.transfer_path_t2_3_desc_4.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueLightText)
            self.transfer_path_t2_3_desc_7.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.orangeCrowded)
        }
        

//        "transfer_path_t1_title_3" = "제1여객터미널 → 제2여객터미널";
//        "transfer_path_t1_3_desc_1" = "① 도착탑승구(2층)";
//        "transfer_path_t1_3_desc_2" = "② 환승보안검색(2층 → 3층)";
//        "transfer_path_t1_3_desc_3" = "③ 환승녹색안내판 따라가기(101~270)";
//        "transfer_path_t1_3_desc_4" = "④ 셔틀트레인(블루라인) 탑승 (지하1층)";
//        "transfer_path_t1_3_desc_5" = "⑤ 환승녹색안내판 따라가기(230~270)";
//        "transfer_path_t1_3_desc_6" = "⑥ 자동환승게이트(지하1층)";
//        "transfer_path_t1_3_desc_7" = "⑦ 셔틀트레인(오렌지라인) 탑승 (지하1층)";
//        "transfer_path_t1_3_desc_8" = "⑧ 환승안내데스크(4층)";
//        "transfer_path_t1_3_desc_9" = "⑨ 출발탑승구(3층)";

//        "transfer_path_con_title_3" = "탑승동 → 제2여객터미널";
//        "transfer_path_con_3_desc_1" = "① 도착탑승구(2층)";
//        "transfer_path_con_3_desc_2" = "② 환승녹색안내판 따라가기(101~270)";
//        "transfer_path_con_3_desc_3" = "③ 환승보안검색(2층 → 3층)";
//        "transfer_path_con_3_desc_4" = "④ 환승녹색안내판 따라가기(230~270)";
//        "transfer_path_con_3_desc_5" = "⑤ 자동환승게이트(3층)";
//        "transfer_path_con_3_desc_6" = "⑥ 셔틀트레인(오렌지라인) 탑승 (지하1층)";
//        "transfer_path_con_3_desc_7" = "⑦ 환승안내데스크(4층)";
//        "transfer_path_con_3_desc_8" = "⑧ 출발탑승구(3층)";
//

//        "transfer_path_t2_title_3" = "제2여객터미널 → 제1여객터미널";
//        "transfer_path_t2_3_desc_1" = "① 도착탑승구(2층)";
//        "transfer_path_t2_3_desc_2" = "② 환승녹색안내판 따라가기(1~132)";
//        "transfer_path_t2_3_desc_3" = "③ 자동환승게이트(2층)";
//        "transfer_path_t2_3_desc_4" = "④ 셔틀트레인(오렌지라인) 탑승 (지하1층)";
//        "transfer_path_t2_3_desc_5" = "⑤ 환승녹색안내판 따라가기(1~50)";
//        "transfer_path_t2_3_desc_6" = "⑥ 자동환승게이트(지하1층)";
//        "transfer_path_t2_3_desc_7" = "⑦ 셔틀트레인(블루라인) 탑승 (지하1층)";
//        "transfer_path_t2_3_desc_8" = "⑧ 환승보안검색(2층 → 3층)";
//        "transfer_path_t2_3_desc_9" = "⑨ 환승안내데스크(4층)";
//        "transfer_path_t2_3_desc_10" = "⑩ 출발탑승구(3층)";
    }
}
