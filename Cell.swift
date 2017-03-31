//
//  Cell.swift
//  tableview
//
//  Created by sukishiMAC on 3/31/2560 BE.
//  Copyright © 2560 code2exit. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var btnshare: UILabel!
    @IBOutlet weak var btnlike: UIButton!
    @IBOutlet weak var defimg: UIImageView!
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var uimg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
