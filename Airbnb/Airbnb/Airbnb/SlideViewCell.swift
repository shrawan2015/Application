//
//  SlideViewCell.swift
//  Airbnb
//
//  Created by SKS on 12/11/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit

class SlideViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var slide:SlideModel?{
        didSet {
            
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .left
           // paragraph.firstLineHeadIndent = 10
            
            
            let multipleAttributes: [String : Any] = [
                NSParagraphStyleAttributeName: paragraph ,
                NSForegroundColorAttributeName: UIColor.black,
               /* NSBackgroundColorAttributeName: UIColor.yellow,
                NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue, */
                NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30)
            ]
            
            let attrString3 = NSAttributedString(string: (slide?.textString!)!, attributes: multipleAttributes)

           // textView.text = slide?.textString
            textView.attributedText =  attrString3
            imageView.image = UIImage(named: (slide?.imageName)!)
        }
    }
    
    
}


struct SlideModel {
    var imageName:String?
    var textString:String?
}
