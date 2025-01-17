//
//  BusViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/08.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class BusViewController: BaseViewController {

    var terminalType = "T1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: BusViewController.self))
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
    
    private let bus_title_1 : UILabel = {
        let label = UILabel()
        label.text = "bus_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.sizeToFit()
        return label
    }()
    
    private let bus_map_t1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bus_map_t1")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let bus_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_link_1 : UILabel = {
        let label = UILabel()
        label.text = "bus_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_link_2 : UILabel = {
        let label = UILabel()
        label.text = "bus_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_link_3 : UILabel = {
        let label = UILabel()
        label.text = "bus_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_link_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_link_4 : UILabel = {
        let label = UILabel()
        label.text = "bus_link_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_link_5_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_link_5 : UILabel = {
        let label = UILabel()
        label.text = "bus_link_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_link_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let bus_link_6_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let bus_link_6 : UILabel = {
        let label = UILabel()
        label.text = "bus_link_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let bus_link_6_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

}
extension BusViewController {
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
        self.contentsView.addSubview(self.bus_title_1)
        self.bus_title_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.top_h_line_view.snp.bottom).offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.topMargin)
        }
        
        self.bus_map_t1.tag = 10
        self.bus_map_t1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_map_t1.isUserInteractionEnabled = true
        if self.terminalType == "T2" {
            self.bus_map_t1.image = UIImage(named: "bus_map_t2")
        }
        self.contentsView.addSubview(self.bus_map_t1)
        self.bus_map_t1.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.width.height.equalTo(self.view.frame.width)
        }
        
        self.contentsView.addSubview(self.bus_link_1_line_view)
        self.bus_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_map_t1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.bus_link_1.tag = 0
        self.bus_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_link_1)
        self.bus_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_link_2_line_view)
        self.bus_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_link_2.tag = 1
        self.bus_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_link_2)
        self.bus_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_link_3_line_view)
        self.bus_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_link_3.tag = 2
        self.bus_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_link_3)
        self.bus_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_link_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_link_4_line_view)
        self.bus_link_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_link_4.tag = 3
        self.bus_link_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_link_4.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_link_4)
        self.bus_link_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_link_4.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_link_5_line_view)
        self.bus_link_5_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_link_5.tag = 4
        self.bus_link_5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_link_5.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_link_5)
        self.bus_link_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_5_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_link_5.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_link_end_line_view)
        self.bus_link_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.bus_link_6_line_view)
        self.bus_link_6_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_5.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.bus_link_6.tag = 5
        self.bus_link_6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveBusDetail(_:))))
        self.bus_link_6.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.bus_link_6)
        self.bus_link_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_6_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.bus_link_6.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.bus_link_6_end_line_view)
        self.bus_link_6_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.bus_link_6.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
            
        }
    }
}
extension BusViewController {
    @objc func moveBusDetail(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //서울방면
            let busDetailVC = BusDetailViewController()
            busDetailVC.terminalType = self.terminalType
            busDetailVC.platform = "S"
            self.navigationController?.pushViewController(busDetailVC, animated: true)
        }else if sender.view?.tag == 1 {
            //경기방면
            let busDetailVC = BusDetailViewController()
            busDetailVC.terminalType = self.terminalType
            busDetailVC.platform = "G"
            self.navigationController?.pushViewController(busDetailVC, animated: true)
        }else if sender.view?.tag == 2 {
            //인천방면
            let busDetailVC = BusDetailViewController()
            busDetailVC.terminalType = self.terminalType
            busDetailVC.platform = "I"
            self.navigationController?.pushViewController(busDetailVC, animated: true)
        }else if sender.view?.tag == 3 {
            //심야버스
            let busDetailVC = BusDetailViewController()
            busDetailVC.terminalType = self.terminalType
            busDetailVC.platform = "N"
            self.navigationController?.pushViewController(busDetailVC, animated: true)
        }else if sender.view?.tag == 4 {
            //지방행
            let busDetailVC = BusDetailViewController()
            busDetailVC.terminalType = self.terminalType
            busDetailVC.platform = "C"
            self.navigationController?.pushViewController(busDetailVC, animated: true)
        }else if sender.view?.tag == 5 {
            //버스예약
            if let url = URL(string: "itms-apps://itunes.apple.com/app/id933107825"),
                UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    
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
