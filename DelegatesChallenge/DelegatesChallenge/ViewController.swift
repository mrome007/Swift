//
//  ViewController.swift
//  DelegatesChallenge
//
//  Created by Michael Romero on 7/31/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableSwitch: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.zipCodeTextField.keyboardType = .numberPad
        self.cashTextField.delegate = cashDelegate
        self.cashTextField.keyboardType = .numberPad
        self.lockableTextField.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = UIColor.black
        
        // Figure out what the new text will be, if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // returning true gives the text field permission to change its text
        return true;
    }

    @IBAction func lockableSwitchChanged(_ sender: Any) {
        lockableTextField.isUserInteractionEnabled = lockableSwitch.isOn
        lockableTextField.textColor = lockableTextField.isUserInteractionEnabled ? UIColor.black : UIColor.lightGray
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = UIColor.black
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return textField.isUserInteractionEnabled
    }
}

