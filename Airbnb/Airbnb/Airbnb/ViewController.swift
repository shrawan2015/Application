//
//  ViewController.swift
//  Airbnb
//
//  Created by SKS on 07/11/16.
//  Copyright © 2016 Airbnb. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ChangeColor {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    var color:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sideMenu" {
            let containerViewController = segue.destination as! SlideViewController
            containerViewController.delegate = self
            
            }
    }
    
    func changeColor(number: Int) {
        switch number {
        case 0:
            color = .red
            break
        case 1:
            color = .blue
        case 2:
            color = .green
        default:
            color = .yellow
        }
        
        loginButton.backgroundColor = color
        signUpButton.backgroundColor = color
    }
    
}

