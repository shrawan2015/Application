//
//  SelectionBar.swift
//  YoutubeP
//
//  Created by SKS on 01/10/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import UIKit

class SelectionBar: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    let selectionCell = "selectionCell"
    var homeController:HomeViewController?
    let imageNames = ["home", "trending", "subscriptions", "account"]
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    lazy var collectioView :UICollectionView = {
        let collectionFlowLayout =  UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.rgb(230, green: 32, blue: 31)
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())

        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
        setUpHorizontalSelection()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpHorizontalSelection() {
        
        
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    
    func setUpView() {
        collectioView.register(MenuCell.self, forCellWithReuseIdentifier: selectionCell)
        addSubview(collectioView)
        addConstrainsts(format: "H:|[v0]|", viewsList: collectioView)
        addConstrainsts(format: "V:|[v0]|", viewsList: collectioView)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectionCell, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[(indexPath as NSIndexPath).item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.init(colorLiteralRed: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //selected code
            homeController?.scrollToMenuIndex(index: indexPath.item)
                print(indexPath.item)
//                let x = CGFloat(indexPath.item) * frame.width / 4
//                horizontalBarLeftAnchorConstraint?.constant = x
//        
//                UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                   //what does this do  while animation
//                    self.layoutIfNeeded()
//                    }, completion: nil)
//
//    }
    
}

}
//Custom SelectionCell
class MenuCell : UICollectionViewCell {
    
    let imageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return imageView
        
    }()
    
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(91, green: 14, blue: 13)
        }
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        addSubview(imageView)
        addConstrainsts(format: "V:[v0(28)]", viewsList: imageView)
        addConstrainsts(format: "H:[v0(28)]", viewsList: imageView)
        addConstraint(NSLayoutConstraint.init(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    
    
    
}

