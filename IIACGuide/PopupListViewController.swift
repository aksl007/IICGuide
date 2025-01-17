//
//  PopupListViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/08/21.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

protocol PoupListDelegate: class {
    func setResult(tag: Int, row: Int)
}

class PopupListViewController: BasePopupViewController {
    
    weak var flightInfoSearch: FlightInfoSearchSubViewController!
    weak var passengerCongestionSub: PassengerCongestionSubViewController!
    weak var parkingFeePayment: ParkingFeePaymentViewController!
    weak var airBrsBag: AirBrsBagViewController!
    
    var delegate: PoupListDelegate?
    
    var tag = 0
    var type = ""
    var popupTitle = ""
    var arrayImage = [UIImage]()
    var arrayString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: PopupListViewController.self))
        self.initUi()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if type == CodeUtils.DATE {
            
            if self.arrayString.count > 3 {
                let indexPath = IndexPath(row: 3, section: 0)
                self.popupTableView.scrollToRow(at: indexPath, at: .top, animated: false)
            }
            
        }else if type == CodeUtils.FLIGHT_SEASON {
            let indexPath = IndexPath(row: tag, section: 0)
            self.popupTableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    private let popupTitleLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: SizeUtils.title, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        label.sizeToFit()
        return label
    }()
    private let popupTableView: UITableView = {
        let tableView = UITableView()
        tableView.sizeToFit()
        return tableView
    }()
    private let popupCloseButton : UIButton = {
        let button = UIButton()
        button.setTitle("common_close".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueText), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white).cgColor
        button.addTarget(self, action: #selector(closeThisPage), for: .touchUpInside)
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        
        return button
    }()

}
extension PopupListViewController {
    func initUi(){

        self.popupTitleLabel.text = popupTitle
        self.contentsView.addSubview(self.popupTitleLabel)
        self.popupTitleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeUtils.navigationHeight)
        }
        
        self.popupTableView.delegate = self
        self.popupTableView.dataSource = self
        self.popupTableView.separatorStyle = .none
        self.popupTableView.register(PopupListTableViewCell.self, forCellReuseIdentifier: "PopupListTableViewCell")
        
        self.contentsView.addSubview(self.popupTableView)
        self.popupTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupTitleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            let tableViewSize = (CGFloat(arrayString.count) * SizeUtils.navigationHeight)
            let popupTableViewSize = ((self.view.frame.height * 7 / 10) - SizeUtils.navigationHeight - SizeUtils.buttonHeight)
            if tableViewSize > popupTableViewSize {
                make.height.lessThanOrEqualTo(popupTableViewSize)
            }else{
                make.height.lessThanOrEqualTo(tableViewSize)
            }
            
        }
        self.contentsView.addSubview(self.popupCloseButton)
        self.popupCloseButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.popupTableView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(SizeUtils.buttonHeight)
        }
    }
}
extension PopupListViewController {
    
//    @objc func closeThisPage(){
//        self.dismiss(animated: false, completion: nil)
//    }
}
extension PopupListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        self.closeThisPage()
        
        
        if self.flightInfoSearch != nil {
            self.flightInfoSearch.setString(type: self.type, row: indexPath.row)
        }else if self.passengerCongestionSub != nil {
            self.passengerCongestionSub.setString(type: self.type, row: indexPath.row)
        }else if self.parkingFeePayment != nil {
            
            self.parkingFeePayment.moveParkingFeePaymentDetail(row: indexPath.row)
        }else if self.airBrsBag != nil {
            self.airBrsBag.setString(type: self.type, row: indexPath.row)
        }else {
            self.delegate?.setResult(tag:self.tag, row: indexPath.row)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PopupListTableViewCell")! as! PopupListTableViewCell

        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.row = indexPath.row
        if arrayImage.count != 0 {
            cell.listIamge = arrayImage[indexPath.row]
        }
        
        cell.string = arrayString[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SizeUtils.navigationHeight
    }

}
