//
//  ShuttleBusViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class ShuttleBusViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ShuttleBusViewController.self))
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
    
    private let shuttle_bus_top_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let shuttle_bus_table_1_view : UIView = {
        let view = UIView()
        return view
    }()
    private var shuttle_bus_table_1_header_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_1".localized
        return label
    }()
    private var shuttle_bus_table_1_header_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_2".localized
        return label
    }()
    private var shuttle_bus_table_1_header_3: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_3".localized
        return label
    }()
    private var shuttle_bus_table_1_desc_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_desc_t2_1".localized
        return label
    }()
    private var shuttle_bus_table_1_desc_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_desc_t2_2".localized
        return label
    }()
    private var shuttle_bus_table_1_desc_3: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_desc_t2_3".localized
        return label
    }()
    
    private let shuttle_bus_title_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let shuttle_map_t1_1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shuttle_map_t1_1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let shuttle_bus_call_service_desc : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_call_service_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let shuttle_bus_1_link_1_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let shuttle_bus_1_link_1_1 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_1_link_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let shuttle_bus_1_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let shuttle_bus_1_link_2 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_1_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let shuttle_bus_1_link_2_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let shuttle_bus_title_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let shuttle_map_t1_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shuttle_map_t1_2")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let shuttle_bus_title_sub_2_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "shuttle_bus_title_sub_2_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let shuttle_bus_table_2_view : UIView = {
        let view = UIView()
        return view
    }()
    private var shuttle_bus_table_2_header_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_1".localized
        return label
    }()
    private var shuttle_bus_table_2_header_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_2".localized
        return label
    }()
    private var shuttle_bus_table_2_header_3: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_3".localized
        return label
    }()
    
    private var shuttle_bus_table_2_desc_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_2_1_desc_1".localized
        return label
    }()
    private var shuttle_bus_table_2_desc_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_2_1_desc_2".localized
        return label
    }()
    private var shuttle_bus_table_2_desc_3: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_2_1_desc_3".localized
        return label
    }()

    private let shuttle_bus_2_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let shuttle_bus_2_link_1 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_1_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let shuttle_bus_2_1_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let shuttle_bus_2_1_link_2 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_2_1_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let shuttle_bus_2_1_link_2_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    private let shuttle_bus_title_sub_2_2_view : UIView = {
        let view = UIView()
        return view
    }()
    
    private let shuttle_bus_title_sub_2_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "shuttle_bus_title_sub_2_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let shuttle_bus_table_3_view : UIView = {
        let view = UIView()
        return view
    }()
    private var shuttle_bus_table_3_header_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_1".localized
        return label
    }()
    private var shuttle_bus_table_3_header_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_2".localized
        return label
    }()
    private var shuttle_bus_table_3_header_3: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_1_header_3".localized
        return label
    }()
    
    private var shuttle_bus_table_2_2_desc_1: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_2_2_desc_1".localized
        return label
    }()
    private var shuttle_bus_table_2_2_desc_2: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_2_2_desc_2".localized
        return label
    }()
    private var shuttle_bus_table_2_2_desc_3: UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_table_2_2_desc_3".localized
        return label
    }()
    
    
    private let shuttle_bus_2_2_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let shuttle_bus_2_2_link_1 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_1_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let shuttle_bus_2_2_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let shuttle_bus_2_2_link_2 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_2_2_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let shuttle_bus_2_2_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let shuttle_bus_2_2_link_3 : UILabel = {
        let label = UILabel()
        label.text = "shuttle_bus_2_2_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let shuttle_bus_2_2_link_3_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
     
}
extension ShuttleBusViewController {
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
        
        self.contentsView.addSubview(self.shuttle_bus_top_line_view)
        self.shuttle_bus_top_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.shuttle_bus_title_1)
        self.shuttle_bus_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.shuttle_map_t1_1.tag = 10
        self.shuttle_map_t1_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_map_t1_1.isUserInteractionEnabled = true
        if self.terminalType == "T2" {
            self.shuttle_map_t1_1.image = UIImage(named: "shuttle_map_t2_1")
        }
        self.contentsView.addSubview(self.shuttle_map_t1_1)
        self.shuttle_map_t1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_title_1.snp.bottom)
            make.size.equalTo(self.view.frame.width)
        }
        
        if self.terminalType == "T1" {
            self.shuttle_bus_table_1_view.isHidden = true
        }
        self.contentsView.addSubview(self.shuttle_bus_table_1_view)
        self.shuttle_bus_table_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_map_t1_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if self.terminalType == "T1" {
                make.height.equalTo(0)
            }
        }
        
        self.shuttle_bus_table_1_header_1 = self.makeHeaderCell(label: shuttle_bus_table_1_header_1)
        self.shuttle_bus_table_1_header_2 = self.makeHeaderCell(label: shuttle_bus_table_1_header_2)
        self.shuttle_bus_table_1_header_3 = self.makeHeaderCell(label: shuttle_bus_table_1_header_3)
        
        self.shuttle_bus_table_1_view.addSubview(self.shuttle_bus_table_1_header_1)
        self.shuttle_bus_table_1_header_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_1_view.addSubview(self.shuttle_bus_table_1_header_2)
        self.shuttle_bus_table_1_header_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_1_header_1.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_1_view.addSubview(self.shuttle_bus_table_1_header_3)
        self.shuttle_bus_table_1_header_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_1_header_2.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            
            make.bottom.equalToSuperview()
        }

        self.shuttle_bus_table_1_desc_1 = self.makeCell(label: shuttle_bus_table_1_desc_1)
        self.shuttle_bus_table_1_desc_2 = self.makeCell(label: shuttle_bus_table_1_desc_2)
        self.shuttle_bus_table_1_desc_3 = self.makeCell(label: shuttle_bus_table_1_desc_3)
        
        self.shuttle_bus_table_1_view.addSubview(self.shuttle_bus_table_1_desc_1)
        self.shuttle_bus_table_1_desc_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_1_view.addSubview(self.shuttle_bus_table_1_desc_2)
        self.shuttle_bus_table_1_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_1_desc_1.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_1_view.addSubview(self.shuttle_bus_table_1_desc_3)
        self.shuttle_bus_table_1_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_1_desc_2.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        
        self.contentsView.addSubview(self.shuttle_bus_call_service_desc)
        self.shuttle_bus_call_service_desc.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_1_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }
        }
        
        self.contentsView.addSubview(self.shuttle_bus_1_link_1_1_line_view)
        self.shuttle_bus_1_link_1_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_call_service_desc.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        if self.terminalType == "T2" {
            self.shuttle_bus_1_link_1_1.text = "shuttle_bus_1_link_1".localized
        }
        self.shuttle_bus_1_link_1_1.tag = 0
        self.shuttle_bus_1_link_1_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_1_link_1_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.shuttle_bus_1_link_1_1)
        self.shuttle_bus_1_link_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_1_link_1_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        if self.terminalType == "T2" {
            self.shuttle_bus_1_link_1_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        }else{
            self.shuttle_bus_1_link_1_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        }
        
        
        self.contentsView.addSubview(self.shuttle_bus_1_link_2_line_view)
        self.shuttle_bus_1_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_1_link_1_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        if self.terminalType == "T2" {
            self.shuttle_bus_1_link_2.text = "shuttle_bus_1_link_t2_2".localized
        }
        
        self.shuttle_bus_1_link_2.tag = 1
        self.shuttle_bus_1_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_1_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.shuttle_bus_1_link_2)
        self.shuttle_bus_1_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_1_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)

        }
        self.shuttle_bus_1_link_2.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.contentsView.addSubview(self.shuttle_bus_1_link_2_end_line_view)
        self.shuttle_bus_1_link_2_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_1_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        if self.terminalType == "T2" {
            self.shuttle_bus_title_2.text = "shuttle_bus_title_2_t2_1".localized.getSubTitle
        }
        self.contentsView.addSubview(self.shuttle_bus_title_2)
        self.shuttle_bus_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_1_link_2_end_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.shuttle_map_t1_2.tag = 10
        self.shuttle_map_t1_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_map_t1_2.isUserInteractionEnabled = true
        if self.terminalType == "T2" {
            self.shuttle_map_t1_2.image = UIImage(named: "shuttle_map_t2_2")
        }
        self.contentsView.addSubview(self.shuttle_map_t1_2)
        self.shuttle_map_t1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_title_2.snp.bottom)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.width * 0.7)
        }
        
        self.contentsView.addSubview(self.shuttle_bus_title_sub_2_1)
        self.shuttle_bus_title_sub_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_map_t1_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }

        }
        
        self.contentsView.addSubview(self.shuttle_bus_table_2_view)
        self.shuttle_bus_table_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_title_sub_2_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.shuttle_bus_table_2_header_1 = self.makeHeaderCell(label: shuttle_bus_table_2_header_1)
        self.shuttle_bus_table_2_header_2 = self.makeHeaderCell(label: shuttle_bus_table_2_header_2)
        self.shuttle_bus_table_2_header_3 = self.makeHeaderCell(label: shuttle_bus_table_2_header_3)
        
        self.shuttle_bus_table_2_view.addSubview(self.shuttle_bus_table_2_header_1)
        self.shuttle_bus_table_2_header_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_2_view.addSubview(self.shuttle_bus_table_2_header_2)
        self.shuttle_bus_table_2_header_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_header_1.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_2_view.addSubview(self.shuttle_bus_table_2_header_3)
        self.shuttle_bus_table_2_header_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_header_2.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            
            make.bottom.equalToSuperview()
        }

        self.shuttle_bus_table_2_desc_1 = self.makeCell(label: shuttle_bus_table_2_desc_1)
        self.shuttle_bus_table_2_desc_2 = self.makeCell(label: shuttle_bus_table_2_desc_2)
        self.shuttle_bus_table_2_desc_3 = self.makeCell(label: shuttle_bus_table_2_desc_3)
        
        if self.terminalType == "T2" {
            self.shuttle_bus_table_2_desc_1.text = "shuttle_bus_table_2_desc_t2_1".localized
            self.shuttle_bus_table_2_desc_2.text = "shuttle_bus_table_2_desc_t2_2".localized
            self.shuttle_bus_table_2_desc_3.text = "shuttle_bus_table_2_desc_t2_3".localized
        }
        
        self.shuttle_bus_table_2_view.addSubview(self.shuttle_bus_table_2_desc_1)
        self.shuttle_bus_table_2_desc_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_2_view.addSubview(self.shuttle_bus_table_2_desc_2)
        self.shuttle_bus_table_2_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_desc_1.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_2_view.addSubview(self.shuttle_bus_table_2_desc_3)
        self.shuttle_bus_table_2_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_desc_2.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }

    
        self.contentsView.addSubview(self.shuttle_bus_2_link_1_line_view)
        self.shuttle_bus_2_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.shuttle_bus_2_link_1.tag = 2
        self.shuttle_bus_2_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_2_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.shuttle_bus_2_link_1)
        self.shuttle_bus_2_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.shuttle_bus_2_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.shuttle_bus_2_1_link_2_line_view)
        self.shuttle_bus_2_1_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.shuttle_bus_2_1_link_2.tag = 3
        self.shuttle_bus_2_1_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_2_1_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.shuttle_bus_2_1_link_2)
        self.shuttle_bus_2_1_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_1_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)

        }
        self.shuttle_bus_2_1_link_2.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.contentsView.addSubview(self.shuttle_bus_2_1_link_2_end_line_view)
        self.shuttle_bus_2_1_link_2_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_1_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        if self.terminalType == "T2" {
            self.shuttle_bus_title_sub_2_2_view.isHidden = true
        }
        self.contentsView.addSubview(self.shuttle_bus_title_sub_2_2_view)
        self.shuttle_bus_title_sub_2_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_1_link_2_end_line_view).offset(SizeUtils.verticalMargin)
            make.leading.trailing.equalToSuperview()
            if self.terminalType == "T2" {
                make.height.equalTo(0)
            }
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_title_sub_2_2)
        self.shuttle_bus_title_sub_2_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_table_3_view)
        self.shuttle_bus_table_3_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_title_sub_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
        }
        
        self.shuttle_bus_table_3_header_1 = self.makeHeaderCell(label: shuttle_bus_table_3_header_1)
        self.shuttle_bus_table_3_header_2 = self.makeHeaderCell(label: shuttle_bus_table_3_header_2)
        self.shuttle_bus_table_3_header_3 = self.makeHeaderCell(label: shuttle_bus_table_3_header_3)
        
        self.shuttle_bus_table_3_view.addSubview(self.shuttle_bus_table_3_header_1)
        self.shuttle_bus_table_3_header_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_3_view.addSubview(self.shuttle_bus_table_3_header_2)
        self.shuttle_bus_table_3_header_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_3_header_1.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_3_view.addSubview(self.shuttle_bus_table_3_header_3)
        self.shuttle_bus_table_3_header_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_3_header_2.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
            
            make.bottom.equalToSuperview()
        }

        self.shuttle_bus_table_2_2_desc_1 = self.makeCell(label: shuttle_bus_table_2_2_desc_1)
        self.shuttle_bus_table_2_2_desc_2 = self.makeCell(label: shuttle_bus_table_2_2_desc_2)
        self.shuttle_bus_table_2_2_desc_3 = self.makeCell(label: shuttle_bus_table_2_2_desc_3)
        
        self.shuttle_bus_table_3_view.addSubview(self.shuttle_bus_table_2_2_desc_1)
        self.shuttle_bus_table_2_2_desc_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_3_view.addSubview(self.shuttle_bus_table_2_2_desc_2)
        self.shuttle_bus_table_2_2_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_2_desc_1.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.shuttle_bus_table_3_view.addSubview(self.shuttle_bus_table_2_2_desc_3)
        self.shuttle_bus_table_2_2_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_2_2_desc_2.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 3)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }

        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_1_line_view)
        self.shuttle_bus_2_2_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_table_3_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.shuttle_bus_2_2_link_1.tag = 4
        self.shuttle_bus_2_2_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_2_2_link_1.isUserInteractionEnabled = true
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_1)
        self.shuttle_bus_2_2_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_2_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.shuttle_bus_2_2_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_2_line_view)
        self.shuttle_bus_2_2_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_2_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.shuttle_bus_2_2_link_2.tag = 5
        self.shuttle_bus_2_2_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_2_2_link_2.isUserInteractionEnabled = true
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_2)
        self.shuttle_bus_2_2_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_2_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)

        }
        self.shuttle_bus_2_2_link_2.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_3_line_view)
        self.shuttle_bus_2_2_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_2_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.shuttle_bus_2_2_link_3.tag = 6
        self.shuttle_bus_2_2_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.shuttle_bus_2_2_link_3.isUserInteractionEnabled = true
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_3)
        self.shuttle_bus_2_2_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_2_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
            
        }
        self.shuttle_bus_2_2_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.shuttle_bus_title_sub_2_2_view.addSubview(self.shuttle_bus_2_2_link_3_end_line_view)
        self.shuttle_bus_2_2_link_3_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.shuttle_bus_2_2_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalToSuperview()
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
extension ShuttleBusViewController {
    @objc func moveDetail(_ sender: UITapGestureRecognizer){
        
        if self.terminalType == "T1" {
            if sender.view?.tag == 0 {
                if let url = URL(string: "tel://\("shuttle_bus_1_link_call_1_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }else if sender.view?.tag == 1 {
                //TODO map
            }else if sender.view?.tag == 2 {
//                00000013
                
                let busStopTimeVC = BusStopTimeViewController()
                busStopTimeVC.busId = "00000013"
                busStopTimeVC.type = "shuttle"
                self.navigationController?.pushViewController(busStopTimeVC, animated: true)
                
            }else if sender.view?.tag == 3 {
                //TODO map
            }else if sender.view?.tag == 4 {
//                00000020
                let busStopTimeVC = BusStopTimeViewController()
                busStopTimeVC.busId = "00000020"
                busStopTimeVC.type = "shuttle"
                self.navigationController?.pushViewController(busStopTimeVC, animated: true)
            }else if sender.view?.tag == 5 {
                //TODO map
            }else if sender.view?.tag == 6 {
                //TODO map
            }else if sender.view?.tag == 10 {
                let imageZoomVC = ImageZoomViewController()
                imageZoomVC.paramTitle = "home_drag_menu_5".localized
                imageZoomVC.image = (sender.view as! UIImageView).image
                self.navigationController?.pushViewController(imageZoomVC, animated: true)
            }
        }else{
            if sender.view?.tag == 0 {
//                00004001
                let busStopTimeVC = BusStopTimeViewController()
                busStopTimeVC.busId = "00004001"
                busStopTimeVC.type = "shuttle"
                self.navigationController?.pushViewController(busStopTimeVC, animated: true)
            }else if sender.view?.tag == 1 {
                //TODO map
            }else if sender.view?.tag == 2 {
//                00000017
                let busStopTimeVC = BusStopTimeViewController()
                busStopTimeVC.busId = "00000017"
                busStopTimeVC.type = "shuttle"
                self.navigationController?.pushViewController(busStopTimeVC, animated: true)
            }else if sender.view?.tag == 3 {
                //TODO map
            }else if sender.view?.tag == 10 {
                let imageZoomVC = ImageZoomViewController()
                imageZoomVC.paramTitle = "home_drag_menu_5".localized
                imageZoomVC.image = (sender.view as! UIImageView).image
                self.navigationController?.pushViewController(imageZoomVC, animated: true)
            }
        }
    }
}
