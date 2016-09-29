//
//  ViewController.swift
//  CustomUICollectionView
//
//  Created by SKS on 29/09/16.
//  Copyright © 2016 CustomUICollectionView. All rights reserved.
//

import UIKit

class HomeController : UICollectionViewController ,UICollectionViewDelegateFlowLayout {

    let customCellID = "customCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white

        collectionView?.register(customCell.self, forCellWithReuseIdentifier: customCellID)
        print(collectionView)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(section)

        return 3

    }
    

     public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:collectionView.frame.width,height:300)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("1")
        return 1
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellID, for: indexPath)
         cell.backgroundColor = .red
        
        return cell
        
    }
    
    
   }



class customCell : UICollectionViewCell {
    
    let label : UILabel = {
        let customLabel = UILabel()
        customLabel.tintColor = .red
        customLabel.text = "Collection view cell "
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        return customLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCustomView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        addSubview(label)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v1]|", options: [], metrics: [:], views: [ "v1": label ]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: [:], views: [ "v1" : label]))
    }
    
    
}
