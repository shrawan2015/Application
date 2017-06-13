//
//  GallaryCollectionViewController.swift
//  PageMenuDemo
//
//  Created by SKS on 06/06/17.
//  Copyright © 2017 PageMenuDemo. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class GallaryCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var gallaryModels:GallaryModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
   //     self.collectionView!.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        

        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register cell classes

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwillappear is called")
        self.collectionView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       if let gallary = gallaryModels?.gallryImage?.count {
            return gallary
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 25, height: 200)
    }
  
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.green
        
        let imageUrl:NSURL? = NSURL(string: (gallaryModels?.gallryImage?[indexPath.row])!)
        cell.urlPathForPic = imageUrl
        
        if ( SaveSelectedCell.sharedInstance.selectedImage == String(describing: cell.urlPathForPic) ){
            cell.belowLayer.isHidden = false
        }else{
            cell.belowLayer.isHidden = true
        }
        
        if let url = imageUrl {
            cell.gallaryPic.sd_setImage(with: url as URL)
        }
        
        return cell

        // Configure the cell
    
     }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! CustomCollectionViewCell

        SaveSelectedCell.sharedInstance.selectedImage = String(describing: cell.urlPathForPic)
        print("  selected image url \(SaveSelectedCell.sharedInstance.selectedImage)")
        
    }

   }
