//
//  ViewController.swift
//  PageMenuDemo
//
//  Created by SKS on 06/06/17.
//  Copyright © 2017 PageMenuDemo. All rights reserved.
//

import UIKit
import PageMenu

class SaveSelectedCell{

    static let sharedInstance = SaveSelectedCell()
    var selectedImage:String?
    
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionVIew: UICollectionView!
    var pageMenu : CAPSPageMenu?
    var gallaryModel = [GallaryModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromTheParser()
        setupPages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func  loadFromTheParser(){
        
        let path =  Bundle.main.path(forResource: "GallaryJSONModel", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        print(jsonData!)
        
        let jsonResult = try! JSONSerialization.jsonObject(with: jsonData as! Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [Any]
        
        let gallaryModelList = GallaryModelList(jsonResult: jsonResult )
        gallaryModel = gallaryModelList.gallaryModel
        print(gallaryModelList)
    }
    
    func setupPages() {
        
        
        var controllerArray: [GallaryCollectionViewController] = [GallaryCollectionViewController]()

        for gallryObj in gallaryModel {
         
            let mainStroyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let controller = mainStroyboard.instantiateViewController(withIdentifier: "GallaryCollectionViewController") as! GallaryCollectionViewController

            
          //  let controller = GallaryCollectionViewController()
            controller.title = gallryObj.sectionName
            controller.gallaryModels = gallryObj
            controllerArray.append(controller)
        }
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(.blue),
            .viewBackgroundColor(.white),
            .selectionIndicatorColor(.white),
            .bottomMenuHairlineColor(.white),
            .menuHeight(40.0),
            .menuItemWidth(self.view.frame.width/3),
            .centerMenuItems(true),
            .selectedMenuItemLabelColor(.white),
            .unselectedMenuItemLabelColor(.white),
            .menuMargin(0.0)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0,y:64,width:self.view.frame.width ,height:self.view.frame.height ) , pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
    }

    
    
}

extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

