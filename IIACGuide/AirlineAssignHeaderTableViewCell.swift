//
//  AirlineAssignHeaderTableViewCell.swift
//  IIACGuide
//
//  Created by 김진성 on 2020/10/04.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit

class AirlineAssignHeaderTableViewCell: UITableViewCell {
    
    var headerImage: UIImage? {
        didSet{
            
            self.headerImageView.image = headerImage
            
            self.addSubview(self.headerImageView)
            self.headerImageView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            self.addSubview(self.end_line_view)
            self.end_line_view.snp.makeConstraints { (make) in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
    
    private let headerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }()
    
    private let end_line_view : UIView = {
        let view = UIView()
        view.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.grayLine)
        view.sizeToFit()
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
