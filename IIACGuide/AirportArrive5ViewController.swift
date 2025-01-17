//
//  AirportArrive5ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/03.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportArrive5ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportArrive5ViewController.self))
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
    private let arrival_custom_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let arrival06_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrival06_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let arrival_custom_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let icon_type1_gun : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_gun")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_1".localized
        return label
    }()
    private let arrival_custom_section_desc_2_1_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_perfume : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_perfume")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_2".localized
        return label
    }()
    private let arrival_custom_section_desc_2_2_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_livestock : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_livestock")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_3 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_3".localized
        return label
    }()
    private let arrival_custom_section_desc_2_3_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_drug : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_drug")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_4 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_4".localized
        return label
    }()
    private let arrival_custom_section_desc_2_4_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_imitation : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_imitation")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_5 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_5".localized
        return label
    }()
    private let arrival_custom_section_desc_2_5_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_cash : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_cash")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_6 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_6".localized
        return label
    }()
    private let arrival_custom_section_desc_2_6_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_cites : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_cites")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_7 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_7".localized
        return label
    }()
    private let arrival_custom_section_desc_2_7_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_cd : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_cd")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_8 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_8".localized
        return label
    }()
    private let arrival_custom_section_desc_2_8_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_goods : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_goods")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_2_9 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_2_9".localized
        return label
    }()
    private let arrival_custom_section_desc_2_9_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let arrival_custom_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let arrival_custom_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "arrival_custom_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "arrival_custom_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let icon_type1_liquor : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_liquor")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_3_2_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_2_col_1_1".localized
        return label
    }()
    private let arrival_custom_section_desc_3_2_col_1_1_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let icon_type1_cigarette : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_cigarette")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_3_2_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_2_col_1_2".localized
        return label
    }()
    private let arrival_custom_section_desc_3_2_col_1_2_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()

    private let icon_type1_perfume_2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_type1_perfume")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var arrival_custom_section_desc_3_2_col_1_3 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_2_col_1_3".localized
        return label
    }()
    private let arrival_custom_section_desc_3_2_col_1_3_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private var arrival_custom_section_desc_3_2_col_1_4 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_2_col_1_4".localized
        return label
    }()
    
    private let arrival_custom_section_desc_3_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "arrival_custom_section_desc_3_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_1 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_2 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_3 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_4 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_5 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_5".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_6 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_6".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let arrival_custom_section_desc_3_3_7 : UILabel = {
        let label = UILabel()
        label.text = "arrival_custom_section_desc_3_3_7".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    private let arrival_custom_section_link_1_start_line_view : UIView = {
         let view = UIView()
         view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
         view.sizeToFit()
         return view
     }()
     private let arrival_custom_section_link_1 : UILabel = {
         let label = UILabel()
         label.text = "arrival_custom_section_link_1".localized
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
         return label
     }()
     
     private let arrival_custom_section_link_1_line_view : UIView = {
         let view = UIView()
         view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
         view.sizeToFit()
         return view
     }()

}
extension AirportArrive5ViewController {
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
        
        self.contentsView.addSubview(self.arrival_custom_section_title_1)
        self.arrival_custom_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival06_img01)
        self.arrival06_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_title_1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.6)
        }
        self.contentsView.addSubview(self.arrival_custom_section_title_2)
        self.arrival_custom_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival06_img01.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        let cellWidth = (self.view.frame.width - SizeUtils.sideMargin * 2) / 5
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_1_view)
        self.arrival_custom_section_desc_2_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        
        self.arrival_custom_section_desc_2_1 = self.makeCell(label: self.arrival_custom_section_desc_2_1)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_1)
        self.arrival_custom_section_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_1_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_1_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_1_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_1_view.addSubview(self.icon_type1_gun)
        self.icon_type1_gun.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_2_view)
        self.arrival_custom_section_desc_2_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_1_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_2 = self.makeCell(label: self.arrival_custom_section_desc_2_2)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_2)
        self.arrival_custom_section_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_2_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_2_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_2_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_2_view.addSubview(self.icon_type1_perfume)
        self.icon_type1_perfume.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_3_view)
        self.arrival_custom_section_desc_2_3_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_2_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_3 = self.makeCell(label: self.arrival_custom_section_desc_2_3)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_3)
        self.arrival_custom_section_desc_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_3_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_3_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_3_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_3_view.addSubview(self.icon_type1_livestock)
        self.icon_type1_livestock.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_4_view)
        self.arrival_custom_section_desc_2_4_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_3_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_4 = self.makeCell(label: self.arrival_custom_section_desc_2_4)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_4)
        self.arrival_custom_section_desc_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_4_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_4_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_4_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_4_view.addSubview(self.icon_type1_drug)
        self.icon_type1_drug.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_5_view)
        self.arrival_custom_section_desc_2_5_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_4_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_5 = self.makeCell(label: self.arrival_custom_section_desc_2_5)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_5)
        self.arrival_custom_section_desc_2_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_5_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_5_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_5_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_5_view.addSubview(self.icon_type1_imitation)
        self.icon_type1_imitation.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_6_view)
        self.arrival_custom_section_desc_2_6_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_5_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_6 = self.makeCell(label: self.arrival_custom_section_desc_2_6)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_6)
        self.arrival_custom_section_desc_2_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_6_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_6_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_6_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_6_view.addSubview(self.icon_type1_cash)
        self.icon_type1_cash.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_7_view)
        self.arrival_custom_section_desc_2_7_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_6_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_7 = self.makeCell(label: self.arrival_custom_section_desc_2_7)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_7)
        self.arrival_custom_section_desc_2_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_7_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_7_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_7_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_7_view.addSubview(self.icon_type1_cites)
        self.icon_type1_cites.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_8_view)
        self.arrival_custom_section_desc_2_8_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_7_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_8 = self.makeCell(label: self.arrival_custom_section_desc_2_8)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_8)
        self.arrival_custom_section_desc_2_8.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_8_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_8_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_8_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_8_view.addSubview(self.icon_type1_cd)
        self.icon_type1_cd.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_9_view)
        self.arrival_custom_section_desc_2_9_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_8_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_2_9 = self.makeCell(label: self.arrival_custom_section_desc_2_9)
        self.contentsView.addSubview(self.arrival_custom_section_desc_2_9)
        self.arrival_custom_section_desc_2_9.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_9_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_2_9_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_2_9_view.snp.bottom)
        }
        self.arrival_custom_section_desc_2_9_view.addSubview(self.icon_type1_goods)
        self.icon_type1_goods.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_title_3)
        self.arrival_custom_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_2_9_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_1)
        self.arrival_custom_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2)
        self.arrival_custom_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_1_view)
        self.arrival_custom_section_desc_3_2_col_1_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_3_2_col_1_1 = self.makeCell(label: self.arrival_custom_section_desc_3_2_col_1_1)
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_1)
        self.arrival_custom_section_desc_3_2_col_1_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_1_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_3_2_col_1_1_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_3_2_col_1_1_view.snp.bottom)
        }
        self.arrival_custom_section_desc_3_2_col_1_1_view.addSubview(self.icon_type1_liquor)
        self.icon_type1_liquor.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_2_view)
        self.arrival_custom_section_desc_3_2_col_1_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_1_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_3_2_col_1_2 = self.makeCell(label: self.arrival_custom_section_desc_3_2_col_1_2)
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_2)
        self.arrival_custom_section_desc_3_2_col_1_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_2_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_3_2_col_1_2_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_3_2_col_1_2_view.snp.bottom)
        }
        self.arrival_custom_section_desc_3_2_col_1_2_view.addSubview(self.icon_type1_cigarette)
        self.icon_type1_cigarette.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }

        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_3_view)
        self.arrival_custom_section_desc_3_2_col_1_3_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_2_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.size.equalTo(cellWidth)
        }
        self.arrival_custom_section_desc_3_2_col_1_3 = self.makeCell(label: self.arrival_custom_section_desc_3_2_col_1_3)
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_3)
        self.arrival_custom_section_desc_3_2_col_1_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_3_view.snp.top)
            make.leading.equalTo(self.arrival_custom_section_desc_3_2_col_1_3_view.snp.trailing)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.bottom.equalTo(self.arrival_custom_section_desc_3_2_col_1_3_view.snp.bottom)
        }
        self.arrival_custom_section_desc_3_2_col_1_3_view.addSubview(self.icon_type1_perfume_2)
        self.icon_type1_perfume_2.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSize)
        }

        self.arrival_custom_section_desc_3_2_col_1_4 = self.makeCell(label: self.arrival_custom_section_desc_3_2_col_1_4)
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_2_col_1_4)
        self.arrival_custom_section_desc_3_2_col_1_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_3_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(cellWidth)
        }
        
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3)
        self.arrival_custom_section_desc_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_2_col_1_4.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_1)
        self.arrival_custom_section_desc_3_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_2)
        self.arrival_custom_section_desc_3_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_3)
        self.arrival_custom_section_desc_3_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_4)
        self.arrival_custom_section_desc_3_3_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_5)
        self.arrival_custom_section_desc_3_3_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_6)
        self.arrival_custom_section_desc_3_3_6.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_5.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.arrival_custom_section_desc_3_3_7)
        self.arrival_custom_section_desc_3_3_7.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_6.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        
        self.arrival_custom_section_link_1.isUserInteractionEnabled = true
        self.arrival_custom_section_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapArrive5(_:))))
        
        self.contentsView.addSubview(self.arrival_custom_section_link_1_start_line_view)
        self.arrival_custom_section_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_desc_3_3_7.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }

        self.contentsView.addSubview(self.arrival_custom_section_link_1)
        self.arrival_custom_section_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.arrival_custom_section_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.arrival_custom_section_link_1_line_view)
        self.arrival_custom_section_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.arrival_custom_section_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
        
    }
    func makeCell(label:UILabel) -> UILabel{
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
}
extension AirportArrive5ViewController{
    @objc func tapArrive5(_ sender:UITapGestureRecognizer){
        self.openShopping(paramType: "immigration")
    }
}
