//
//  MaglevLineViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MaglevLineViewController: BaseViewController {
    
    var terminalType = "T1"

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: MaglevLineViewController.self))
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
    
    private let maglev_top_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let maglev_train_map : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "maglev_train_map")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let maglev_title: UILabel = {
        let label = UILabel()
        label.text = "maglev_title".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private var maglev_table_header_1: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_header_1".localized
        return label
    }()
    private var maglev_table_header_2: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_header_2".localized
        return label
    }()
    private var maglev_table_header_3: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_header_3".localized
        return label
    }()
    private var maglev_table_header_4: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_header_4".localized
        return label
    }()
    
    private var maglev_table_dest_1: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_dest_1".localized
        return label
    }()
    private var maglev_table_dest_2: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_dest_2".localized
        return label
    }()
    private var maglev_table_time_1: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_time_1".localized
        return label
    }()
    private var maglev_table_time_2: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_time_2".localized
        return label
    }()
    private var maglev_table_required_1: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_required_1".localized
        return label
    }()
    private var maglev_table_interval_1: UILabel = {
        let label = UILabel()
        label.text = "maglev_table_interval_1".localized
        return label
    }()

    private let maglev_table_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "maglev_table_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let maglev_train_route : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "maglev_train_route")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let maglev_table_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let maglev_table_link_1 : UILabel = {
        let label = UILabel()
        label.text = "maglev_table_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let maglev_table_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let maglev_table_link_2 : UILabel = {
        let label = UILabel()
        label.text = "maglev_table_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let maglev_table_link_2_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

}
extension MaglevLineViewController {
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
        
        self.contentsView.addSubview(self.maglev_top_line_view)
        self.maglev_top_line_view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.maglev_train_map.tag = 10
        self.maglev_train_map.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.maglev_train_map.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.maglev_train_map)
        self.maglev_train_map.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.size.equalTo(self.view.frame.width)
        }
        
        self.contentsView.addSubview(self.maglev_title)
        self.maglev_title.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_train_map.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.maglev_table_header_1 = self.makeHeaderCell(label: self.maglev_table_header_1)
        self.maglev_table_header_2 = self.makeHeaderCell(label: self.maglev_table_header_2)
        self.maglev_table_header_3 = self.makeHeaderCell(label: self.maglev_table_header_3)
        self.maglev_table_header_4 = self.makeHeaderCell(label: self.maglev_table_header_4)
        
        self.contentsView.addSubview(self.maglev_table_header_1)
        self.maglev_table_header_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.maglev_table_header_2)
        self.maglev_table_header_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.maglev_table_header_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.maglev_table_header_3)
        self.maglev_table_header_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.maglev_table_header_2.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        self.contentsView.addSubview(self.maglev_table_header_4)
        self.maglev_table_header_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_title.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(self.maglev_table_header_3.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableHeaderHeight)
        }
        
        self.maglev_table_dest_1 = self.makeCell(label: self.maglev_table_dest_1)
        self.maglev_table_dest_2 = self.makeCell(label: self.maglev_table_dest_2)
        self.maglev_table_time_1 = self.makeCell(label: self.maglev_table_time_1)
        self.maglev_table_time_2 = self.makeCell(label: self.maglev_table_time_2)
        self.maglev_table_required_1 = self.makeCell(label: self.maglev_table_required_1)
        self.maglev_table_interval_1 = self.makeCell(label: self.maglev_table_interval_1)
        
        self.contentsView.addSubview(self.maglev_table_dest_1)
        self.maglev_table_dest_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_header_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.maglev_table_dest_2)
        self.maglev_table_dest_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_dest_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) * 2 / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        self.contentsView.addSubview(self.maglev_table_time_1)
        self.maglev_table_time_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_header_1.snp.bottom)
            make.leading.equalTo(self.maglev_table_dest_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        self.contentsView.addSubview(self.maglev_table_time_2)
        self.maglev_table_time_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_time_1.snp.bottom)
            make.leading.equalTo(self.maglev_table_dest_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableBigHeight)
        }
        
        self.contentsView.addSubview(self.maglev_table_required_1)
        self.maglev_table_required_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_header_1.snp.bottom)
            make.leading.equalTo(self.maglev_table_time_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableBigHeight * 2)
        }
        self.contentsView.addSubview(self.maglev_table_interval_1)
        self.maglev_table_interval_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_header_1.snp.bottom)
            make.leading.equalTo(self.maglev_table_required_1.snp.trailing)
            make.width.equalTo((self.view.frame.width - SizeUtils.sideMargin * 2) / 5)
            make.height.equalTo(SizeUtils.tableBigHeight * 2)
        }
        
        self.contentsView.addSubview(self.maglev_table_desc_1)
        self.maglev_table_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_interval_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalTo(SizeUtils.sideMargin)
        }
        
        self.maglev_train_route.tag = 10
        self.maglev_train_route.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.maglev_train_route.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.maglev_train_route)
        self.maglev_train_route.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_desc_1.snp.bottom)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.width/2)
        }
        
        self.contentsView.addSubview(self.maglev_table_link_1_line_view)
        self.maglev_table_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_train_route.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.maglev_table_link_1.tag = 0
        self.maglev_table_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.maglev_table_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.maglev_table_link_1)
        self.maglev_table_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)

        }
        self.maglev_table_link_1.addImage(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin, image: UIImage(named: "icon_list_position")!)
        
        self.contentsView.addSubview(self.maglev_table_link_2_line_view)
        self.maglev_table_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.maglev_table_link_2.tag = 1
        self.maglev_table_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDetail(_:))))
        self.maglev_table_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.maglev_table_link_2)
        self.maglev_table_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)

        }
        self.maglev_table_link_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.maglev_table_link_2_end_line_view)
        self.maglev_table_link_2_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.maglev_table_link_2.snp.bottom)
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
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
}
extension MaglevLineViewController {
    @objc func moveDetail(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0{
            //TODO map
        }else if sender.view?.tag == 1{
            if let url = URL(string: "tel://\("maglev_table_link_call_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
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
