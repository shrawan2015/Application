//
//  CustomTabBar.swift
//  WhatsApp
//
//  Created by SKS on 18/10/16.
//  Copyright © 2016 whatsApp. All rights reserved.
//

import UIKit


class CustomTabBar:UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    let cellID = "CELLID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView()  {

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:cellID )
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

    }
    
     let collectionView:UICollectionView = {
        let flowLayout  = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .purple
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/3, height: 20)
    }
    
    
}
