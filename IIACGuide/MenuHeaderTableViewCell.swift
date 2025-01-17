//
//  MenuHeaderTableViewCell.swift
//  incheon
//
//  Created by DD Dev on 2020/07/28.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class MenuHeaderTableViewCell: UITableViewCell {
    
//    var menus = [Menu]()
    weak var delegate: MenuViewController! {
        didSet{
            
            self.addSubview(self.shadowView)
            self.shadowView.snp.makeConstraints { (make) in
                make.bottom.trailing.equalToSuperview()
                make.height.equalTo(1)
                make.leading.equalToSuperview()
            }
            
            
            self.addSubview(self.slide_main_menu_my_plan_view)
            self.slide_main_menu_my_plan_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview().dividedBy(2)
            }
            
            self.slide_main_menu_my_plan_view.addSubview(self.left_hamburger_icon01)
            self.left_hamburger_icon01.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVeryBig)
            }
            self.slide_main_menu_my_plan_view.addSubview(self.slide_main_menu_my_plan)
            self.slide_main_menu_my_plan.snp.makeConstraints { (make) in
                make.top.equalTo(self.left_hamburger_icon01.snp.bottom).offset(SizeUtils.contentsMargin)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            self.addSubview(self.slide_main_menu_notice_view)
            self.slide_main_menu_notice_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
            }
            
            self.slide_main_menu_notice_view.addSubview(self.left_hamburger_icon02)
            self.left_hamburger_icon02.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVeryBig)
            }
            self.slide_main_menu_notice_view.addSubview(self.slide_main_menu_notice)
            self.slide_main_menu_notice.snp.makeConstraints { (make) in
                make.top.equalTo(self.left_hamburger_icon02.snp.bottom).offset(SizeUtils.contentsMargin)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            self.addSubview(self.slide_main_menu_setting_view)
            self.slide_main_menu_setting_view.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview().multipliedBy(1.5)
            }
            
            self.slide_main_menu_setting_view.addSubview(self.left_hamburger_icon03)
            self.left_hamburger_icon03.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.size.equalTo(SizeUtils.iconSizeVeryBig)
            }
            self.slide_main_menu_setting_view.addSubview(self.slide_main_menu_setting)
            self.slide_main_menu_setting.snp.makeConstraints { (make) in
                make.top.equalTo(self.left_hamburger_icon03.snp.bottom).offset(SizeUtils.contentsMargin)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
        }
    }
    
//    private let menuHeaderCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
//        return collectionView
//    }()
    
    private let shadowView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
    }()
    
    public let slide_main_menu_my_plan_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    public let slide_main_menu_notice_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    public let slide_main_menu_setting_view : UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()
    
    private let left_hamburger_icon01 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "left_hamburger_icon01")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let slide_main_menu_my_plan : UILabel = {
        let label = UILabel()
        label.text = "slide_main_menu_my_plan".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.sideMenuText, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let left_hamburger_icon02 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "left_hamburger_icon02")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let slide_main_menu_notice : UILabel = {
        let label = UILabel()
        label.text = "slide_main_menu_notice".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.sideMenuText, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let left_hamburger_icon03 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "left_hamburger_icon03")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let slide_main_menu_setting : UILabel = {
        let label = UILabel()
        label.text = "slide_main_menu_setting".localized
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blackText)
        label.font = UIFont.systemFont(ofSize: SizeUtils.sideMenuText, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.menus.append(Menu.init(icon: UIImage(named: "left_hamburger_icon01")!, title: "slide_main_menu_my_plan".localized, isSub: false, isHidden: false))
//        self.menus.append(Menu.init(icon: UIImage(named: "left_hamburger_icon02")!, title: "slide_main_menu_notice".localized, isSub: false, isHidden: false))
//        self.menus.append(Menu.init(icon: UIImage(named: "left_hamburger_icon03")!, title: "slide_main_menu_setting".localized, isSub: false, isHidden: false))
        
//        addSubview(self.menuHeaderCollectionView)
//
//        self.menuHeaderCollectionView.delegate = self
//        self.menuHeaderCollectionView.dataSource = self
//        self.menuHeaderCollectionView.backgroundColor = .white
//        self.menuHeaderCollectionView.register(MenuHeaderChildCollectionViewCell.self, forCellWithReuseIdentifier: "MenuHeaderChildCollectionViewCell")
//        self.menuHeaderCollectionView.snp.makeConstraints { (make) -> Void in
//            make.top.bottom.trailing.equalToSuperview()
//            make.leading.equalToSuperview().offset(5)
//        }
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
//extension MenuHeaderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("\(indexPath.row)")
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50 + (10 * 2), height: 120)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return menus.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuHeaderChildCollectionViewCell", for: indexPath) as! MenuHeaderChildCollectionViewCell
//
//        cell.isUserInteractionEnabled = true
//        cell.tag = indexPath.row
//        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderMenu(_:))))
//        cell.menu = menus[indexPath.row]
//        return cell
//    }
//
//}
