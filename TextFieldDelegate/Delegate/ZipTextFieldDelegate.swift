//
//  ZipTextFieldDelegate.swift
//  TextFieldDelegate
//
//  Created by muhammad.farisi on 09/11/19.
//  Copyright © 2019 Pharese. All rights reserved.
//

import Foundation
import UIKit

class ZipTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        _ = "test"
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
        ) -> Bool {
        
        textField.text = "hahaha"
        return true
//
//        if string.count > 5 {
//            return false
//        } else {
//            return true
//        }
    }
    
    
}
