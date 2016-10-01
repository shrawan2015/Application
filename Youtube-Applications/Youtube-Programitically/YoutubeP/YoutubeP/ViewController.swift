//
//  ViewController.swift
//  YoutubeP
//
//  Created by SKS on 30/09/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let cellIdentifier = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellIdentifier )
        self.navigationController?.navigationBar.backgroundColor = .blue
        collectionView?.backgroundColor = .red
        
        addMenuBar()
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier , for: indexPath)
        customCell.backgroundColor = .white
        return customCell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:collectionView.frame.width,height:350)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }



    lazy var menuBar: SelectionBar = {
        let mb = SelectionBar()
        mb.homeController = self
        return mb
    }()
    
    
    func addMenuBar() {
        
        navigationController?.hidesBarsOnSwipe = true

        let redView = UIView()
        view.addSubview(redView)
        redView.backgroundColor = UIColor.rgb(230, green: 32, blue: 31)
        view.addConstrainsts(format: "H:|[v0]|", viewsList: redView)
        view.addConstrainsts(format: "V:[v0(50)]", viewsList: redView)
        
        view.addSubview(menuBar)
        
        view.addConstrainsts(format: "H:|[v0]|", viewsList: menuBar)
        view.addConstrainsts(format: "V:[v0(50)]", viewsList: menuBar)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
    }

}

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//   }





class CustomCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    
    let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage.init(named: "blackImage")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    let boarderLine : UIImageView = {
       let boarderLine = UIImageView()
        boarderLine.backgroundColor = .black

//        boarderLine.translatesAutoresizingMaskIntoConstraints = false
        return boarderLine
    }()
    
    
    
    let userProfile : UIImageView = {
        
        let userProfile = UIImageView()
        userProfile.backgroundColor = .green
        userProfile.image = UIImage.init(named:"taylor_swift_profile")
        userProfile.contentMode = .scaleAspectFill
        userProfile.clipsToBounds = true
        userProfile.layer.cornerRadius = 22 //half of height
        userProfile.layer.masksToBounds = true
        return userProfile
        
    }()
    
    
    let albumTitle:UILabel = {
        let albumTitle = UILabel()
        albumTitle.backgroundColor = .red
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        
        return albumTitle
    }()
    
    
    
    let albumSubTitle:UITextView = {
        let albumSubTitle = UITextView()
        albumSubTitle.backgroundColor = .orange
        albumSubTitle.translatesAutoresizingMaskIntoConstraints = false
        return albumSubTitle
    }()

    
    func setUpView()  {
        
        addSubview(imageView)
        addSubview(boarderLine)
        addSubview(userProfile)
        addSubview(albumTitle)
        addSubview(albumSubTitle)
        
        //imageView
        addConstrainsts(format:"H:|-16-[v0]-16-|", viewsList: imageView)
//        addConstrainsts(format: "V:|-16-[v0]-16-|", viewsList: imageView)
        
        //boarderLine
        addConstrainsts(format:"H:|[v0]|", viewsList: boarderLine)
//        addConstrainsts(format: "V:[v0(1)]|", viewsList: boarderLine)
        
        //ProfilePic
        addConstrainsts(format: "H:|-16-[v0(44)]-16-[v1]-16-|", viewsList: userProfile,albumTitle)
        addConstrainsts(format:"V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", viewsList: imageView,userProfile,boarderLine)
        

        //Titelvertical
        addConstraints([NSLayoutConstraint(item: albumTitle, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: albumTitle, attribute: .left, relatedBy: .equal, toItem: userProfile , attribute: .right  , multiplier: 1, constant: 8)])
        addConstraints([NSLayoutConstraint(item: albumTitle, attribute: .right, relatedBy: .equal, toItem: imageView , attribute: .right  , multiplier: 1, constant: 0)])
        addConstraints([NSLayoutConstraint(item: albumTitle, attribute: .height,    relatedBy: .equal, toItem: self , attribute: .height  , multiplier: 0, constant: 20)])
        
        //subtitle
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute: .top, relatedBy: .equal, toItem: albumTitle, attribute: .bottom, multiplier: 1, constant: 8) )
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute: .left, relatedBy: .equal, toItem: userProfile, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute: .right, relatedBy: . equal, toItem: albumTitle, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute:  .height, relatedBy: . equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[imageView]-16-|", options: [], metrics: [:], views: [ "imageView" : imageView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[imageView]-16-|", options: [], metrics: [:], views: [ "imageView" : imageView]))
//
//
        
        

        
        
        //inititate views
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}



extension UIView {
    func addConstrainsts(format:String ,viewsList: UIView...) {
        var viewDictionary = [String:UIView]()
        for(index,views) in viewsList.enumerated() {
            let key = "v\(index)"
            views.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = views
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:format, options: [], metrics: [:], views: viewDictionary))
    }
}

    extension UIColor {
        static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
            return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        }
    }
    

