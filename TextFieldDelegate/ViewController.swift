//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by muhammad.farisi on 09/11/19.
//  Copyright © 2019 Pharese. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let TAG_ZIP_CODE_TF = 0
    private let TAG_CASH_TF = 1
    private let TAG_LOCKABLE_TF = 2
    
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var cashTF: UITextField!
    @IBOutlet weak var lockableTF: UITextField!
    @IBOutlet weak var lockableSwitch: UISwitch!
    
    private var cashValue: String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeTF.tag = TAG_ZIP_CODE_TF
        zipCodeTF.delegate = self
        
        cashTF.tag = TAG_CASH_TF
        cashTF.delegate = self
        
        lockableTF.tag = TAG_LOCKABLE_TF
        lockableTF.delegate = self
        
        cashTF.text = getCashTFData(number: NSNumber.init(value: getCashNumber()))
        
    }
    
    private func getCashNumber() -> Int {
        if let result = Int(cashValue) {
            return result
        } else {
            return 0
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField.tag {
        case TAG_ZIP_CODE_TF:
            let text = textField.text! as NSString
            let newText = text.replacingCharacters(in: range, with: string)
            if newText.count > 5 {
                return false
            } else {
                return true
            }
        case TAG_CASH_TF:
            cashValue = string + cashValue
            textField.text = getCashTFData(number: NSNumber.init(value: getCashNumber()))
            return false
        case TAG_LOCKABLE_TF:
            if lockableSwitch.isOn {
                return true
            } else {
                return false
            }
        default:
            return true
        }
    }
    
    private func getCashTFData(number: NSNumber) -> String {
        let numberFormater = NumberFormatter()
        numberFormater.minimumIntegerDigits = 1
        numberFormater.minimumFractionDigits = 2
        if let formetedResult = numberFormater.string(from: number) {
            return "$ \(formetedResult)"
        } else {
            return "$ 0.00"
        }
    }
    
    

}

