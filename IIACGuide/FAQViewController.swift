//
//  FAQViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class FAQViewController: BaseViewController {
    
    var faqDatas = [FaqData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: FAQViewController.self))
        self.initUi()
        
        self.setData()
    }
    
    private let faq_tableview: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    
}
extension FAQViewController {
    func initUi(){
        
        self.faq_tableview.delegate = self
        self.faq_tableview.dataSource = self
        self.faq_tableview.separatorStyle = .none
        self.faq_tableview.register(FAQTableViewCell.self, forCellReuseIdentifier: "FAQTableViewCell")
        
        self.view.addSubview(self.faq_tableview)
        self.faq_tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    func setData(){
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_1".localized, contents: "prohibited_item_faq_1_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_2".localized, contents: "prohibited_item_faq_2_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_3".localized, contents: "prohibited_item_faq_3_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_4".localized, contents: "prohibited_item_faq_4_desc".localized, tel: "prohibited_item_faq_4_call".localized, isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_5".localized, contents: "prohibited_item_faq_5_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_6".localized, contents: "prohibited_item_faq_6_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_7".localized, contents: "prohibited_item_faq_7_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_8".localized, contents: "prohibited_item_faq_8_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_9".localized, contents: "prohibited_item_faq_9_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_10".localized, contents: "prohibited_item_faq_10_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_11".localized, contents: "prohibited_item_faq_11_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_12".localized, contents: "prohibited_item_faq_12_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_13".localized, contents: "prohibited_item_faq_13_desc".localized, tel: "", isHidden: true))
        
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_14".localized, contents: "prohibited_item_faq_14_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_15".localized, contents: "prohibited_item_faq_15_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_16".localized, contents: "prohibited_item_faq_16_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_17".localized, contents: "prohibited_item_faq_17_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_18".localized, contents: "prohibited_item_faq_18_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_19".localized, contents: "prohibited_item_faq_19_desc".localized, tel: "", isHidden: true))
        self.faqDatas.append(FaqData(title: "prohibited_item_faq_20".localized, contents: "prohibited_item_faq_20_desc".localized, tel: "", isHidden: true))
    }
}
extension FAQViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
//        if indexPath.row == 3 {
//            if let url = URL(string: "tel://\("prohibited_item_faq_4_call_number".localized.replacingOccurrences(of: "-", with: ""))"), UIApplication.shared.canOpenURL(url) {
//                if #available(iOS 10, *) {
//                    UIApplication.shared.open(url)
//                } else {
//                    UIApplication.shared.openURL(url)
//                }
//            }
//        }
        
        if !self.faqDatas[indexPath.row].isHidden! {
            self.faqDatas[indexPath.row].isHidden = true
        }else{
            for faqData in self.faqDatas {
                faqData.isHidden = true
            }
            self.faqDatas[indexPath.row].isHidden = false
        }
        self.faq_tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.faqDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell")! as! FAQTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.viewWidth = self.view.frame.width
        cell.faqData = self.faqDatas[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        
        
        var tableHeight = SizeUtils.buttonHeight + 1
        if !self.faqDatas[indexPath.row].isHidden! {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - SizeUtils.sideMargin * 2 - SizeUtils.contents * 2, height: CGFloat.greatestFiniteMagnitude))
            label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayHeavyText)
            label.font = UIFont.systemFont(ofSize: SizeUtils.contents, weight: UIFont.Weight.regular)
            label.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayBackground)
            label.text = self.faqDatas[indexPath.row].contents
            label.numberOfLines = 0
            label.sizeToFit()
            
            print(label.frame.height)

            tableHeight += label.frame.height + SizeUtils.contents * 2

            if self.faqDatas[indexPath.row].tel != "" {
                tableHeight += SizeUtils.buttonHeight
            }
        }

        return tableHeight
    }

}
