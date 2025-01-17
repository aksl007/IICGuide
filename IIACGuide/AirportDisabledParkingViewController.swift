//
//  AirportDisabledParkingViewController.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDisabledParkingViewController: BaseViewController {
    
    var terminalType = "T1"

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDisabledParkingViewController.self))
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
    
    private let top_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let disabled_parking_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let transport03_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transport03_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let ll_disabled_parking_table_t1: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var disabled_parking_section_desc_1_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_1_1".localized
        return label
    }()
    private var disabled_parking_section_desc_1_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_1_2".localized
        return label
    }()
    private var disabled_parking_section_desc_1_col_1_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_1_3".localized
        return label
    }()
    
    private var disabled_parking_section_desc_1_col_2_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_2_1".localized
        return label
    }()
    private var disabled_parking_section_desc_1_col_2_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_2_2".localized
        return label
    }()
    private var disabled_parking_section_desc_1_col_2_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_2_3".localized
        return label
    }()
    
    private var disabled_parking_section_desc_1_col_3_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_3_1".localized
        return label
    }()
    private var disabled_parking_section_desc_1_col_3_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_3_2".localized
        return label
    }()
    private var disabled_parking_section_desc_1_col_3_3 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_desc_1_col_3_3".localized
        return label
    }()
    
    private let ll_disabled_parking_table_t2: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var disabled_parking_section_t2_desc_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_t2_desc_col_1_1".localized
        return label
    }()
    private var disabled_parking_section_t2_desc_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_t2_desc_col_1_2".localized
        return label
    }()
    
    private var disabled_parking_section_t2_desc_col_2_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_t2_desc_col_2_1".localized
        return label
    }()
    private var disabled_parking_section_t2_desc_col_2_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_t2_desc_col_2_2".localized
        return label
    }()
    
    private var disabled_parking_section_t2_desc_col_3_1 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_t2_desc_col_3_1".localized
        return label
    }()
    private var disabled_parking_section_t2_desc_col_3_2 : UILabel = {
        let label = UILabel()
        label.text = "disabled_parking_section_t2_desc_col_3_2".localized
        return label
    }()
    
    private let disabled_parking_section_desc_1_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "disabled_parking_section_desc_1_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    
    private let disabled_parking_section_desc_1_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "disabled_parking_section_desc_1_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

}
extension AirportDisabledParkingViewController{
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
        self.contentsView.addSubview(self.top_line_view)
        self.top_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.disabled_parking_section_title_1)
        self.disabled_parking_section_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_line_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        
        self.transport03_img01.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickParkingImage(_:))))
        self.transport03_img01.isUserInteractionEnabled = true
        
        

        self.contentsView.addSubview(self.transport03_img01)
        self.transport03_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }else{
                make.height.equalTo(self.view.frame.width)
            }
        }
        
        
        if self.terminalType == "T2" {
            self.ll_disabled_parking_table_t1.isHidden = true
        }
        self.contentsView.addSubview(self.ll_disabled_parking_table_t1)
        self.ll_disabled_parking_table_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.transport03_img01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }
        }
        
        self.disabled_parking_section_desc_1_col_1_1 = self.makeHeaderCell(label: self.disabled_parking_section_desc_1_col_1_1)
        self.disabled_parking_section_desc_1_col_1_2 = self.makeHeaderCell(label: self.disabled_parking_section_desc_1_col_1_2)
        self.disabled_parking_section_desc_1_col_1_3 = self.makeHeaderCell(label: self.disabled_parking_section_desc_1_col_1_3)
        
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_1_1)
        self.disabled_parking_section_desc_1_col_1_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
        }
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_1_2)
        self.disabled_parking_section_desc_1_col_1_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.disabled_parking_section_desc_1_col_1_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_1_3)
        self.disabled_parking_section_desc_1_col_1_3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.disabled_parking_section_desc_1_col_1_2.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        
        self.disabled_parking_section_desc_1_col_2_1 = self.makeCell(label: self.disabled_parking_section_desc_1_col_2_1)
        self.disabled_parking_section_desc_1_col_2_2 = self.makeCell(label: self.disabled_parking_section_desc_1_col_2_2)
        self.disabled_parking_section_desc_1_col_2_3 = self.makeCell(label: self.disabled_parking_section_desc_1_col_2_3)

        
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_2_1)
        self.disabled_parking_section_desc_1_col_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_col_1_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
        }
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_2_2)
        self.disabled_parking_section_desc_1_col_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_col_1_1.snp.bottom)
            make.leading.equalTo(self.disabled_parking_section_desc_1_col_2_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_2_3)
        self.disabled_parking_section_desc_1_col_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_col_1_1.snp.bottom)
            make.leading.equalTo(self.disabled_parking_section_desc_1_col_2_2.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        
        self.disabled_parking_section_desc_1_col_3_1 = self.makeCell(label: self.disabled_parking_section_desc_1_col_3_1)
        self.disabled_parking_section_desc_1_col_3_2 = self.makeCell(label: self.disabled_parking_section_desc_1_col_3_2)
        self.disabled_parking_section_desc_1_col_3_3 = self.makeCell(label: self.disabled_parking_section_desc_1_col_3_3)

        
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_3_1)
        self.disabled_parking_section_desc_1_col_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_col_2_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            
            make.bottom.equalToSuperview()
        }
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_3_2)
        self.disabled_parking_section_desc_1_col_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_col_2_1.snp.bottom)
            make.leading.equalTo(self.disabled_parking_section_desc_1_col_3_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        self.ll_disabled_parking_table_t1.addSubview(self.disabled_parking_section_desc_1_col_3_3)
        self.disabled_parking_section_desc_1_col_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_col_2_1.snp.bottom)
            make.leading.equalTo(self.disabled_parking_section_desc_1_col_3_2.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
        }
        
        if self.terminalType == "T1" {
            self.ll_disabled_parking_table_t2.isHidden = true
        }
        self.contentsView.addSubview(self.ll_disabled_parking_table_t2)
        self.ll_disabled_parking_table_t2.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_disabled_parking_table_t1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if self.terminalType == "T1" {
                make.height.equalTo(0)
            }
        }
        
        self.disabled_parking_section_t2_desc_col_1_1 = self.makeHeaderCell(label: self.disabled_parking_section_t2_desc_col_1_1)
        self.disabled_parking_section_t2_desc_col_1_2 = self.makeHeaderCell(label: self.disabled_parking_section_t2_desc_col_1_2)
        
        self.ll_disabled_parking_table_t2.addSubview(self.disabled_parking_section_t2_desc_col_1_1)
        self.disabled_parking_section_t2_desc_col_1_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
        }
        self.ll_disabled_parking_table_t2.addSubview(self.disabled_parking_section_t2_desc_col_1_2)
        self.disabled_parking_section_t2_desc_col_1_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.disabled_parking_section_t2_desc_col_1_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 4 / 5)
        }
        
        self.disabled_parking_section_t2_desc_col_2_1 = self.makeCell(label: self.disabled_parking_section_t2_desc_col_2_1)
        self.disabled_parking_section_t2_desc_col_2_2 = self.makeCell(label: self.disabled_parking_section_t2_desc_col_2_2)

        
        self.ll_disabled_parking_table_t2.addSubview(self.disabled_parking_section_t2_desc_col_2_1)
        self.disabled_parking_section_t2_desc_col_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_t2_desc_col_1_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
        }
        self.ll_disabled_parking_table_t2.addSubview(self.disabled_parking_section_t2_desc_col_2_2)
        self.disabled_parking_section_t2_desc_col_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_t2_desc_col_1_1.snp.bottom)
            make.leading.equalTo(self.disabled_parking_section_t2_desc_col_2_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 4 / 5)
        }
        
        self.disabled_parking_section_t2_desc_col_3_1 = self.makeCell(label: self.disabled_parking_section_t2_desc_col_3_1)
        self.disabled_parking_section_t2_desc_col_3_2 = self.makeCell(label: self.disabled_parking_section_t2_desc_col_3_2)

        
        self.ll_disabled_parking_table_t2.addSubview(self.disabled_parking_section_t2_desc_col_3_1)
        self.disabled_parking_section_t2_desc_col_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_t2_desc_col_2_1.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            
            make.bottom.equalToSuperview()
        }
        self.ll_disabled_parking_table_t2.addSubview(self.disabled_parking_section_t2_desc_col_3_2)
        self.disabled_parking_section_t2_desc_col_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_t2_desc_col_2_1.snp.bottom)
            make.leading.equalTo(self.disabled_parking_section_t2_desc_col_3_1.snp.trailing)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 4 / 5)
        }
        
        self.contentsView.addSubview(self.disabled_parking_section_desc_1_2)
        self.disabled_parking_section_desc_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.ll_disabled_parking_table_t2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.disabled_parking_section_desc_1_3)
        self.disabled_parking_section_desc_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.disabled_parking_section_desc_1_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
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
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
}
extension AirportDisabledParkingViewController {

    @objc func clickParkingImage(_ sender: UITapGestureRecognizer){
        let imageZoomVC = ImageZoomViewController()
        imageZoomVC.paramTitle = "slide_airport_guide_sub_menu_4".localized
        imageZoomVC.image = (sender.view as! UIImageView).image
        self.navigationController?.pushViewController(imageZoomVC, animated: true)
    }
}
