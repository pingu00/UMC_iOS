//
//  CustomCell.swift
//  week4re
//
//  Created by Phil on 2022/11/02.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imageView_custom: UIImageView!
    @IBOutlet weak var label_custom: UILabel!
    @IBOutlet weak var button_custom: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
            // 셀을 초기화 해주는 코드.
        label_custom.font = nil
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
