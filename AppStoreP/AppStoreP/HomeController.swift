//
//  ViewController.swift
//  AppStoreP
//
//  Created by SKS on 09/10/16.
//  Copyright © 2016 AppStoreP. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellID = "HOMECELL"
//    var appmodel : [AppsModel]
    var appCategory : AppCategory?
    var appdata: [AppsModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //Use of the self??
        collectionView?.register(Homecell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.backgroundColor = .white
        
//        appCategory = AppCategory.dummyAppCategoryData()
        
        
        AppCategory.fetchFeaturedApps { (featuredApps) -> () in
            
            self.appCategory = featuredApps
            self.appdata = featuredApps.appData!
            self.collectionView?.reloadData()
        }

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.appdata!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as!Homecell
        cell.appCategory = appCategory[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.view.frame.width,height:230    )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }


}

