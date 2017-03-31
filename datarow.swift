

//
//  datarow.swift
//  tableview
//
//  Created by sukishiMAC on 3/30/2560 BE.
//  Copyright © 2560 code2exit. All rights reserved.
//

import UIKit

class datarow: UITableViewCell {
    
    
    @IBOutlet weak var pic: UIImageView!

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
