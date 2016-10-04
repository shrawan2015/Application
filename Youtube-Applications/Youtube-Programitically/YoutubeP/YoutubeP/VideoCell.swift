//
//  VideoCell.swift
//  YoutubeP
//
//  Created by SKS on 02/10/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import UIKit


class BaseCell :UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setUpView() {
        
    }
    
    }



class CustomCell : BaseCell {
   
    
    
    
    
    var video : Video?  {
        
        didSet {
            albumTitle.text = video?.title
        setupThumbnailImage()
           // imageView.image = UIImage(named: (video?.thumbNailImage)!)
            albumSubTitle.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        
        }
        
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
        boarderLine.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        
        
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
        //        albumTitle.backgroundColor = .red
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        
        albumTitle.text = "Taylor Swift - Blank Space"
        
        return albumTitle
    }()
    
    
    
    let albumSubTitle:UITextView = {
        let albumSubTitle = UITextView()
        //        albumSubTitle.backgroundColor = .orange
        albumSubTitle.translatesAutoresizingMaskIntoConstraints = false
        albumSubTitle.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        //By default it is outside allign so to bring to same line
        albumSubTitle.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        albumSubTitle.textColor = UIColor.lightGray
        return albumSubTitle
    }()
    
    
    override func setUpView()  {
        
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
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute: .top, relatedBy: .equal, toItem: albumTitle, attribute: .bottom, multiplier: 1, constant: 4) )
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute: .left, relatedBy: .equal, toItem: userProfile, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute: .right, relatedBy: . equal, toItem: albumTitle, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: albumSubTitle, attribute:  .height, relatedBy: . equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
        
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[imageView]-16-|", options: [], metrics: [:], views: [ "imageView" : imageView]))
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[imageView]-16-|", options: [], metrics: [:], views: [ "imageView" : imageView]))
        //
        //
        
        
        
        
        
        //inititate views
    }
    
  
//    func setupProfileImage() {
//        if let profileImageUrl = video?.channel?.profileImageName {
//            userProfileImageView.loadImageUsingUrlString(profileImageUrl)
//        }
//    }
    
    func setupThumbnailImage() {
        
        
        if let thumbnailImageUrl = video?.thumbNailImage {
            imageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
        }
    }
    
    
}



