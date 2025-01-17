//
//  TspViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class TspViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: TspViewController.self))
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
    
    private let tsp_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let tsp_section_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let tsp_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let tsp_section_desc_2 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_desc_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let tsp_section_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let tsp_section_title_4: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_4_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_4_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_4_2 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_4_3 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_4_4 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_4_5 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_5_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_4_6 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_6_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_4_7 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_4_7".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_4_7_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_title_5: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_5".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_5_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_5_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_5_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_5_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_title_6: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_6".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()

    
    private let tsp_section_link_6_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_6_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_6_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_6_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_6_2 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_6_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_6_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_6_3 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_6_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_6_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_6_4 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_6_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_6_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_title_7: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_7".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_7_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_7_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_7_2 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_7_3 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_7_4 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_7_5 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_5_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_7_6 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_6_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_7_7 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_7_7".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_7_7_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    private let tsp_section_title_8: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_8".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_8_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_8_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_8_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_8_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_8_2 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_8_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_8_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_8_3 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_8_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_8_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_8_4 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_8_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_8_4_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_8_5 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_8_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_8_5_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    private let tsp_section_title_9: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_9".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_9_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_9_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_9_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_9_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_link_9_2 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_9_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_9_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

    private let tsp_section_title_10: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_10".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_10_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_10_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_10_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_10_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let tsp_section_title_11: UILabel = {
        let label = UILabel()
        label.text = "tsp_section_title_11".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let tsp_section_link_11_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let tsp_section_link_11_1 : UILabel = {
        let label = UILabel()
        label.text = "tsp_section_link_11_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    private let tsp_section_link_11_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()

}
extension TspViewController{
    func initUi(){
        self.setNavigationItemTitle(title: "slide_staff_sub_menu_3".localized)
        self.navigationItem.rightBarButtonItem = self.getBarButtonAllSearch()
        
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
        
        self.contentsView.addSubview(self.tsp_section_title_1)
        self.tsp_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.tsp_section_desc_1)
        self.tsp_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.tsp_section_title_2)
        self.tsp_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.tsp_section_desc_2)
        self.tsp_section_desc_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.tsp_section_title_3)
        self.tsp_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_desc_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.tsp_section_desc_3)
        self.tsp_section_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.tsp_section_title_4)
        self.tsp_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_desc_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.tsp_section_link_4_1.tag = 0
        self.tsp_section_link_4_1.isUserInteractionEnabled = true
        self.tsp_section_link_4_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))
        
        self.contentsView.addSubview(self.tsp_section_link_4_1_start_line_view)
        self.tsp_section_link_4_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_4_1)
        self.tsp_section_link_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_1_line_view)
        self.tsp_section_link_4_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_4_2.tag = 1
        self.tsp_section_link_4_2.isUserInteractionEnabled = true
        self.tsp_section_link_4_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))

        self.contentsView.addSubview(self.tsp_section_link_4_2)
        self.tsp_section_link_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_2_line_view)
        self.tsp_section_link_4_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_4_3.tag = 2
        self.tsp_section_link_4_3.isUserInteractionEnabled = true
        self.tsp_section_link_4_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))

        self.contentsView.addSubview(self.tsp_section_link_4_3)
        self.tsp_section_link_4_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_3_line_view)
        self.tsp_section_link_4_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_4_4.tag = 3
        self.tsp_section_link_4_4.isUserInteractionEnabled = true
        self.tsp_section_link_4_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))

        self.contentsView.addSubview(self.tsp_section_link_4_4)
        self.tsp_section_link_4_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_4_line_view)
        self.tsp_section_link_4_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_4_5.tag = 4
        self.tsp_section_link_4_5.isUserInteractionEnabled = true
        self.tsp_section_link_4_5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))

        self.contentsView.addSubview(self.tsp_section_link_4_5)
        self.tsp_section_link_4_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_5.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_5_line_view)
        self.tsp_section_link_4_5_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_4_6.tag = 5
        self.tsp_section_link_4_6.isUserInteractionEnabled = true
        self.tsp_section_link_4_6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))

        self.contentsView.addSubview(self.tsp_section_link_4_6)
        self.tsp_section_link_4_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_5_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_6.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_6_line_view)
        self.tsp_section_link_4_6_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_6.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_4_7.tag = 6
        self.tsp_section_link_4_7.isUserInteractionEnabled = true
        self.tsp_section_link_4_7.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))

        self.contentsView.addSubview(self.tsp_section_link_4_7)
        self.tsp_section_link_4_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_6_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_4_7.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_4_7_line_view)
        self.tsp_section_link_4_7_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_7.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.tsp_section_title_5)
        self.tsp_section_title_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_4_7_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.tsp_section_link_5_1.tag = 7
        self.tsp_section_link_5_1.isUserInteractionEnabled = true
        self.tsp_section_link_5_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp(_:))))
        
        self.contentsView.addSubview(self.tsp_section_link_5_1_start_line_view)
        self.tsp_section_link_5_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_5.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_5_1)
        self.tsp_section_link_5_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_5_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_5_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_5_1_line_view)
        self.tsp_section_link_5_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_5_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.tsp_section_title_6)
        self.tsp_section_title_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_5_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.tsp_section_link_6_1.tag = 0
        self.tsp_section_link_6_1.isUserInteractionEnabled = true
        self.tsp_section_link_6_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp2(_:))))
        
        self.contentsView.addSubview(self.tsp_section_link_6_1_start_line_view)
        self.tsp_section_link_6_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_6.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_6_1)
        self.tsp_section_link_6_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_6_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_6_1_line_view)
        self.tsp_section_link_6_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_6_2.tag = 1
        self.tsp_section_link_6_2.isUserInteractionEnabled = true
        self.tsp_section_link_6_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp2(_:))))

        self.contentsView.addSubview(self.tsp_section_link_6_2)
        self.tsp_section_link_6_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_6_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_6_2_line_view)
        self.tsp_section_link_6_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_6_3.tag = 2
        self.tsp_section_link_6_3.isUserInteractionEnabled = true
        self.tsp_section_link_6_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp2(_:))))

        self.contentsView.addSubview(self.tsp_section_link_6_3)
        self.tsp_section_link_6_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_6_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_6_3_line_view)
        self.tsp_section_link_6_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.tsp_section_link_6_4.tag = 3
        self.tsp_section_link_6_4.isUserInteractionEnabled = true
        self.tsp_section_link_6_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp2(_:))))

        self.contentsView.addSubview(self.tsp_section_link_6_4)
        self.tsp_section_link_6_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_6_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.tsp_section_link_6_4_line_view)
        self.tsp_section_link_6_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.tsp_section_title_7)
        self.tsp_section_title_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_6_4_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.tsp_section_link_7_1.tag = 0
        self.tsp_section_link_7_1.isUserInteractionEnabled = true
        self.tsp_section_link_7_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_1_start_line_view)
        self.tsp_section_link_7_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_7.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_7_1)
        self.tsp_section_link_7_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_1_line_view)
        self.tsp_section_link_7_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_7_2.tag = 1
        self.tsp_section_link_7_2.isUserInteractionEnabled = true
        self.tsp_section_link_7_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_2)
        self.tsp_section_link_7_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_2_line_view)
        self.tsp_section_link_7_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_7_3.tag = 2
        self.tsp_section_link_7_3.isUserInteractionEnabled = true
        self.tsp_section_link_7_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_3)
        self.tsp_section_link_7_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_3_line_view)
        self.tsp_section_link_7_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_7_4.tag = 3
        self.tsp_section_link_7_4.isUserInteractionEnabled = true
        self.tsp_section_link_7_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_4)
        self.tsp_section_link_7_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_4_line_view)
        self.tsp_section_link_7_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_7_5.tag = 4
        self.tsp_section_link_7_5.isUserInteractionEnabled = true
        self.tsp_section_link_7_5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_5)
        self.tsp_section_link_7_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_5.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_5_line_view)
        self.tsp_section_link_7_5_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_7_6.tag = 5
        self.tsp_section_link_7_6.isUserInteractionEnabled = true
        self.tsp_section_link_7_6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_6)
        self.tsp_section_link_7_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_5_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_6.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_6_line_view)
        self.tsp_section_link_7_6_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_6.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_7_7.tag = 6
        self.tsp_section_link_7_7.isUserInteractionEnabled = true
        self.tsp_section_link_7_7.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp3(_:))))

        self.contentsView.addSubview(self.tsp_section_link_7_7)
        self.tsp_section_link_7_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_6_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_7_7.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_7_7_line_view)
        self.tsp_section_link_7_7_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_7.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_title_8)
        self.tsp_section_title_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_7_7_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.tsp_section_link_8_1.tag = 0
        self.tsp_section_link_8_1.isUserInteractionEnabled = true
        self.tsp_section_link_8_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp4(_:))))

        self.contentsView.addSubview(self.tsp_section_link_8_1_start_line_view)
        self.tsp_section_link_8_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_8.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_8_1)
        self.tsp_section_link_8_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_8_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_8_1_line_view)
        self.tsp_section_link_8_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_8_2.tag = 1
        self.tsp_section_link_8_2.isUserInteractionEnabled = true
        self.tsp_section_link_8_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp4(_:))))

        self.contentsView.addSubview(self.tsp_section_link_8_2)
        self.tsp_section_link_8_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_8_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_8_2_line_view)
        self.tsp_section_link_8_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_8_3.tag = 2
        self.tsp_section_link_8_3.isUserInteractionEnabled = true
        self.tsp_section_link_8_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp4(_:))))

        self.contentsView.addSubview(self.tsp_section_link_8_3)
        self.tsp_section_link_8_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_8_3.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_8_3_line_view)
        self.tsp_section_link_8_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_8_4.tag = 3
        self.tsp_section_link_8_4.isUserInteractionEnabled = true
        self.tsp_section_link_8_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp4(_:))))

        self.contentsView.addSubview(self.tsp_section_link_8_4)
        self.tsp_section_link_8_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_3_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_8_4.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_8_4_line_view)
        self.tsp_section_link_8_4_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_4.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_8_5.tag = 4
        self.tsp_section_link_8_5.isUserInteractionEnabled = true
        self.tsp_section_link_8_5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp4(_:))))

        self.contentsView.addSubview(self.tsp_section_link_8_5)
        self.tsp_section_link_8_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_4_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_8_5.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_8_5_line_view)
        self.tsp_section_link_8_5_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_5.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        self.contentsView.addSubview(self.tsp_section_title_9)
        self.tsp_section_title_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_8_5_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.tsp_section_link_9_1.tag = 0
        self.tsp_section_link_9_1.isUserInteractionEnabled = true
        self.tsp_section_link_9_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp5(_:))))

        self.contentsView.addSubview(self.tsp_section_link_9_1_start_line_view)
        self.tsp_section_link_9_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_9.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_9_1)
        self.tsp_section_link_9_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_9_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_9_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_9_1_line_view)
        self.tsp_section_link_9_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_9_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.tsp_section_link_9_2.tag = 1
        self.tsp_section_link_9_2.isUserInteractionEnabled = true
        self.tsp_section_link_9_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp5(_:))))

        self.contentsView.addSubview(self.tsp_section_link_9_2)
        self.tsp_section_link_9_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_9_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_9_2.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_9_2_line_view)
        self.tsp_section_link_9_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_9_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.tsp_section_title_10)
        self.tsp_section_title_10.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_9_2_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.tsp_section_link_10_1.tag = 0
        self.tsp_section_link_10_1.isUserInteractionEnabled = true
        self.tsp_section_link_10_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp6(_:))))

        self.contentsView.addSubview(self.tsp_section_link_10_1_start_line_view)
        self.tsp_section_link_10_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_10.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_10_1)
        self.tsp_section_link_10_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_10_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_10_1.addCall(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_10_1_line_view)
        self.tsp_section_link_10_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_10_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.tsp_section_title_11)
        self.tsp_section_title_11.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_10_1_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.tsp_section_link_11_1.tag = 0
        self.tsp_section_link_11_1.isUserInteractionEnabled = true
        self.tsp_section_link_11_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTsp7(_:))))

        self.contentsView.addSubview(self.tsp_section_link_11_1_start_line_view)
        self.tsp_section_link_11_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_title_11.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.tsp_section_link_11_1)
        self.tsp_section_link_11_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_11_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.tsp_section_link_11_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)

        self.contentsView.addSubview(self.tsp_section_link_11_1_line_view)
        self.tsp_section_link_11_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.tsp_section_link_11_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }

    }
}
extension TspViewController{
    @objc func tapTsp(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_4".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 4 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_5".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 5 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_6".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 6 {
            if let url = URL(string: "tel://\("tsp_section_link_call_4_7".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 7 {
            if let url = URL(string: "tel://\("tsp_section_link_call_5_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }

    }
    @objc func tapTsp2(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("tsp_section_link_call_6_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("tsp_section_link_call_6_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("tsp_section_link_call_6_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("tsp_section_link_call_6_4".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    @objc func tapTsp3(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_4".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 4 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_5".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 5 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_6".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 6 {
            if let url = URL(string: "tel://\("tsp_section_link_call_7_7".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }

    }
    
    @objc func tapTsp4(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("tsp_section_link_call_8_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("tsp_section_link_call_8_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 2 {
            if let url = URL(string: "tel://\("tsp_section_link_call_8_3".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 3 {
            if let url = URL(string: "tel://\("tsp_section_link_call_8_4".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 4 {
            if let url = URL(string: "tel://\("tsp_section_link_call_8_5".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    @objc func tapTsp5(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("tsp_section_link_call_9_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else if sender.view?.tag == 1 {
            if let url = URL(string: "tel://\("tsp_section_link_call_9_2".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    @objc func tapTsp6(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            if let url = URL(string: "tel://\("tsp_section_link_call_10_1".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    @objc func tapTsp7(_ sender: UITapGestureRecognizer) {
        self.openWebView(title: "slide_staff_sub_menu_3".localized, url: ServerUtils.URL_TSP)
    }
}
