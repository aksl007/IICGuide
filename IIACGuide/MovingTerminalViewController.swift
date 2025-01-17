//
//  MovingTerminalViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/01.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MovingTerminalViewController: BaseViewController {
    
    var terminalType = "T1"

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MovingTerminalViewController.self))
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
    
    private let moving_terminal_title_1: UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let moving_terminal_t1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moving_terminal_t1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let moving_terminal_t1_end_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let moving_terminal_content_1_1: UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_content_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let moving_terminal_content_1_1_end_view: UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let moving_terminal_content_1_2: UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_content_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: .regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let cell_view: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var moving_terminal_table_header_1 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_header_1".localized
        return label
    }()
    private var moving_terminal_table_header_2 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_header_2".localized
        return label
    }()
    private var moving_terminal_table_header_3 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_header_3".localized
        return label
    }()
    private var moving_terminal_table_header_4 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_header_4".localized
        return label
    }()
    
    private let moving_terminal_table_transportation_1_view: UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let moving_terminal_table_transportation_2_view: UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let moving_terminal_table_transportation_3_view: UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let moving_terminal_table_transportation_1_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_bus")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let moving_terminal_table_transportation_2_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_taxi")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private let moving_terminal_table_transportation_3_image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_train")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var moving_terminal_table_transportation_1 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_transportation_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    private var moving_terminal_table_transportation_2 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_transportation_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    private var moving_terminal_table_transportation_3 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_transportation_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()

    private var moving_terminal_table_location_1 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_location_1".localized
        return label
    }()
    private var moving_terminal_table_location_2 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_location_2".localized
        return label
    }()
    private var moving_terminal_table_location_3 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_location_3".localized
        return label
    }()
    
    private var moving_terminal_table_required_1 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_required_1".localized
        return label
    }()
    private var moving_terminal_table_required_2 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_required_2".localized
        return label
    }()
    private var moving_terminal_table_required_3 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_required_3".localized
        return label
    }()
    
    private var moving_terminal_table_interval_1 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_interval_1".localized
        return label
    }()
    private var moving_terminal_table_interval_2 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_interval_2".localized
        return label
    }()
    private var moving_terminal_table_interval_3 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_table_interval_3".localized
        return label
    }()
    
    
    private let moving_terminal_title_2: UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let moving_path_t1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moving_path_t1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let moving_terminal_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let moving_terminal_link_1 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let moving_terminal_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let moving_terminal_link_2 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let moving_terminal_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let moving_terminal_link_3 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let moving_terminal_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let moving_terminal_link_4 : UILabel = {
        let label = UILabel()
        label.text = "moving_terminal_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let moving_terminal_link_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
}
extension MovingTerminalViewController {
    func initUi(){
        
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
        
        self.contentsView.addSubview(self.moving_terminal_title_1)
        self.moving_terminal_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        if self.terminalType == "T2" {
            self.moving_terminal_t1.image = UIImage(named: "moving_terminal_t2")
        }
        self.contentsView.addSubview(self.moving_terminal_t1)
        self.moving_terminal_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_title_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.trailing.equalToSuperview()
        }
        
        self.contentsView.addSubview(self.moving_terminal_t1_end_view)
        self.moving_terminal_t1_end_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_t1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.moving_terminal_content_1_1.attributedText = "<span style='font-size: \(SizeUtils.contentsBig)px;'>\(String(format: "moving_terminal_content_1_1".localized, "<span style='color:#469197;'>\("flights_list_t1".localized)</span>" as! CVarArg))</span>".htmlToAttributedString
        
        if self.terminalType == "T2" {
            self.moving_terminal_content_1_1.attributedText = "<span style='font-size: \(SizeUtils.contentsBig)px;'>\(String(format: "moving_terminal_t2_content_1_1".localized, "<span style='color:#469197;'>\("flights_list_t2".localized)</span>" as! CVarArg))</span>".htmlToAttributedString
        }
        self.contentsView.addSubview(self.moving_terminal_content_1_1)
        self.moving_terminal_content_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_t1_end_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.moving_terminal_content_1_1_end_view)
        self.moving_terminal_content_1_1_end_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_content_1_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.moving_terminal_content_1_2)
        self.moving_terminal_content_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_content_1_1_end_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.cell_view)
        self.cell_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_content_1_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.moving_terminal_table_header_1 = self.makeHeaderCell(label: self.moving_terminal_table_header_1)
        self.moving_terminal_table_header_2 = self.makeHeaderCell(label: self.moving_terminal_table_header_2)
        self.moving_terminal_table_header_3 = self.makeHeaderCell(label: self.moving_terminal_table_header_3)
        self.moving_terminal_table_header_4 = self.makeHeaderCell(label: self.moving_terminal_table_header_4)
        
        let cellWidth = (self.view.frame.width - SizeUtils.sideMargin * 2) / 5
        self.cell_view.addSubview(self.moving_terminal_table_header_1)
        self.moving_terminal_table_header_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(cellWidth)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.cell_view.addSubview(self.moving_terminal_table_header_2)
        self.moving_terminal_table_header_2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.moving_terminal_table_header_1.snp.trailing)
            make.width.equalTo(cellWidth * 2)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.cell_view.addSubview(self.moving_terminal_table_header_3)
        self.moving_terminal_table_header_3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.moving_terminal_table_header_2.snp.trailing)
            make.width.equalTo(cellWidth)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.cell_view.addSubview(self.moving_terminal_table_header_4)
        self.moving_terminal_table_header_4.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.moving_terminal_table_header_3.snp.trailing)
            make.width.equalTo(cellWidth)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        
        self.cell_view.addSubview(self.moving_terminal_table_transportation_1_view)
        self.moving_terminal_table_transportation_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_header_1.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo(cellWidth)
        }
        self.cell_view.addSubview(self.moving_terminal_table_transportation_2_view)
        self.moving_terminal_table_transportation_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_1_view.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo(cellWidth)
        }
        self.cell_view.addSubview(self.moving_terminal_table_transportation_3_view)
        self.moving_terminal_table_transportation_3_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_2_view.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo(cellWidth)
            
            make.bottom.equalToSuperview()
        }
        
        self.moving_terminal_table_transportation_1_view.addSubview(self.moving_terminal_table_transportation_1_image)
        self.moving_terminal_table_transportation_1_image.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        self.moving_terminal_table_transportation_1_view.addSubview(self.moving_terminal_table_transportation_1)
        self.moving_terminal_table_transportation_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_1_image.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.moving_terminal_table_transportation_2_view.addSubview(self.moving_terminal_table_transportation_2_image)
        self.moving_terminal_table_transportation_2_image.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        self.moving_terminal_table_transportation_2_view.addSubview(self.moving_terminal_table_transportation_2)
        self.moving_terminal_table_transportation_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_2_image.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.moving_terminal_table_transportation_3_view.addSubview(self.moving_terminal_table_transportation_3_image)
        self.moving_terminal_table_transportation_3_image.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.contentsMargin)
            make.centerX.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        self.moving_terminal_table_transportation_3_view.addSubview(self.moving_terminal_table_transportation_3)
        self.moving_terminal_table_transportation_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_3_image.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SizeUtils.contentsMargin)
        }
        
        self.moving_terminal_table_location_1 = self.makeCell(label: self.moving_terminal_table_location_1)
        self.moving_terminal_table_location_2 = self.makeCell(label: self.moving_terminal_table_location_2)
        self.moving_terminal_table_location_3 = self.makeCell(label: self.moving_terminal_table_location_3)
        
        if self.terminalType == "T2" {
            
            self.moving_terminal_table_location_1.text = "moving_terminal_table_t2_location_1".localized
            self.moving_terminal_table_location_2.text = "moving_terminal_table_t2_location_2".localized
            self.moving_terminal_table_location_3.text = "moving_terminal_table_t2_location_3".localized
        }
        
        self.cell_view.addSubview(self.moving_terminal_table_location_1)
        self.moving_terminal_table_location_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_1_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_1_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_transportation_1_view.snp.trailing)
            make.width.equalTo(cellWidth * 2)
        }
        self.cell_view.addSubview(self.moving_terminal_table_location_2)
        self.moving_terminal_table_location_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_2_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_2_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_transportation_2_view.snp.trailing)
            make.width.equalTo(cellWidth * 2)
        }
        self.cell_view.addSubview(self.moving_terminal_table_location_3)
        self.moving_terminal_table_location_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_3_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_3_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_transportation_3_view.snp.trailing)
            make.width.equalTo(cellWidth * 2)
        }
        
        self.moving_terminal_table_required_1 = self.makeCell(label: self.moving_terminal_table_required_1)
        self.moving_terminal_table_required_2 = self.makeCell(label: self.moving_terminal_table_required_2)
        self.moving_terminal_table_required_3 = self.makeCell(label: self.moving_terminal_table_required_3)
        
        
        self.cell_view.addSubview(self.moving_terminal_table_required_1)
        self.moving_terminal_table_required_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_1_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_1_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_location_1.snp.trailing)
            make.width.equalTo(cellWidth)
        }
        self.cell_view.addSubview(self.moving_terminal_table_required_2)
        self.moving_terminal_table_required_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_2_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_2_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_location_2.snp.trailing)
            make.width.equalTo(cellWidth)
        }
        self.cell_view.addSubview(self.moving_terminal_table_required_3)
        self.moving_terminal_table_required_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_3_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_3_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_location_3.snp.trailing)
            make.width.equalTo(cellWidth)
        }
        
        self.moving_terminal_table_interval_1 = self.makeCell(label: self.moving_terminal_table_interval_1)
        self.moving_terminal_table_interval_2 = self.makeCell(label: self.moving_terminal_table_interval_2)
        self.moving_terminal_table_interval_3 = self.makeCell(label: self.moving_terminal_table_interval_3)
        
        
        self.cell_view.addSubview(self.moving_terminal_table_interval_1)
        self.moving_terminal_table_interval_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_1_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_1_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_required_1.snp.trailing)
            make.width.equalTo(cellWidth)
        }
        self.cell_view.addSubview(self.moving_terminal_table_interval_2)
        self.moving_terminal_table_interval_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_2_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_2_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_required_2.snp.trailing)
            make.width.equalTo(cellWidth)
        }
        self.cell_view.addSubview(self.moving_terminal_table_interval_3)
        self.moving_terminal_table_interval_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_table_transportation_3_view.snp.top)
            make.bottom.equalTo(self.moving_terminal_table_transportation_3_view.snp.bottom)
            make.leading.equalTo(self.moving_terminal_table_required_3.snp.trailing)
            make.width.equalTo(cellWidth)
        }
        
        self.contentsView.addSubview(self.moving_terminal_title_2)
        self.moving_terminal_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.cell_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        if self.terminalType == "T2"{
            self.moving_path_t1.image = UIImage(named: "moving_path_t2")
        }
        self.contentsView.addSubview(self.moving_path_t1)
        self.moving_path_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_title_2.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.moving_terminal_link_1.isUserInteractionEnabled = true
        self.moving_terminal_link_2.isUserInteractionEnabled = true
        self.moving_terminal_link_3.isUserInteractionEnabled = true
        self.moving_terminal_link_4.isUserInteractionEnabled = true
        
        self.moving_terminal_link_1.tag = 0
        self.moving_terminal_link_2.tag = 1
        self.moving_terminal_link_3.tag = 2
        self.moving_terminal_link_4.tag = 3
        
        self.moving_terminal_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMovingTerminal(_:))))
        self.moving_terminal_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMovingTerminal(_:))))
        self.moving_terminal_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMovingTerminal(_:))))
        self.moving_terminal_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMovingTerminal(_:))))
        
        
        self.contentsView.addSubview(self.moving_terminal_link_1_start_line_view)
        self.moving_terminal_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_path_t1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.moving_terminal_link_1)
        self.moving_terminal_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.moving_terminal_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.moving_terminal_link_1_line_view)
        self.moving_terminal_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.moving_terminal_link_2)
        self.moving_terminal_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.moving_terminal_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.moving_terminal_link_2_line_view)
        self.moving_terminal_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.moving_terminal_link_3)
        self.moving_terminal_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.moving_terminal_link_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.moving_terminal_link_3_line_view)
        self.moving_terminal_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.moving_terminal_link_4)
        self.moving_terminal_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.moving_terminal_link_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.moving_terminal_link_4_line_view)
        self.moving_terminal_link_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.moving_terminal_link_4.snp.bottom)
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
extension MovingTerminalViewController {
    @objc func tapMovingTerminal(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            self.movePublicTransport(terminalType: self.terminalType, currentTap: 3)
        }else if sender.view?.tag == 1 {
            self.movePublicTransport(terminalType: self.terminalType, currentTap: 1)
        }else if sender.view?.tag == 2 {
            self.movePublicTransport(terminalType: self.terminalType, currentTap: 2)
        }else if sender.view?.tag == 3 {
            
            if let url = URL(string: "tel://\("moving_terminal_link_4_call".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
