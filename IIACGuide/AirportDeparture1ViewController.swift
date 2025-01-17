//
//  AirportDeparture1ViewController.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/02.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirportDeparture1ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: AirportDeparture1ViewController.self))
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
    private let departure_checkin_section_title_1: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_title_1".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure01_img01 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "departure01_img01")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let departure_checkin_section_desc_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_desc_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_checkin_section_title_2: UILabel = {
         let label = UILabel()
         label.text = "departure_checkin_section_title_2".localized.getSubTitle
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
         label.sizeToFit()
         return label
     }()
    
    private let departure_checkin_section_desc_2_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_checkin_section_desc_2_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_checkin_section_desc_2_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_checkin_section_desc_2_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_checkin_section_desc_2_3 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_checkin_section_desc_2_3".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_checkin_section_desc_2_4 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_checkin_section_desc_2_4".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_checkin_section_desc_2_4_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_desc_2_4_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
 
    private let departure_checkin_section_title_3: UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_title_3".localized.getSubTitle
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private let departure_checkin_section_desc_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_desc_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let departure_checkin_section_3_link_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_checkin_section_3_link : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_3_link".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_checkin_section_3_link_end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_section_title_4: UILabel = {
         let label = UILabel()
         label.text = "departure_checkin_section_title_4".localized.getSubTitle
         label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
         label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: .regular)
         label.sizeToFit()
         return label
     }()
    
    private let departure_checkin_section_desc_4_1 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_checkin_section_desc_4_1".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let departure_checkin_section_desc_4_2 : UILabel = {
        let label = UILabel()
        let paragraph = NSMutableParagraphStyle()
        paragraph.firstLineHeadIndent = 0
        paragraph.headIndent = 8 //You can change this to whatever indent you want

        let mutString = NSAttributedString(
            string: "departure_checkin_section_desc_4_2".localized.getDescription,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraph]
        )
        label.attributedText = mutString
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let departure_checkin_section_4_link_1_start_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_checkin_section_4_link_1 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_4_link_1".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_checkin_section_4_link_1_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    
    private let departure_checkin_section_4_link_2 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_4_link_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_checkin_section_4_link_2_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()
    private let departure_checkin_section_4_link_3 : UILabel = {
        let label = UILabel()
        label.text = "departure_checkin_section_4_link_3".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let departure_checkin_section_4_link_3_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
        return view
    }()


}
extension AirportDeparture1ViewController{
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
        
        self.contentsView.addSubview(self.departure_checkin_section_title_1)
        self.departure_checkin_section_title_1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure01_img01)
        self.departure01_img01.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_title_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 1.2)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_desc_1)
        self.departure_checkin_section_desc_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure01_img01.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_title_2)
        self.departure_checkin_section_title_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_desc_2_1)
        self.departure_checkin_section_desc_2_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_title_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_checkin_section_desc_2_2)
        self.departure_checkin_section_desc_2_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_2_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_checkin_section_desc_2_3)
        self.departure_checkin_section_desc_2_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_2_2.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_checkin_section_desc_2_4)
        self.departure_checkin_section_desc_2_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_2_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_checkin_section_desc_2_4_1)
        self.departure_checkin_section_desc_2_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_2_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_checkin_section_title_3)
        self.departure_checkin_section_title_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_2_4_1.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_desc_3)
        self.departure_checkin_section_desc_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_title_3.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_3_link_line_view)
        self.departure_checkin_section_3_link_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_3.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        departure_checkin_section_3_link.tag = 0
        departure_checkin_section_4_link_1.tag = 1
        departure_checkin_section_4_link_2.tag = 2
        departure_checkin_section_4_link_3.tag = 3
        self.departure_checkin_section_3_link.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture1(_:))))
        self.departure_checkin_section_3_link.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.departure_checkin_section_3_link)
        self.departure_checkin_section_3_link.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_3_link_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_section_3_link.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_section_3_link_end_line_view)
        self.departure_checkin_section_3_link_end_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_3_link.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_title_4)
        self.departure_checkin_section_title_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_3_link_end_line_view.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_desc_4_1)
        self.departure_checkin_section_desc_4_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_title_4.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        self.contentsView.addSubview(self.departure_checkin_section_desc_4_2)
        self.departure_checkin_section_desc_4_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_4_1.snp.bottom).offset(SizeUtils.contentsMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        self.contentsView.addSubview(self.departure_checkin_section_4_link_1_start_line_view)
        self.departure_checkin_section_4_link_1_start_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_desc_4_2.snp.bottom).offset(SizeUtils.verticalMargin)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.departure_checkin_section_4_link_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture1(_:))))
        self.departure_checkin_section_4_link_1.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.departure_checkin_section_4_link_1)
        self.departure_checkin_section_4_link_1.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_4_link_1_start_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_section_4_link_1.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_section_4_link_1_line_view)
        self.departure_checkin_section_4_link_1_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_4_link_1.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.departure_checkin_section_4_link_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture1(_:))))
        self.departure_checkin_section_4_link_2.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.departure_checkin_section_4_link_2)
        self.departure_checkin_section_4_link_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_4_link_1_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_section_4_link_2.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_section_4_link_2_line_view)
        self.departure_checkin_section_4_link_2_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_4_link_2.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
        }
        
        self.departure_checkin_section_4_link_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDeparture1(_:))))
        self.departure_checkin_section_4_link_3.isUserInteractionEnabled = true
        self.contentsView.addSubview(self.departure_checkin_section_4_link_3)
        self.departure_checkin_section_4_link_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_4_link_2_line_view.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin + SizeUtils.contentsMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(SizeUtils.buttonHeight)
        }
        self.departure_checkin_section_4_link_3.addArrow(width: self.view.frame.width - (SizeUtils.sideMargin * 2) - SizeUtils.contentsMargin)
        
        self.contentsView.addSubview(self.departure_checkin_section_4_link_3_line_view)
        self.departure_checkin_section_4_link_3_line_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.departure_checkin_section_4_link_3.snp.bottom)
            make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
            make.height.equalTo(1)
            
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-SizeUtils.scrollBottomPadding)
        }
    }
}
extension AirportDeparture1ViewController {
    @objc func tapDeparture1(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            let mobileCheckInVC = MobileCheckInViewController()
            self.navigationController?.pushViewController(mobileCheckInVC, animated: true)
        }else if sender.view?.tag == 1 {
            guard let url = URL(string: ServerUtils.URL_AREX) else { return }
            UIApplication.shared.open(url)
        }else if sender.view?.tag == 2 {
            guard let url = URL(string: ServerUtils.URL_CALT) else { return }
            UIApplication.shared.open(url)
        }else if sender.view?.tag == 3 {
            guard let url = URL(string: ServerUtils.URL_KORAIL) else { return }
            UIApplication.shared.open(url)
        }
    }
}
