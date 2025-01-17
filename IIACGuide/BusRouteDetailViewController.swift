//
//  BusRouteDetailViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BusRouteDetailViewController: BaseViewController {
    
    var busId = ""
    var terminalType = "T1"
    var platform = ""

    var busDetailData : BusDetailData?
    
    var busName = ""
    
    var depot = ""
    
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BusRouteDetailViewController.self))
        self.initUi()
        self.getTransportationBusesForRoute()
    }
    
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let contentsView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let icon_bus_title : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_bus_title")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let busNo : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let platform_label : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let gray_line_1 : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    private let bus_detail_depot : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_depot".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_depot_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let bus_detail_depot_terminal : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.redText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_depot_result : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_dest : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_dest".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_dest_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let bus_detail_dest_result : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_fare : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_fare".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_fare_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let bus_detail_fare_result : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_allocation : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_allocation".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_allocation_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let bus_detail_allocation_result : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_company : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_company".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_company_h_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    private let bus_detail_company_result : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_detail_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_detail_link_1 : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_detail_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_detail_link_2 : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_detail_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_detail_link_3 : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_detail_link_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_detail_link_4 : UILabel = {
        let label = UILabel()
        label.text = "bus_detail_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let home_bottom_menu_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let home_bottom_menu_4 : UILabel = {
        let label = UILabel()
        label.text = "home_bottom_menu_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let home_bottom_menu_4_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()


}
extension BusRouteDetailViewController {
    func initUi(){
        self.setNavigationItemTitle(title: "bus_detail_title".localized)
        
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
        
        self.contentsView.addSubview(self.icon_bus_title)
        self.icon_bus_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(SizeUtils.iconSizeSmall)
        }
        
        self.contentsView.addSubview(self.busNo)
        self.busNo.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.icon_bus_title)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.platform_label)
        self.platform_label.snp.makeConstraints { (make) in
            make.top.equalTo(self.busNo.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.icon_bus_title.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.gray_line_1)
        self.gray_line_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.platform_label.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.bus_detail_depot)
        self.bus_detail_depot.snp.makeConstraints { (make) in
            make.top.equalTo(self.gray_line_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_depot_h_line_view)
        self.bus_detail_depot_h_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_depot)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.width.equalTo(1)
            make.height.equalTo(SizeUtils.contentsBig)
        }
        
        self.contentsView.addSubview(self.bus_detail_depot_terminal)
        self.bus_detail_depot_terminal.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_depot)
            make.leading.equalTo(self.bus_detail_depot_h_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        self.contentsView.addSubview(self.bus_detail_depot_result)
        self.bus_detail_depot_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_depot)
            make.leading.equalTo(self.bus_detail_depot_terminal.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_dest)
        self.bus_detail_dest.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_depot.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_dest_h_line_view)
        self.bus_detail_dest_h_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_dest)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.width.equalTo(1)
            make.height.equalTo(SizeUtils.contentsBig)
        }
        
        self.contentsView.addSubview(self.bus_detail_dest_result)
        self.bus_detail_dest_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_dest)
            make.leading.equalTo(self.bus_detail_dest_h_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_dest)
        self.bus_detail_dest.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_depot.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_dest_h_line_view)
        self.bus_detail_dest_h_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_dest)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.width.equalTo(1)
            make.height.equalTo(SizeUtils.contentsBig)
        }
        
        self.contentsView.addSubview(self.bus_detail_dest_result)
        self.bus_detail_dest_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_dest)
            make.leading.equalTo(self.bus_detail_dest_h_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_fare)
        self.bus_detail_fare.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_dest.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_fare_h_line_view)
        self.bus_detail_fare_h_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_fare)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.width.equalTo(1)
            make.height.equalTo(SizeUtils.contentsBig)
        }
        
        self.contentsView.addSubview(self.bus_detail_fare_result)
        self.bus_detail_fare_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_fare)
            make.leading.equalTo(self.bus_detail_fare_h_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_allocation)
        self.bus_detail_allocation.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_fare.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_allocation_h_line_view)
        self.bus_detail_allocation_h_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_allocation)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.width.equalTo(1)
            make.height.equalTo(SizeUtils.contentsBig)
        }
        
        self.contentsView.addSubview(self.bus_detail_allocation_result)
        self.bus_detail_allocation_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_allocation)
            make.leading.equalTo(self.bus_detail_allocation_h_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_company)
        self.bus_detail_company.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_allocation.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_company_h_line_view)
        self.bus_detail_company_h_line_view.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_company)
            make.leading.equalToSuperview().offset((self.view.frame.width - SizeUtils.sideMargin * 2) / 4)
            make.width.equalTo(1)
            make.height.equalTo(SizeUtils.contentsBig)
        }
        
        self.contentsView.addSubview(self.bus_detail_company_result)
        self.bus_detail_company_result.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bus_detail_company)
            make.leading.equalTo(self.bus_detail_company_h_line_view.snp.trailing).offset(SizeUtils.contentsMargin)
        }
        
        self.contentsView.addSubview(self.bus_detail_link_1_line_view)
        self.bus_detail_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_company.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.bus_detail_link_1.tag = 0
        self.bus_detail_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickBusRouteDetail(_:))))
        self.bus_detail_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_detail_link_1)
        self.bus_detail_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_detail_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_detail_link_2_line_view)
        self.bus_detail_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_detail_link_2.tag = 1
        self.bus_detail_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickBusRouteDetail(_:))))
        self.bus_detail_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_detail_link_2)
        self.bus_detail_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_detail_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_detail_link_3_line_view)
        self.bus_detail_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_detail_link_3.tag = 2
        self.bus_detail_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickBusRouteDetail(_:))))
        self.bus_detail_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_detail_link_3)
        self.bus_detail_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_detail_link_3.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.contentsView.addSubview(self.bus_detail_link_4_line_view)
        self.bus_detail_link_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_detail_link_4.tag = 3
        self.bus_detail_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickBusRouteDetail(_:))))
        self.bus_detail_link_4.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_detail_link_4)
        self.bus_detail_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_detail_link_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.home_bottom_menu_4_line_view)
        self.home_bottom_menu_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_detail_link_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.home_bottom_menu_4.tag = 4
        self.home_bottom_menu_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickBusRouteDetail(_:))))
        self.home_bottom_menu_4.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.home_bottom_menu_4)
        self.home_bottom_menu_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.home_bottom_menu_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.home_bottom_menu_4.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_delete")!)
        
        self.contentsView.addSubview(self.home_bottom_menu_4_end_line_view)
        self.home_bottom_menu_4_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.home_bottom_menu_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension BusRouteDetailViewController {
    @objc func clickBusRouteDetail(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //버스 정류장
            let busRouteStopVC = BusRouteStopViewController()
            busRouteStopVC.busId = self.busId
            busRouteStopVC.terminalType = self.terminalType
            busRouteStopVC.platform = self.platform
            busRouteStopVC.busName = self.busName
            
            self.navigationController?.pushViewController(busRouteStopVC, animated: true)
        }else if sender.view?.tag == 1 {
            //버스 운행 시간표
            
            let busStopTimeVC = BusStopTimeViewController()
            busStopTimeVC.busId = self.busId
            busStopTimeVC.terminalType = self.terminalType
            busStopTimeVC.platform = self.platform
            busStopTimeVC.busName = self.busName
            
            self.navigationController?.pushViewController(busStopTimeVC, animated: true)
            
        }else if sender.view?.tag == 2 {
            //버스 승차장 위치
            //TODO map
        }else if sender.view?.tag == 3 {
            //버스 이용 문의 전화
            if let url = URL(string: "tel://\((self.busDetailData?.tell ?? "").replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 4 {
            //즐겨찾기
            
            if self.isFavorite {
                try! self.realm.write {
                    let result = self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "usid == %@", self.busDetailData?.busID as! CVarArg))
                    self.realm.delete(result)
                }
                
                self.home_bottom_menu_4.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_delete")!)
            }else{
                let favoriteData = FavoriteData()
                
                favoriteData.usid = self.busDetailData?.busID
                favoriteData.busNo = self.busDetailData?.busNo
                favoriteData.busName = self.busDetailData?.busName
                favoriteData.busAlllocation = self.busDetailData?.weekdayOffPeakAllocationTime
                favoriteData.displayDepot = self.depot
                favoriteData.areaCode = self.platform
                var terminalId = "P01"
                if terminalType == "T2" {
                    terminalId = "P03"
                }
                favoriteData.terminalId = terminalId
                
                favoriteData.category = "3"
                
                favoriteData.favoriteDate = CommonUtils.getTodayDate(format: "yyyyMMddkkmmss")
                
                try! self.realm.write {
                    self.realm.add(favoriteData, update: .modified)
                }
                
                self.home_bottom_menu_4.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_star")!)
            }
        
            self.isFavorite = !self.isFavorite
            
        }
    }
}
extension BusRouteDetailViewController {
    func getTransportationBusesForRoute(){
        Loading.show()
        
        var terminalId = "P01"
        if terminalType == "T2" {
            terminalId = "P03"
        }
        
        FirebaseUtils.setMenuAnalyticsEventContent(type: "S", name: "getBusDetailInfo")
        
        let apiUrl = ServerUtils.serverUrl + ServerUtils.transportationBusesForRoute + terminalId + "/" + busId
        
        Session.default.request(
            apiUrl,
            method: .get,
//            parameters:
//            [
//                "terminalId": terminalId
//            ],
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
                            let result = try? JSONDecoder().decode(BaseResult<BusDetailData>.self, from: dataJson)

                            self.busDetailData = result?.data as! BusDetailData
                                
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        if self.busDetailData?.busNo == nil || self.busDetailData?.busNo == "" {
                            self.busNo.text = "\(CommonUtils.getLocaleString(locale: self.busDetailData?.busName))"
                            self.busName = "\(CommonUtils.getLocaleString(locale: self.busDetailData?.busName))"
                        }else{
                            self.busNo.text = "\(self.busDetailData?.busNo ?? "")(\(CommonUtils.getLocaleString(locale: self.busDetailData?.busName)))"
                            self.busName = "\(self.busDetailData?.busNo ?? "")(\(CommonUtils.getLocaleString(locale: self.busDetailData?.busName)))"
                        }
                        
                        if self.platform == "S" {
                            self.platform_label.text = "bus_detail_region_1".localized
                        }else if self.platform == "G" {
                            self.platform_label.text = "bus_detail_region_2".localized
                        }else if self.platform == "I" {
                            self.platform_label.text = "bus_detail_region_3".localized
                        }else if self.platform == "N" {
                            self.platform_label.text = "bus_detail_region_4".localized
                        }else if self.platform == "C" {
                            self.platform_label.text = "bus_detail_region_5".localized
                        }else {
                            self.platform_label.text = ""
                        }
                            
                        self.bus_detail_depot_terminal.text = "flights_list_t1".localized
                        if self.terminalType == "T2" {
                            self.bus_detail_depot_terminal.text = "flights_list_t2".localized
                        }
                        
                        var temp = ""
                        var floor = ""
                        var i = 0
                        for depot in (self.busDetailData?.depots)! {
                            if depot.floor != floor {
                                floor = depot.floor ?? ""
                                
                                if floor.contains("F"){
                                    temp += "\(String((depot.floor?.reversed())!)) "
                                }else{
                                    temp += "\(depot.floor ?? "") "
                                }
                            }
                            
                            temp += "\(depot.name ?? "")\(depot.rideHome ?? "")"
                         
                            if (self.busDetailData?.depots?.count)! - 1 > i {
                                temp += ", "
                            }
                            
                            i += 1
                        }
                        
                        self.depot = temp
                        
                        self.bus_detail_depot_result.text = self.depot
                        
                        self.bus_detail_dest_result.text = CommonUtils.getLocaleString(locale: self.busDetailData?.busName)
                        
                        let adultFare: Int = (self.busDetailData?.rates![(self.busDetailData?.rates?.count)! - 1].adultFare)!
                        let adultFareString: String = String(adultFare)
                        let childFare: Int = (self.busDetailData?.rates![(self.busDetailData?.rates?.count)! - 1].childFare)!
                        let childFareString: String = String(childFare)
                        self.bus_detail_fare_result.text = "\("bus_detail_fare_adult".localized) \(adultFareString.convertToDecimalNumber)\("bus_detail_fare_unit".localized) / \("bus_detail_fare_child".localized) \(childFareString.convertToDecimalNumber)\("bus_detail_fare_unit".localized)"
                        
                        self.bus_detail_allocation_result.text = "\(self.busDetailData?.weekdayOffPeakAllocationTime ?? self.busDetailData?.weekdayOffPeakAllocationTime ?? "")"
                        self.bus_detail_company_result.text = CommonUtils.getLocaleString(locale: self.busDetailData?.companyName)
                        
                        if self.busDetailData?.tell == nil || self.busDetailData?.tell == "" || self.busDetailData?.tell == "000-000-0000" {
                            
                            self.bus_detail_link_4.snp.remakeConstraints { (make) in
                                make.top.equalTo(self.bus_detail_link_4_line_view.snp.bottom)
                                make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
                                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                                make.height.equalTo(0)
                            }
                            self.bus_detail_link_4.isHidden = true
                            self.bus_detail_link_4_line_view.isHidden = true
                        }
                        if self.busDetailData?.depots![0].poiId == nil || self.busDetailData?.depots![0].poiId == "" {
                            self.bus_detail_link_3.snp.remakeConstraints { (make) in
                                make.top.equalTo(self.bus_detail_link_3_line_view.snp.bottom)
                                make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
                                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                                make.height.equalTo(0)
                            }
                            self.bus_detail_link_3.isHidden = true
                            self.bus_detail_link_3_line_view.isHidden = true
                        }
                        
                        
                        let favoriteData =  self.realm.objects(FavoriteData.self).filter(NSPredicate(format: "usid == %@", self.busDetailData?.busID as! CVarArg))
                        if favoriteData.count > 0 {
                            self.isFavorite = true
                            self.home_bottom_menu_4.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_favorite_star")!)
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
