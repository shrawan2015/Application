//
//  ViewController.swift
//  MassangerP
//
//  Created by SKS on 12/10/16.
//  Copyright © 2016 MassangerP. All rights reserved.
//

import UIKit


class FriendViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    let cellID = "CELLID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.backgroundColor = UIColor.white

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width:self.view.frame.width,height:100 )
    }
}


class FriendCell: BaseCell {
    
    let profileimageView:UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "zuckprofile")
        iv.layer.cornerRadius = 34
        iv.layer.masksToBounds = true
        
        return iv
    }()

    let hasReadimageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "zuckprofile")
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        
        return iv
    }()

    
    let boarderLine:UIView = {
        let boardrLine = UIView()
        boardrLine.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return boardrLine
    }()
    
    let nameLabel:UILabel = {
        let name = UILabel()
        name.text = "mark"
        name.font = UIFont.systemFont(ofSize: 18)

        return  name
    }()

    let messageLabel:UILabel = {
        let name = UILabel()
        name.text = "Your friend mesaage and somehting else..."
        name.textColor = UIColor.darkGray
        name.font = UIFont.systemFont(ofSize: 14)
        return  name
    }()

    let timeLabel:UILabel = {
        let name = UILabel()
        name.text = "12.05 PM"
        name.textColor = UIColor.darkGray
        name.font = UIFont.systemFont(ofSize: 16)
        name.textAlignment = .right
        return  name
    }()

    
    override func setupViews() {

        addSubview(profileimageView)
        addConstraintsWithFormat("H:|-12-[v0(68)]", views: profileimageView)
        addConstraintsWithFormat("V:[v0(64)]", views: profileimageView)
        addConstraint(NSLayoutConstraint(item: profileimageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addSubview(boarderLine)
        addConstraintsWithFormat("H:|-68-[v0]|", views: boarderLine)
        addConstraintsWithFormat("V:[v0(1)]|", views: boarderLine)
        setUpContainerView()
            
            
            
            
    }
    
    
    func  setUpContainerView() {
  
        let containerView = UIView()
//        containerView.backgroundColor = .green
        addSubview(containerView)
        addConstraintsWithFormat("H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat("V:[v0(50)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(hasReadimageView)


        
        containerView.addConstraintsWithFormat("H:|[v0][v1(80)]-12-|", views: nameLabel, timeLabel)
        containerView.addConstraintsWithFormat("V:|[v0][v1(24)]|", views:nameLabel, messageLabel)
        containerView.addConstraintsWithFormat("H:|[v0]-8-[v1(20)]-12-|", views: messageLabel,hasReadimageView)

        containerView.addConstraintsWithFormat("V:|[v0(24)]", views:timeLabel)
        containerView.addConstraintsWithFormat("V:[v0(20)]|", views:hasReadimageView)

    
    }
}




extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}

