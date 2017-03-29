//
//  SlideViewController.swift
//  Airbnb
//
//  Created by SKS on 12/11/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit


protocol ChangeColor {
    func changeColor(number:Int)
}


class SlideViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate:ChangeColor? = nil
    
    
    let cellID = "SlideViewCell"
    
    
        var slideModelData : [SlideModel] = {
    
            var slideModelData = [SlideModel]()
            var sample1 = SlideModel()
            sample1.textString = "UNIQUE, \nAMAZING \nPLACES \nTO STAY -- \nHOSTED BY \nREAL PEOPLE"
            sample1.imageName = "airbnb4.jpg"
            slideModelData.append(sample1)
            sample1.textString = "FIND \nTHE \nPERFECT \nSPACE \nor simply browse the world's most inspiring accommodations."
            sample1.imageName = "airbnb4.jpg"
            slideModelData.append(sample1)
            sample1.textString = "BOOK IT \nIN A \nSNAP \nOnce your host accepts, you are good to go!"
            sample1.imageName = "airbnb4.jpg"
            slideModelData.append(sample1)

            return slideModelData
            
        }() 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
////        var slideModel1 = SlideModel()
////        slideModel1.imageName  = "live.jpg"
////        slideModel1.textString = "living"
////        
//        slideModelData.insert(slideModel1, at: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return slideModelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SlideViewCell
        cell.slide = slideModelData[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.view.frame.width,height:self.view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(velocity)
        print(targetContentOffset)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("**** \(scrollView.contentOffset)")
        let row = scrollView.contentOffset.x / self.collectionView.frame.width
        delegate?.changeColor(number:Int(row))

    }
    

}
