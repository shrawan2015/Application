//
//  ViewController.swift
//  whatsApp
//
//  Created by SKS on 17/10/16.
//  Copyright © 2016 whatsApp. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCollectionView()
        self.addcustomTabBar()
    }

    func setUpCollectionView() {
        collectionView?.backgroundColor = .green
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }

        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)

    }
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    
    
    let customTabBar:CustomTabBar = {
       let customTabBar = CustomTabBar()
        return customTabBar
    }()

    
    func addcustomTabBar()  {
        view.addSubview(customTabBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: customTabBar)
        view.addConstraintsWithFormat("V:[v0(50)]", views: customTabBar)
        customTabBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true

    }
    
    }
    


