//
//  HomeCell.swift
//  AppStoreP
//
//  Created by SKS on 09/10/16.
//  Copyright © 2016 AppStoreP. All rights reserved.
//

import UIKit

class Homecell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellid"
    
    var appCategory: AppCategory? {
        
        didSet {
            if let name = appCategory?.categoryName {
                titleLabel.text = name
            }
        }
        
    }
    
    
    
    let collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
        
    }()
    
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Play with the app Store"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    let boarderLine:UIView = {
        let boarferLine = UIView()
        boarferLine.backgroundColor =  UIColor(white: 0.4, alpha: 0.4)
        return boarferLine
    }()
    
    override init(frame: CGRect) {
    super.init(frame: frame)
            backgroundColor = .white
    setUpView()
    }
    
    func setUpView() {
        addSubview(collectionView)
        addSubview(titleLabel)
        addSubview(boarderLine)
        
        boarderLine.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ScrollCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(30)]-2-[collectionView][boarderLine(0.5)]|", options: [], metrics: [:], views: ["collectionView":collectionView, "titleLabel":titleLabel, "boarderLine":boarderLine]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", options: [], metrics: [:], views: ["collectionView":collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[titleLabel]|", options: [], metrics: [:], views: ["titleLabel":titleLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[boarderLine]|", options: [], metrics: [:], views: ["boarderLine":boarderLine]))

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if let count  = appCategory?.appData?.count {
            return count
        }
        return 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellID , for: indexPath) as! ScrollCell
        if let appData  = appCategory?.appData {
            cell.appdata = appData[indexPath.row]
        }
        
      //  cell.appdata = (appCategory?.appData?[indexPath.row])!
//        cell.backgroundColor = .green
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:100,height:frame.size.height - 35)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }

    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ScrollCell: UICollectionViewCell {
    
    
    var appdata:AppsModel? {
        didSet {

            nameLabel.text = appdata?.name
            catogoryLabel.text = appdata?.category
            priceLabel.text = appdata?.price
            if  let imageName  = appdata?.imageName  {
            imageView.image = UIImage(named:imageName)
            }
        }
        
    }
    
    let imageView:UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "frozen")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 14
        iv.layer.masksToBounds = true
        return iv
        
    }()
    
    
    let nameLabel:UILabel = {
        let label = UILabel()
//        label.text = "Disney : Build it Frozen "
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let catogoryLabel:UILabel = {
        let label = UILabel()
//        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()

    let priceLabel:UILabel = {
        let label = UILabel()
//        label.text = "5$"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(catogoryLabel)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame =  CGRect(x: 0, y: frame.width + 2 , width: frame.width, height: 40)
        catogoryLabel.frame = CGRect(x: 0, y: frame.width + 38 , width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
        
    }
    
}

