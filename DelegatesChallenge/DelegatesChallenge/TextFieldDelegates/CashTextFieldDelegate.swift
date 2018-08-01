//
//  CashTextFieldDelegate.swift
//  DelegatesChallenge
//
//  Created by Michael Romero on 7/31/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    var cashStringInInt: Int = 0
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" {
            cashStringInInt /= 10
            return true
        }
        
        if let intString = Int(string) {
            cashStringInInt *= 10
            cashStringInInt += intString
            
            let decimalCash = Double(cashStringInInt) / 100.0
            let decimalCashString = String(format: "%.2f", arguments: [decimalCash])
            let cashString = "$\(decimalCashString)"

            textField.text = cashString
            return false
        }
        else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

