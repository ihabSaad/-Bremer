//
//  loginViewController.swift
//  Bremer
//
//  Created by ihab saad on 02/02/2026.
//

import UIKit
import TextFieldEffects

class loginViewController: UIViewController {
    
// MARK: -  OutLets
    @IBOutlet weak private var fullNameTextField: SpacedHoshiTextField!
    @IBOutlet weak private var phoneNumberTextField: SpacedHoshiTextField!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupHoshiTextFields()
        }
    
    @IBAction func presentHomeVC(_ sender: Any) {
        let homeVc = HomeViewController()
        homeVc.modalPresentationStyle = .fullScreen
        present(homeVc, animated: true)
    }
    
    
        
        private func setupHoshiTextFields() {
           
            fullNameTextField.layer.cornerRadius = 4
            phoneNumberTextField.layer.cornerRadius = 4
            
            let brandRed = UIColor(red: 0.906, green: 0.298, blue: 0.235, alpha: 1.0)
            let inactiveColor = UIColor.gray.withAlphaComponent(0.3)
            
            configureHoshi(fullNameTextField, placeholder: "Full Name", color: brandRed, inactive: inactiveColor)
            configureHoshi(phoneNumberTextField, placeholder: "Phone Number", color: brandRed, inactive: inactiveColor)
            
            phoneNumberTextField.keyboardType = .phonePad
        }
        
        private func configureHoshi(_ textField: HoshiTextField, placeholder: String, color: UIColor, inactive: UIColor) {
            textField.placeholder = placeholder
            textField.placeholderColor = .lightGray
            textField.borderActiveColor = color
            textField.borderInactiveColor = inactive
            textField.placeholderFontScale = 0.85
            
        
        }
    }
