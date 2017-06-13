//
//  LoginViewController.swift
//  PrepareForReuse_CollectionView
//
//  Created by SKS on 01/06/17.
//  Copyright © 2017 PrepareForReuse_CollectionView. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    
    lazy var customUIViewToLogin : CustomUIViewToLogin? = {
        let feaature = Bundle.main.loadNibNamed("CustomUIViewToLogin", owner: self, options: nil)?.first as? CustomUIViewToLogin
        feaature?.frame = CGRect(x: 0, y: 380, width: self.view.frame.width, height: self.view.frame.height)
        feaature?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        //feaature?.delegate = self
        return feaature
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpGalaryView()
    }

    
    func popUpGalaryView(){
        
        self.view.addSubview(customUIViewToLogin!)
        let cuttentWindow = UIApplication.shared.keyWindow
        cuttentWindow?.addSubview(customUIViewToLogin!)
        //customUIViewToLogin?.firstName.delegate = self
        //customUIViewToLogin?.secondName.delegate = self
        //customUIViewToLogin?.phoneNumber.delegate = self
    }
    
    
}
