//
//  SearchSlideTableViewCell.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/09/27.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class SearchSlideTableViewCell: UITableViewCell {
    
    var title: String?
    
    var searchSlide: SearchSlide? {
        didSet {
            
            var terminal = "flights_list_t1".localized
            if searchSlide?.terminalId != nil && searchSlide?.terminalId == "P03" {
                terminal = "flights_list_t2".localized
            }
            
            let pageId = searchSlide?.pageId
            let slideId = searchSlide?.slideId
            var slideTitle = ""
            if pageId == "DeparturePage" {
                
                if slideId == "slide0" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_1".localized)"
                }else if slideId == "slide1" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_2".localized)"
                }else if slideId == "slide2" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_3".localized)"
                }else if slideId == "slide3" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_4".localized)"
                }else if slideId == "slide4" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_5".localized)"
                }else if slideId == "slide5" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_6".localized)"
                }else if slideId == "slide6" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_7".localized)"
                }else if slideId == "slide8" {
                    slideTitle = "\(self.title ?? "")-\("airport_departure_title_8".localized)"
                }
                
            }else if pageId == "EntrancePage" {
                if slideId == "slide0" {
                    slideTitle = "\(self.title ?? "")-\("airport_arrival_title_1".localized)"
                }else if slideId == "slide1" {
                    slideTitle = "\(self.title ?? "")-\("airport_arrival_title_2".localized)"
                }else if slideId == "slide2" {
                    slideTitle = "\(self.title ?? "")-\("airport_arrival_title_3".localized)"
                }else if slideId == "slide4" {
                    slideTitle = "\(self.title ?? "")-\("airport_arrival_title_4".localized)"
                }else if slideId == "slide5" {
                    slideTitle = "\(self.title ?? "")-\("airport_arrival_title_5".localized)"
                }else if slideId == "slide6" {
                    slideTitle = "\(self.title ?? "")-\("airport_arrival_title_6".localized)"
                }
                
            }else if pageId == "ParkingPage" {
                if slideId == "slide0" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("parking_category_1".localized)"
                }else if slideId == "slide1" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("parking_category_2".localized)"
                }else if slideId == "slide2" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("parking_category_3".localized)"
                }else if slideId == "slide3" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("parking_category_4".localized)"
                }else if slideId == "slide4" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("parking_category_5".localized)"
                }
            }else if pageId == "TrafficPage" {
                if slideId == "slide0" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("transport_category_1".localized)"
                }else if slideId == "slide1" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("transport_category_2".localized)"
                }else if slideId == "slide3" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("transport_category_3".localized)"
                }else if slideId == "slide4" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("transport_category_5".localized)"
                }else if slideId == "slide5" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("transport_category_4".localized)"
                }
            }else if pageId == "TransportAbbreviationInformationPage" {
                if slideId == "slide0" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("disabled_elderly_category_1".localized)"
                }else if slideId == "slide1" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("disabled_elderly_category_2".localized)"
                }else if slideId == "slide2" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("disabled_elderly_category_3".localized)"
                }else if slideId == "slide3" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("disabled_elderly_category_4".localized)"
                }else if slideId == "slide4" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("disabled_elderly_category_5".localized)"
                }else if slideId == "slide5" {
                    slideTitle = "\(self.title ?? "")-\(terminal)-\("disabled_elderly_category_6".localized)"
                }
            }else if pageId == "TransferPage" {
                if slideId == "slide0" {
                    slideTitle = "\(self.title ?? "")-\("transfer_category_1".localized)"
                }else if slideId == "slide1" {
                    slideTitle = "\(self.title ?? "")-\("transfer_category_2".localized)"
                }else if slideId == "slide4" {
                    slideTitle = "\(self.title ?? "")-\("transfer_category_3".localized)"
                }
            }else if pageId == "MovingTerminalsPage" {
                slideTitle = "\(self.title ?? "")-\(terminal)"
            }
            
            
            self.subTitle.text = slideTitle
            
            self.addSubview(self.subTitle)
            self.subTitle.snp.makeConstraints { (make) in
                make.top.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(SizeUtils.sideMargin)
            }
            
            self.addSubview(self.icon_arrow_right)
            self.icon_arrow_right.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
                make.size.equalTo(SizeUtils.iconSizeSmall)
            }
            
            self.addSubview(self.end_line_view)
            self.end_line_view.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
    
    private let subTitle : UILabel = {
        let label = UILabel()
        label.textColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.black)
        label.font = UIFont.systemFont(ofSize: SizeUtils.titleSmall, weight: UIFont.Weight.semibold)
        label.sizeToFit()
        return label
    }()

    private let icon_arrow_right : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_arrow_right")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        return view
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
