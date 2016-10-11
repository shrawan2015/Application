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
    var videos : [Video]?
    let cellID = "cellidd"
    
    func fetchVideo() {
        APIService.sharedInstance.fetchVideos { (videos:[Video]) in
            self.videos = videos
            self.collectionView?.reloadData()
        }
    }
    
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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //To make the color appear red
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel =  UILabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - 32), height: 20))
         titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
      
        self.setUpCollectionView()
        self.fetchVideo()
        addMenuBar()
        setUpNavigationBar()
        
    }

    
    
    func setUpCollectionView() {
        
        
       if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        //collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellIdentifier )  //vodeo cell
        
//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
                collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)

        
        self.navigationController?.navigationBar.backgroundColor = .blue
        collectionView?.backgroundColor = .white
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0) // to bring the collection below the menu bar
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50,0,0,0) //To bring the position of the scrollview at proper place
   
    collectionView?.isPagingEnabled = true
    }
    
    func setUpNavigationBar() {
        let image = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
    
        let searchbutton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchBar))
        
        let  morebutton = UIBarButtonItem(image:UIImage(named:""), style: .plain, target: self, action: #selector(editBar))
        self.navigationItem.rightBarButtonItems = [ searchbutton , morebutton ]
    
    }
    
    
    
    func searchBar() {
        scrollToMenuIndex(index: 2)
    }
    
    
    
    func scrollToMenuIndex(index:Int) {
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    
//        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())

    }
    
    
    func editBar() {
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customcell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
//      
//        let cellcolorArray : [UIColor] = [.red,.blue,.green, .black]
//        customcell.backgroundColor = cellcolorArray[indexPath.row]
        return customcell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width:collectionView.frame.width,height:self.view.frame.height)

    }

    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.x)
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/4
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
//        let indexPath = NSIndexPath(forItem: Int(index), inSection: 0)
        let indexPath = IndexPath(item: Int(index), section: 0)
//        menuBar.collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: .None)
        
        
        //DRAGGING VIA CACHING
        menuBar.collectioView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier , for: indexPath) as! CustomCell
//        customCell.backgroundColor = .white
//        
//        customCell.video = videos?[indexPath.row]
//        
//        return customCell
//        
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return  videos?.count ?? 0
//    }
//    
//    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        
//        let height =  ( collectionView.frame.width - 16 - 16 ) * 9/16
//        return CGSize(width:collectionView.frame.width,height:height + 16 + 68)
//        
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }



    lazy var menuBar: SelectionBar = {
        let mb = SelectionBar()
        mb.homeController = self //reference to homecontroller to call the scroll function
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




