//
//  SecondViewControllerTableViewCell.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/9/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit

class SecondViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPanggilan: UILabel!
    @IBOutlet weak var labelidline: UILabel!
    @IBOutlet weak var imageAnak: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
