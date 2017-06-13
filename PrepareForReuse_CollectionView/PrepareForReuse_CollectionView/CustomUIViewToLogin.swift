//
//  CustomUIViewToLogin.swift
//  PrepareForReuse_CollectionView
//
//  Created by SKS on 01/06/17.
//  Copyright © 2017 PrepareForReuse_CollectionView. All rights reserved.
//

import UIKit

class CustomUIViewToLogin: UIView ,UITextFieldDelegate{

    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override init(frame : CGRect){
        super.init(frame: frame)
        addDelegate()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addDelegate()
        
    }
    
    func addDelegate(){
        secondName.becomeFirstResponder()
        phoneNumber.keyboardType = .phonePad
        firstName.delegate = self
        secondName.delegate = self
        phoneNumber.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("text filed editing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("text field end editing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        if (( firstName.text?.characters.count != 0 ) && ( secondName.text?.characters.count != 0 ) ){
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
