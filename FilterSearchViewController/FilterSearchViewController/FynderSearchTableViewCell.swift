//
//  FynderSearchTableViewCell.swift
//  FilterSearchViewController
//
//  Created by ShrawanKumar Sharma on 08/05/17.
//  Copyright © 2017 FilterSearchViewController. All rights reserved.
//

import UIKit

class FynderSearchTableViewCell: UITableViewCell {

    @IBOutlet var distanceFromEvent: UILabel!
    @IBOutlet var nameContact: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
