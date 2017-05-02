//
//  ViewController.swift
//  CustomViewOnViewController
//
//  Created by SKS on 29/04/17.
//  Copyright © 2017 TableViewProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    
        let customView = CustomUIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        let nib = UINib(nibName: "CustomUIView", bundle: nil)
        let objects = nib.instantiate(withOwner: customView, options: nil)
        customView.addSubview(objects.first as! UIView)
        self.view.addSubview(customView)
    
    }


}

