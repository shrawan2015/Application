//
//  Video.swift
//  YoutubeP
//
//  Created by SKS on 03/10/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import UIKit


class Video:NSObject {
    
    var thumbNailImage: String?
    var title:String?
    var channel : Channel?
}


class Channel : NSObject {
    
    var name : String?
    var profileimage: String?
    
}
