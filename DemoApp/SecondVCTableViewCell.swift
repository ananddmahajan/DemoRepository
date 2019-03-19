//
//  SecondVCTableViewCell.swift
//  DemoApp
//
//  Created by Pepsico_1 on 1/30/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit

class SecondVCTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchOnOff: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
