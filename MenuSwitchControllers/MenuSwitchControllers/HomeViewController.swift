//
//  ViewController.swift
//  MenuSwitchControllers
//
//  Created by SKS on 03/06/17.
//  Copyright © 2017 MenuController. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        registerCell()
        
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isTranslucent = false
        setupNavigationBar()
    }
    
    
    func setupNavigationBar() {
        
        // Status bar view.
        if let keyWindow = UIApplication.shared.keyWindow {
            let statusBarView = UIView()
            statusBarView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: 20)
            statusBarView.backgroundColor = UIColor(colorLiteralRed: 70.0/255.0, green: 94.0/255.0, blue: 26.0/255.0, alpha: 1)
            keyWindow.addSubview(statusBarView)
        }
        
    }
    func registerCell(){
        var nib = UINib(nibName: String(describing: ChatCollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: ChatCollectionViewCell.self))

         nib = UINib(nibName: String(describing: StatusCollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: StatusCollectionViewCell.self))

         nib = UINib(nibName: String(describing: CallsCollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: CallsCollectionViewCell.self))

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
            case 0:
                return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StatusCollectionViewCell.self), for: indexPath)
            case 1:
                return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ChatCollectionViewCell.self), for: indexPath)
            
            case 2:
                return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CallsCollectionViewCell.self), for: indexPath)
             
            default:
                return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 3
    }
    
    
    
}

extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width , height: self.collectionView.frame.size.height)
    }
}
