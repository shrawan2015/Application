//
//  CustomCollectionViewCell.swift
//  PageMenuDemo
//
//  Created by SKS on 06/06/17.
//  Copyright © 2017 PageMenuDemo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var selectedIndicator: UIButton!
    @IBOutlet var gallaryPic: UIImageView!
    
    @IBOutlet var belowLayer: UIView!
    var urlPathForPic:NSURL!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
               // selectedIndicator.isHidden = false
               belowLayer.isHidden = false
                
                
            } else {
              //  selectedIndicator.isHidden = true
                belowLayer.isHidden = true
                
            }
        }
    }
    
    
}
