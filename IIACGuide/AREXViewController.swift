//
//  AREXViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AREXViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AREXViewController.self))
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
    
    private let top_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    private let arex_map_t1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arex_map_t1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let arex_title_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 20 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "arex_title_1".localized.getSubTitle,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let arex_title_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 20 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "arex_title_2".localized.getSubTitle,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private var arex_table_1_col_1 : UILabel = {
        let label = UILabel()
        label.text = "arex_table_1_col_1".localized
        return label
    }()
    private var arex_table_1_col_2 : UILabel = {
        let label = UILabel()
        label.text = "arex_table_1_col_2".localized
        return label
    }()
    private var arex_table_1_col_3 : UILabel = {
        let label = UILabel()
        label.text = "arex_table_1_col_3".localized
        return label
    }()
    private var arex_table_2_col_1 : UILabel = {
        let label = UILabel()
        label.text = "arex_table_2_col_1".localized
        return label
    }()
    private var arex_table_2_col_2 : UILabel = {
        let label = UILabel()
        label.text = "arex_table_2_col_2".localized
        return label
    }()
    private var arex_table_2_col_3 : UILabel = {
        let label = UILabel()
        label.text = "arex_table_2_col_3".localized
        return label
    }()
    
    private let arex_title_3 : UILabel = {
        let label = UILabel()
        label.text = "arex_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let arex_route_map: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "arex_route_map")
         imageView.contentMode = .scaleAspectFit
         imageView.sizeToFit()
         return imageView
     }()
    
    private let arex_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let arex_link_1 : UILabel = {
        let label = UILabel()
        label.text = "arex_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let arex_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let arex_link_2 : UILabel = {
        let label = UILabel()
        label.text = "arex_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let arex_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let arex_link_3 : UILabel = {
        let label = UILabel()
        label.text = "arex_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let arex_link_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let arex_link_4 : UILabel = {
        let label = UILabel()
        label.text = "arex_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let arex_link_4_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
//    "arex_link_1" = "공항철도 이용 요금";
//    "arex_link_2" = "공항철도 운행 시간표";
//    "arex_link_3" = "공항철도 승차장 위치";
//    "arex_link_4" = "공항철도 이용 문의";
//    "arex_link_4_call_1" = "1599-7788";
}
extension AREXViewController {
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
        self.contentsView.addSubview(self.top_h_line_view)
        self.top_h_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.arex_map_t1.tag = 10
        self.arex_map_t1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveArexDetail(_:))))
        self.arex_map_t1.isUserInteractionEnabled = true
        if self.terminalType == "T2" {
            self.arex_map_t1.image = UIImage(named: "arex_map_t2")
        }
        self.contentsView.addSubview(self.arex_map_t1)
        self.arex_map_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_h_line_view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.width.height.equalTo(self.view.frame.width)
        }
        
        self.contentsView.addSubview(self.arex_title_1)
        self.arex_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_map_t1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arex_title_2)
        self.arex_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.arex_table_1_col_1 = self.makeHeaderCell(label: self.arex_table_1_col_1)
        self.arex_table_1_col_2 = self.makeHeaderCell(label: self.arex_table_1_col_2)
        self.arex_table_1_col_3 = self.makeHeaderCell(label: self.arex_table_1_col_3)
        self.arex_table_2_col_1 = self.makeCell(label: self.arex_table_2_col_1)
        self.arex_table_2_col_2 = self.makeCell(label: self.arex_table_2_col_2)
        self.arex_table_2_col_3 = self.makeCell(label: self.arex_table_2_col_3)
        
        self.contentsView.addSubview(self.arex_table_1_col_1)
        self.arex_table_1_col_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_table_1_col_2)
        self.arex_table_1_col_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.arex_table_1_col_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_table_1_col_3)
        self.arex_table_1_col_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.arex_table_1_col_2.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        self.contentsView.addSubview(self.arex_table_2_col_1)
        self.arex_table_2_col_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_table_1_col_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_table_2_col_2)
        self.arex_table_2_col_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_table_1_col_1.snp.bottom)
            make.leading.equalTo(self.arex_table_2_col_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.arex_table_2_col_3)
        self.arex_table_2_col_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_table_1_col_1.snp.bottom)
            make.leading.equalTo(self.arex_table_2_col_2.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }

        self.contentsView.addSubview(self.arex_title_3)
        self.arex_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_table_2_col_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.arex_route_map.tag = 10
        self.arex_route_map.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveArexDetail(_:))))
        self.arex_route_map.isUserInteractionEnabled = true
        
        if !CommonUtils.isKorean(){
            self.arex_route_map.image = UIImage(named: "arex_route_map_en")
        }
        
        self.contentsView.addSubview(self.arex_route_map)
        self.arex_route_map.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_title_3.snp.bottom)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.width * 0.55)

        }
        
        self.contentsView.addSubview(self.arex_link_1_line_view)
        self.arex_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_route_map.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.arex_link_1.tag = 0
        self.arex_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveArexDetail(_:))))
        self.arex_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.arex_link_1)
        self.arex_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.arex_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.arex_link_2_line_view)
        self.arex_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.arex_link_2.tag = 1
        self.arex_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveArexDetail(_:))))
        self.arex_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.arex_link_2)
        self.arex_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.arex_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.arex_link_3_line_view)
        self.arex_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.arex_link_3.tag = 2
        self.arex_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveArexDetail(_:))))
        self.arex_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.arex_link_3)
        self.arex_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.arex_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        
        self.contentsView.addSubview(self.arex_link_4_line_view)
        self.arex_link_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.arex_link_4.tag = 3
        self.arex_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveArexDetail(_:))))
        self.arex_link_4.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.arex_link_4)
        self.arex_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.arex_link_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.arex_link_4_end_line_view)
        self.arex_link_4_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arex_link_4.snp.bottom)
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
extension AREXViewController {
    @objc func moveArexDetail(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            let aREXRateVC = AREXRateViewController()
            aREXRateVC.terminalType = self.terminalType
            self.navigationController?.pushViewController(aREXRateVC, animated: true)
        }else if sender.view?.tag == 1 {
            
            let busStopTimeVC = BusStopTimeViewController()
            busStopTimeVC.type = "arex"
            busStopTimeVC.terminalType = self.terminalType
            
            self.navigationController?.pushViewController(busStopTimeVC, animated: true)
           
        }else if sender.view?.tag == 2 {
         //TODO map
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("arex_link_4_call_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
        }else if sender.view?.tag == 10 {
            let imageZoomVC = ImageZoomViewController()
            imageZoomVC.paramTitle = "home_drag_menu_5".localized
            imageZoomVC.image = (sender.view as! UIImageView).image
            self.navigationController?.pushViewController(imageZoomVC, animated: true)
        }
    }
}
