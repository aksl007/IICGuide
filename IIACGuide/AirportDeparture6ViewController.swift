//
//  AirportDeparture6ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDeparture6ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDeparture6ViewController.self))
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
    private let departure_security_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_security_section_title_2: UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_title_2".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_2_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_2_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure06_title01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_title01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private let departure_security_section_desc_table_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private var departure_security_section_desc_2_1_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_1_1".localized
        return label
    }()
    private var departure_security_section_desc_2_1_col_2_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_2_1".localized
        return label
    }()
    private var departure_security_section_desc_2_1_col_3_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_3_1".localized
        return label
    }()
    
    private let departure_security_section_desc_2_1_col_1_2_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_1_col_2_2_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_1_col_3_2_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let departure_security_section_desc_2_1_col_1_3_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_1_col_2_3_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_1_col_3_3_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let departure_security_section_desc_2_1_col_1_4_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_1_col_2_4_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_1_col_3_4_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let departure06_icon01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()

    private let departure06_icon04 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon04")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_2_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_2_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure06_icon07 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon07")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_3_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_3_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure06_icon02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_1_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_1_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()

    private let departure06_icon05 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon05")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private var departure_security_section_desc_2_1_col_2_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_2_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure06_icon08 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon08")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_3_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_3_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure06_icon03 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon03")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_1_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_1_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()

    private let departure06_icon06 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon06")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private var departure_security_section_desc_2_1_col_2_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_2_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure06_icon09 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon09")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_1_col_3_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_1_col_3_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure_security_section_desc_2_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_2_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure06_title02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_title02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private let departure_security_section_desc_2_table_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    private var departure_security_section_desc_2_2_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_2_col_1_1".localized
        return label
    }()
    
    private let departure_security_section_desc_2_2_col_1_2_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_2_col_1_3_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_2_col_1_4_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let departure06_icon10 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon10")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_2_col_1_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_2_col_1_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()

    private let departure06_icon11 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon11")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()

    private var departure_security_section_desc_2_2_col_1_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_2_col_1_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
    
    private let departure06_icon12 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_icon12")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_2_col_1_4 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_2_col_1_4".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()

    private let departure_security_section_desc_2_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_2_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_security_section_desc_2_3_col_1_1_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_3_col_2_1_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    private let departure_security_section_desc_2_3_col_3_1_view : UIView = {
        let view = UIView()
        view.layer.borderColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine).cgColor
        view.layer.borderWidth = 0.5
        view.sizeToFit()
        return view
    }()
    
    private let departure06_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_3_col_1_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_3_col_1_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure06_img02 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_img02")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_3_col_2_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_3_col_2_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure06_img03 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure06_img03")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    private var departure_security_section_desc_2_3_col_3_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_desc_2_3_col_3_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_security_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_3_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_3_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_3_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_3_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_3_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_3_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let departure_security_section_title_4: UILabel = {
        let label = UILabel()
        label.text = "departure_security_section_title_4".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_4_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_4_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_security_section_desc_4_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want
        
        let mutString = NSAttributedString(
            string: "departure_security_section_desc_4_2".localized.getDescription,
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
extension AirportDeparture6ViewController {
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
        
        self.contentsView.addSubview(self.departure_security_section_title_1)
        self.departure_security_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_security_section_desc_1)
        self.departure_security_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_security_section_title_2)
        self.departure_security_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_2_1)
        self.departure_security_section_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure06_title01)
        self.departure06_title01.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.departure_security_section_desc_2_1)
            make.leading.equalTo(self.departure_security_section_desc_2_1.snp.trailing).offset(SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }
        
        self.contentsView.addSubview(self.departure_security_section_desc_table_view)
        self.departure_security_section_desc_table_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        let cellWidth = (self.view.frame.width - SizeUtils.sideMargin * 2) / 4
        
        self.departure_security_section_desc_2_1_col_1_1 = self.makeCell(label: self.departure_security_section_desc_2_1_col_1_1)
        self.departure_security_section_desc_2_1_col_2_1 = self.makeCell(label: self.departure_security_section_desc_2_1_col_2_1)
        self.departure_security_section_desc_2_1_col_3_1 = self.makeCell(label: self.departure_security_section_desc_2_1_col_3_1)

        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_1_1)
        self.departure_security_section_desc_2_1_col_1_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_2_1)
        self.departure_security_section_desc_2_1_col_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_1_1.snp.bottom)
            make.leading.equalToSuperview()
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_3_1)
        self.departure_security_section_desc_2_1_col_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_2_1.snp.bottom)
            make.leading.equalToSuperview()
            make.size.equalTo(cellWidth)
            
            make.bottom.equalToSuperview()
        }
        
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_1_2_view)
        self.departure_security_section_desc_2_1_col_1_2_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_1.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_2_2_view)
        self.departure_security_section_desc_2_1_col_2_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_1_2_view.snp.bottom)
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_1.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_3_2_view)
        self.departure_security_section_desc_2_1_col_3_2_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_2_2_view.snp.bottom)
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_1.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        
        self.departure_security_section_desc_2_1_col_1_2_view.addSubview(self.departure06_icon01)
        self.departure06_icon01.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_1_2_view.addSubview(self.departure_security_section_desc_2_1_col_1_2)
        self.departure_security_section_desc_2_1_col_1_2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }
        
        self.departure_security_section_desc_2_1_col_2_2_view.addSubview(self.departure06_icon04)
        self.departure06_icon04.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_2_2_view.addSubview(self.departure_security_section_desc_2_1_col_2_2)
        self.departure_security_section_desc_2_1_col_2_2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        self.departure_security_section_desc_2_1_col_3_2_view.addSubview(self.departure06_icon07)
        self.departure06_icon07.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_3_2_view.addSubview(self.departure_security_section_desc_2_1_col_3_2)
        self.departure_security_section_desc_2_1_col_3_2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_1_3_view)
        self.departure_security_section_desc_2_1_col_1_3_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_2_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_2_3_view)
        self.departure_security_section_desc_2_1_col_2_3_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_1_3_view.snp.bottom)
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_2_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_3_3_view)
        self.departure_security_section_desc_2_1_col_3_3_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_2_3_view.snp.bottom)
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_2_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        
        self.departure_security_section_desc_2_1_col_1_3_view.addSubview(self.departure06_icon02)
        self.departure06_icon02.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_1_3_view.addSubview(self.departure_security_section_desc_2_1_col_1_3)
        self.departure_security_section_desc_2_1_col_1_3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }
        
        self.departure_security_section_desc_2_1_col_2_3_view.addSubview(self.departure06_icon05)
        self.departure06_icon05.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_2_3_view.addSubview(self.departure_security_section_desc_2_1_col_2_3)
        self.departure_security_section_desc_2_1_col_2_3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        self.departure_security_section_desc_2_1_col_3_3_view.addSubview(self.departure06_icon08)
        self.departure06_icon08.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_3_3_view.addSubview(self.departure_security_section_desc_2_1_col_3_3)
        self.departure_security_section_desc_2_1_col_3_3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }
        
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_1_4_view)
        self.departure_security_section_desc_2_1_col_1_4_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_3_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_2_4_view)
        self.departure_security_section_desc_2_1_col_2_4_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_1_4_view.snp.bottom)
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_3_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_table_view.addSubview(self.departure_security_section_desc_2_1_col_3_4_view)
        self.departure_security_section_desc_2_1_col_3_4_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_1_col_2_4_view.snp.bottom)
            make.leading.equalTo(self.departure_security_section_desc_2_1_col_1_3_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        
        self.departure_security_section_desc_2_1_col_1_4_view.addSubview(self.departure06_icon03)
        self.departure06_icon03.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_1_4_view.addSubview(self.departure_security_section_desc_2_1_col_1_4)
        self.departure_security_section_desc_2_1_col_1_4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }
        
        self.departure_security_section_desc_2_1_col_2_4_view.addSubview(self.departure06_icon06)
        self.departure06_icon06.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_2_4_view.addSubview(self.departure_security_section_desc_2_1_col_2_4)
        self.departure_security_section_desc_2_1_col_2_4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        self.departure_security_section_desc_2_1_col_3_4_view.addSubview(self.departure06_icon09)
        self.departure06_icon09.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_1_col_3_4_view.addSubview(self.departure_security_section_desc_2_1_col_3_4)
        self.departure_security_section_desc_2_1_col_3_4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        self.contentsView.addSubview(self.departure_security_section_desc_2_2)
        self.departure_security_section_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_table_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure06_title02)
        self.departure06_title02.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.departure_security_section_desc_2_2)
            make.leading.equalTo(self.departure_security_section_desc_2_2.snp.trailing).offset(SizeUtils.contentsMargin)
            make.size.equalTo(SizeUtils.iconSizeVerySmall)
        }

        self.contentsView.addSubview(self.departure_security_section_desc_2_table_view)
        self.departure_security_section_desc_2_table_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.departure_security_section_desc_2_2_col_1_1 = self.makeCell(label: self.departure_security_section_desc_2_2_col_1_1)
        self.departure_security_section_desc_2_table_view.addSubview(self.departure_security_section_desc_2_2_col_1_1)
        self.departure_security_section_desc_2_2_col_1_1.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview()
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_2_table_view.addSubview(self.departure_security_section_desc_2_2_col_1_2_view)
        self.departure_security_section_desc_2_2_col_1_2_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_security_section_desc_2_2_col_1_1.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_2_table_view.addSubview(self.departure_security_section_desc_2_2_col_1_3_view)
        self.departure_security_section_desc_2_2_col_1_3_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_security_section_desc_2_2_col_1_2_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        self.departure_security_section_desc_2_table_view.addSubview(self.departure_security_section_desc_2_2_col_1_4_view)
        self.departure_security_section_desc_2_2_col_1_4_view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(self.departure_security_section_desc_2_2_col_1_3_view.snp.trailing)
            make.size.equalTo(cellWidth)
        }
        
        self.departure_security_section_desc_2_2_col_1_2_view.addSubview(self.departure06_icon10)
        self.departure06_icon10.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_2_col_1_2_view.addSubview(self.departure_security_section_desc_2_2_col_1_2)
        self.departure_security_section_desc_2_2_col_1_2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }
        
        self.departure_security_section_desc_2_2_col_1_3_view.addSubview(self.departure06_icon11)
        self.departure06_icon11.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_2_col_1_3_view.addSubview(self.departure_security_section_desc_2_2_col_1_3)
        self.departure_security_section_desc_2_2_col_1_3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        self.departure_security_section_desc_2_2_col_1_4_view.addSubview(self.departure06_icon12)
        self.departure06_icon12.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-SizeUtils.iconSize/2)
            make.size.equalTo(SizeUtils.iconSize)
        }
        self.departure_security_section_desc_2_2_col_1_4_view.addSubview(self.departure_security_section_desc_2_2_col_1_4)
        self.departure_security_section_desc_2_2_col_1_4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(SizeUtils.iconSize/2)
        }

        self.contentsView.addSubview(self.departure_security_section_desc_2_3)
        self.departure_security_section_desc_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_table_view.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }

        self.contentsView.addSubview(self.departure_security_section_desc_2_3_col_1_1_view)
        self.departure_security_section_desc_2_3_col_1_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(cellWidth)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_2_3_col_2_1_view)
        self.departure_security_section_desc_2_3_col_2_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_3_col_1_1_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(cellWidth)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_2_3_col_3_1_view)
        self.departure_security_section_desc_2_3_col_3_1_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_3_col_2_1_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(cellWidth)
        }

        self.departure_security_section_desc_2_3_col_1_1_view.addSubview(self.departure06_img01)
        self.departure06_img01.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVeryBig)
        }
        self.departure_security_section_desc_2_3_col_1_1_view.addSubview(self.departure_security_section_desc_2_3_col_1_1)
        self.departure_security_section_desc_2_3_col_1_1.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalTo(self.departure06_img01.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        
        self.departure_security_section_desc_2_3_col_2_1_view.addSubview(self.departure06_img02)
        self.departure06_img02.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVeryBig)
        }
        self.departure_security_section_desc_2_3_col_2_1_view.addSubview(self.departure_security_section_desc_2_3_col_2_1)
        self.departure_security_section_desc_2_3_col_2_1.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalTo(self.departure06_img01.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }
        
        self.departure_security_section_desc_2_3_col_3_1_view.addSubview(self.departure06_img03)
        self.departure06_img03.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
            make.size.equalTo(SizeUtils.iconSizeVeryBig)
        }
        self.departure_security_section_desc_2_3_col_3_1_view.addSubview(self.departure_security_section_desc_2_3_col_3_1)
        self.departure_security_section_desc_2_3_col_3_1.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalTo(self.departure06_img01.snp.leading).offset(-SizeUtils.sideMargin)
            make.centerY.equalToSuperview()
        }

        self.contentsView.addSubview(self.departure_security_section_title_3)
        self.departure_security_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_2_3_col_3_1_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_3_1)
        self.departure_security_section_desc_3_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_3_2)
        self.departure_security_section_desc_3_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_3_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_3_3)
        self.departure_security_section_desc_3_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_3_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_security_section_title_4)
        self.departure_security_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_3_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_4_1)
        self.departure_security_section_desc_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_security_section_desc_4_2)
        self.departure_security_section_desc_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_security_section_desc_4_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            
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
