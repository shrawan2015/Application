//
//  PageCell.swift
//  Audible
//
//  Created by SKS on 11/10/16.
//  Copyright © 2016 Audible. All rights reserved.
//

import UIKit

class PageCell:UICollectionViewCell
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    
    var page:Page? {
        
        didSet {
            guard let page = page else {
                return
            }
            
            imageView.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText

        }
        
        
    }
    
    
    
    let imageView:UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named:"page1")
        iv.contentMode = .scaleAspectFill // to make the image to stretch
        iv.clipsToBounds = true // to cut the image which is large
        return iv
    }()
    
    let textView:UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = "sample text "
        textView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)

        return textView
    }()

    let boarderLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    
    func setUpCell() {
        addSubview(imageView)
        addSubview(textView)
        addSubview(boarderLine)
        
//        textView.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

        //to make compressive textview from left and right
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
                textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

        
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)

        boarderLine.anchorToTop(nil, left: leftAnchor, bottom: imageView.bottomAnchor, right: rightAnchor)
        boarderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
