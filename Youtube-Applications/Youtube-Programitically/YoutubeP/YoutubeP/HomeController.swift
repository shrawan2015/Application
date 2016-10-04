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
    
    
//    var videos : [Video] = {
//        
//        let keyChnael  = Channel()
//        keyChnael.name = "xyz"
//        keyChnael.profileimage = "imageView"
//        
//     var sampleVideo = Video()
//        sampleVideo.title = "xyz"
//        sampleVideo.thumbNailImage = "taylor_swift_profile"
//        sampleVideo.channel = keyChnael
//       return [sampleVideo]
//    }()
//    
    
    var videos : [Video] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //To make the color appear red
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel =  UILabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - 32), height: 20))
         titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellIdentifier )
        self.navigationController?.navigationBar.backgroundColor = .blue
        collectionView?.backgroundColor = .white

        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0) // to bring the collection below the menu bar
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50,0,0,0) //To bring the position of the scrollview at proper place
        
        self.fetchVideos()
        addMenuBar()
        setUpNavigationBar()
        
    }

    
    func setUpNavigationBar() {
        let image = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
    
        let searchbutton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchBar))
        
        let  morebutton = UIBarButtonItem(image:UIImage(named:""), style: .plain, target: self, action: #selector(editBar))
        self.navigationItem.rightBarButtonItems = [ searchbutton , morebutton ]
    
    }
    
    
    
    func searchBar() {
        print(123)
        
    }
    
    
    func editBar() {
        
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier , for: indexPath) as! CustomCell
        customCell.backgroundColor = .white
        
        customCell.video = videos[indexPath.row]
        
        return customCell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let height =  ( collectionView.frame.width - 16 - 16 ) * 9/16
        return CGSize(width:collectionView.frame.width,height:height + 16 + 68)
        
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

    
    
  
    
    
    
    func fetchVideos() {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbNailImage = dictionary["thumbnail_image_name"] as? String
                    
//                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//                    
//                    let channel = Channel()
//                    channel.name = channelDictionary["name"] as? String
//                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//                    
//                    video.channel = channel
                    
                    self.videos.append(video)
                }
                
                DispatchQueue.main.async {

                self.collectionView?.reloadData()

                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            
            }.resume()
    }
    
    
}

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//   }




