//
//  Models.swift
//  AppStoreP
//
//  Created by SKS on 09/10/16.
//  Copyright © 2016 AppStoreP. All rights reserved.
//

import UIKit


class AppCategory:NSObject {
    
    
    var name: String?
    var apps: [AppsModel]?
    var type: String?

    var categoryName:String?
    var appData:[AppsModel]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            
            apps = [AppsModel]()
            for dict in value as! [[String: AnyObject]] {
                let app = AppsModel()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
            
        } else {
            super.setValue(value, forKey: key)
        }
    }

    static func fetchFeaturedApps(_ completionHandler:  @escaping (AppCategory) -> ()) {
        
        let urlString = "http://www.statsallday.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                
                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers))
                let featuredApps = AppCategory()
                featuredApps.setValuesForKeys(json as! [String: AnyObject])
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(featuredApps)
                })
            } catch let err {
                print(err)
            }
            
        }) .resume()
        
    }

    
    
    
    static func  dummyAppCategoryData() -> [AppCategory]{
        
        var apps = [AppsModel]()

        let data1 = AppCategory()
        data1.categoryName = "category1"
        
        let appData1 = AppsModel()
        appData1.id = "1"
        appData1.category = "Entertainment"
        appData1.price = "5$"
        appData1.name = "Binary build the frozen"
        appData1.imageName = "frozen"
        
        apps.append(appData1)
        data1.appData = apps

        
        let data2 = AppCategory()
        data2.categoryName = "category 3"
        
        var apps2 = [AppsModel]()
        let appData2 = AppsModel()
        appData2.id = "1"
        appData2.category = "Entertainment2"
        appData2.price = "5$"
        appData2.name = "Binary buil"
        appData2.imageName = "telepaint"

        
        
        apps2.append(appData2)
        data2.appData = apps2

        
        
        return  [data1,data2]
    }
    
}


class AppsModel:NSObject {
    var id:String?
    var price:String?
    var name:String?
    var category:String?
    var imageName:String?
}
