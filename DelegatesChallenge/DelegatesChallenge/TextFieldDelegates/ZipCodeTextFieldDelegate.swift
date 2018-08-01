//
//  ZipCodeTextFieldDelegate.swift
//  DelegatesChallenge
//
//  Created by Michael Romero on 7/31/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        if newText.integerValue == 0 && newText != "" {
            return false
        }
        else {
            return newText.length <= 5
        }
    }
}
