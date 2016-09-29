//
//  MenuBar.swift
//  YouTube
//
//  Created by SKS on 25/09/16.
//  Copyright © 2016 YouTube-Swift3. All rights reserved.
//

import UIKit



class MenuBar:UIView {
    
    
    override init(frame : CGRect){
     
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 230/255, green: 30/255, blue: 31/230, alpha: 1)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
