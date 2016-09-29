//
//  ViewController.swift
//  YouTube
//
//  Created by SKS on 24/09/16.
//  Copyright © 2016 YouTube-Swift3. All rights reserved.
//

import UIKit

class ViewController : UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 30/255, blue: 31/230, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 230/255, green: 30/255, blue: 31/230, alpha: 1)


        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 30 ))

        lable.font = UIFont(name: lable.font.fontName, size: 20)
        lable.textColor = UIColor.white
        navigationItem.titleView = lable
  
    
    
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:view.frame.width,height:180
        )
    
}
    
    

}



