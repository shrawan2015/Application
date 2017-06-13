//
//  CustomCollectionViewCell.swift
//  PrepareForReuse_CollectionView
//
//  Created by SKS on 01/06/17.
//  Copyright © 2017 PrepareForReuse_CollectionView. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var customView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.customView.isHidden = true
    }

    

}
