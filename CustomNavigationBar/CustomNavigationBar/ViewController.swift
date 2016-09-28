//
//  ViewController.swift
//  NavigationBarTitle
//
//  Created by ShrawanKumar Sharma on 28/09/16.
//  Copyright © 2016 Notification. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var  i = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btnName = UIButton()
        //btnName.setImage(UIImage(named: "imagename"), forState: .Normal)
        btnName.frame = CGRect(x: 0, y: 0, width: 65, height: 22)
        btnName.addTarget(self, action: #selector(ViewController.buttonAction), for: .touchUpInside)
        btnName.backgroundColor = UIColor.red
        btnName.setTitleColor(UIColor.black, for: .normal)
        btnName.setTitle("1", for: .normal)
        btnName.backgroundColor = UIColor.clear
        btnName.layer.borderWidth = 1
        btnName.setTitleColor(UIColor.black, for: .normal )
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.rightBarButtonItem = rightBarButton
      
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)

        
        
    }
    func buttonAction(){
        let button = self.navigationItem.rightBarButtonItem?.customView as? UIButton
        //        let newButton = button as? UIButton
        button?.setTitle("2", for: .normal)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



func update() {
    
    DispatchQueue.main.async {
        
      
       
        var button = UIButton()
        button = (self.navigationItem.rightBarButtonItem?.customView as? UIButton)!
        button.setTitle("\(self.i)", for: .normal)
        print(button.titleLabel?.text)
        self.i = self.i +  1
        button.setNeedsLayout()
        button.setNeedsDisplay()
    
        
    }

    }}
