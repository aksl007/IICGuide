//
//  MyPlanDutyFreeTableViewCell.swift
//  IIACGuide
//
//  Created by DD Dev on 2020/09/23.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MyPlanDutyFreeTableViewCell: MyPlanBaseTableViewCell {
    
    var coupons = [Coupon]()
    
    var terminalId : String? {
        didSet {
            self.myplan_icon_dep_01.image = UIImage(named: "myplan_icon_dep_05")
            self.myplan_passenger_dep_con_title_1.text = "myplan_passenger_dep_7_title_2".localized
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_7_desc)
            self.myplan_passenger_dep_7_desc.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(SizeUtils.topMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.width.equalTo(viewWidth - SizeUtils.sideMargin * 6)
            }
            
            self.myplan_passenger_dep_7_btn_1.isUserInteractionEnabled = true
            self.myplan_passenger_dep_7_btn_2.isUserInteractionEnabled = true
            self.myplan_passenger_dep_7_btn_3.isUserInteractionEnabled = true
            self.myplan_passenger_dep_7_btn_4.isUserInteractionEnabled = true
            self.coupon_category_2_view.isUserInteractionEnabled = true
            
            self.myplan_passenger_dep_7_btn_1.tag = 0
            self.myplan_passenger_dep_7_btn_2.tag = 1
            self.myplan_passenger_dep_7_btn_3.tag = 2
            self.myplan_passenger_dep_7_btn_4.tag = 3
            self.coupon_category_2_view.tag = 4
            
            self.myplan_passenger_dep_7_btn_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDutyFree(_:))))
            self.myplan_passenger_dep_7_btn_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDutyFree(_:))))
            self.myplan_passenger_dep_7_btn_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDutyFree(_:))))
            self.myplan_passenger_dep_7_btn_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDutyFree(_:))))
            self.coupon_category_2_view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDutyFree(_:))))
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_7_btn_1)
            self.myplan_passenger_dep_7_btn_1.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_7_desc.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 9)/2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            self.white_background_view.addSubview(self.myplan_passenger_dep_7_btn_3)
            self.myplan_passenger_dep_7_btn_3.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_7_btn_1.snp.bottom).offset(SizeUtils.contentsMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin * 2)
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 9)/2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            
            self.white_background_view.addSubview(self.myplan_passenger_dep_7_btn_2)
            self.myplan_passenger_dep_7_btn_2.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_7_desc.snp.bottom).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 9)/2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            self.white_background_view.addSubview(self.myplan_passenger_dep_7_btn_4)
            self.myplan_passenger_dep_7_btn_4.snp.makeConstraints { (make) in
                make.top.equalTo(self.myplan_passenger_dep_7_btn_2.snp.bottom).offset(SizeUtils.contentsMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin * 2)
                make.width.equalTo((viewWidth - SizeUtils.sideMargin * 9)/2)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            
            self.white_background_view.addSubview(self.couponCollectionView)
            
            self.couponCollectionView.delegate = self
            self.couponCollectionView.dataSource = self
            self.couponCollectionView.backgroundColor = .white
            self.couponCollectionView.register(MyPlanCouponCollectionViewCell.self, forCellWithReuseIdentifier: "MyPlanCouponCollectionViewCell")
            self.couponCollectionView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(self.myplan_passenger_dep_7_btn_3.snp.bottom).offset(SizeUtils.verticalMargin)
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.height.equalTo(SizeUtils.couponeHeight * 3)
            }
        
            self.couponCollectionView.reloadData()
            
            
            self.white_background_view.addSubview(self.coupon_category_2_view)
            self.coupon_category_2_view.snp.makeConstraints { (make) in
                make.top.equalTo(self.couponCollectionView.snp.bottom).offset(SizeUtils.verticalMargin)
                make.centerX.equalToSuperview()
                make.width.equalTo(self.viewWidth * 2 / 3)
                make.height.equalTo(SizeUtils.greenButtonHeight)
            }
            
            self.coupon_category_2_view.addSubview(self.coupon_category_2)
            self.coupon_category_2.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset(-(SizeUtils.iconSize + SizeUtils.sideMargin) / 2)
                make.centerY.equalToSuperview()
            }
            self.coupon_category_2_view.addSubview(self.myplan_flight_search)
            self.myplan_flight_search.snp.makeConstraints { (make) in
                make.leading.equalTo(self.coupon_category_2.snp.trailing).offset(SizeUtils.sideMargin)
                make.centerY.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSize)
            }
        }
    }
    
    
    public let myplan_passenger_dep_7_desc : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_7_desc".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    public let myplan_passenger_dep_7_btn_1 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_7_btn_1".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_dep_7_btn_2 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_7_btn_2".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_dep_7_btn_3 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_7_btn_3".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    public let myplan_passenger_dep_7_btn_4 : UILabel = {
        let label = UILabel()
        label.text = "myplan_passenger_dep_7_btn_4".localized
        label.textAlignment = .center
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.contentsBig, weight: UIFont.Weight.regular)
        label.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground).cgColor
        label.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private let couponCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.sizeToFit()
        return collectionView
    }()
    
    private let coupon_category_2_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.greenLightBackground)
        view.layer.cornerRadius = SizeUtils.greenButtonHeight / 2
        view.sizeToFit()
        return view
    }()
    private let coupon_category_2 : UILabel = {
        let label = UILabel()
        label.text = "coupon_category_2".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.regular)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private let myplan_flight_search : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myplan_flight_search")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MyPlanDutyFreeTableViewCell{
    @objc func tapDutyFree(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 0 {
            //면세쇼핑
            if self.terminalId == "P03" {
                self.delegate?.tapShopping(terminalType: "T2", currentTap: 0)
            }else{
                self.delegate?.tapShopping(terminalType: "T1", currentTap: 0)
            }
            
        }else if sender.view?.tag == 1 {
            //면세품 인도장
            if self.terminalId == "P03" {
                self.delegate?.tapShopping(terminalType: "T2", currentTap: 10)
            }else{
                self.delegate?.tapShopping(terminalType: "T1", currentTap: 10)
            }
        }else if sender.view?.tag == 2 {
            //식당
            if self.terminalId == "P03" {
                self.delegate?.tapFood(terminalType: "T2", currentTap: 0)
            }else{
                self.delegate?.tapFood(terminalType: "T1", currentTap: 0)
            }
        }else if sender.view?.tag == 3 {
            //편의시설
            if self.terminalId == "P03" {
                self.delegate?.tapRest(terminalType: "T2", currentTap: 0)
            }else{
                self.delegate?.tapRest(terminalType: "T1", currentTap: 0)
            }
            
        }else if sender.view?.tag == 4 {
            //면세쿠폰
            self.delegate?.tapCoupon(isDutyFree: true)
            
        }
    }
}
extension MyPlanDutyFreeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (viewWidth - SizeUtils.sideMargin * 8) / 2, height: SizeUtils.couponeHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.coupons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPlanCouponCollectionViewCell", for: indexPath) as! MyPlanCouponCollectionViewCell
        
        cell.coupon = self.coupons[indexPath.row]
        return cell
    }
    
}
