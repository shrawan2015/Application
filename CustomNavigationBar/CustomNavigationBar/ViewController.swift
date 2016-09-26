//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by SKS on 27/09/16.
//  Copyright © 2016 YouTube-Swift3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceOutlet: UIBarButtonItem!
    var button = UIButton()
    var timer = Timer()
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
         timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)

        
               // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        priceOutlet =  UIBarButtonItem()
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50 ) )
        button.backgroundColor = UIColor.blue
        button.setTitle("$400", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        priceOutlet = UIBarButtonItem.init(customView: button)
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationItem.rightBarButtonItem = priceOutlet

        
        //priceOutlet.customView = button

        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = button
        self.navigationItem.rightBarButtonItem = rightBarButton

    }
    
    
    // must be internal or public.
    func update() {
        // Something cool
        i=i+1
        button.titleLabel?.text = "\( (i) * 200)"
        
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

