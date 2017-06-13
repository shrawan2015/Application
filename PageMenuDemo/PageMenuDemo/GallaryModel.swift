//
//  GallaryModel.swift
//  PageMenuDemo
//
//  Created by SKS on 06/06/17.
//  Copyright © 2017 PageMenuDemo. All rights reserved.
//

import Foundation

class GallaryModel {
    var sectionName:String?
    var gallryImage:[String]?
}

class GallaryModelList{
    var gallaryModel = [GallaryModel]()
    convenience init(jsonResult: [Any])  {
        self.init()
        for  gallryModel in jsonResult {
            let tempgallaryModel = GallaryModel()
            for (myKey,myValue) in (gallryModel as? [String:[String]])!  {
                print("\(myKey) \t ")
                tempgallaryModel.sectionName = myKey
                tempgallaryModel.gallryImage = myValue
            }
            gallaryModel.append(tempgallaryModel)
        }
  
    }
    
}
