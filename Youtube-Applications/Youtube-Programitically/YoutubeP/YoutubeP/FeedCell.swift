//
//  FeedCell.swift
//  YoutubeP
//
//  Created by SKS on 05/10/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import Foundation

import UIKit
class FeedCell:BaseCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var videos: [Video]?
    
    let cellId = "cellId"
    
    func fetchVideos() {
        APIService.sharedInstance.fetchVideos { (videos: [Video]) in
            
            self.videos = videos
            self.collectionView.reloadData()
            
        }
    }
    
    
    
    override func setUpView() {
        super.setUpView()
        fetchVideos()
        addSubview(collectionView)
        addConstrainsts(format: "H:|[v0]|", viewsList: collectionView)
        addConstrainsts(format: "V:|[v0]|", viewsList: collectionView)
        self.backgroundColor = UIColor.brown
    
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CustomCell
        
        cell.video = videos?[(indexPath as NSIndexPath).item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let videoLauncher = VideoLauncher()
        //videoLauncher.showVideoPlayer()
    }
    
}

