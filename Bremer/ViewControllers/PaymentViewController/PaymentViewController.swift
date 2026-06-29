//
//  PaymentViewController.swift
//  Bremer
//
//  Created by ihab saad on 12/05/2026.
//

import UIKit

class PaymentViewController: UIViewController {

    
    @IBOutlet weak private var cardNumberTextField: UITextField!
    @IBOutlet weak private var cardNameTextField: UITextField!
    @IBOutlet weak private var depositTextField: UITextField!

    @IBOutlet weak private var cardNameOnCardLabel: UILabel!
    @IBOutlet weak private var cardNumberOnCardLabel: UILabel!
    @IBOutlet weak private var totalAmountLabel: UILabel!
    @IBOutlet weak private var payButton: UIButton!
    
    
    var selectedTableNumber: String?
    var numberOfGuests: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            payButton.isEnabled = false
            payButton.alpha = 0.5
            cardNameOnCardLabel.text = "YOUR NAME"
            cardNumberOnCardLabel.text = "**** **** **** **"
            totalAmountLabel.text = "Total Payment: 0 EGP"
            
            cardNumberTextField.keyboardType = .numberPad
            depositTextField.keyboardType = .numberPad

    }
    
    @IBAction func cardNumberDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
            
            if text.count <= 14 {
                cardNumberOnCardLabel.text = text
            } else {
                sender.text = String(text.prefix(14))
            }
    }
    
    @IBAction func cardNameDidChange(_ sender: UITextField) {
        let name = sender.text ?? ""
            
            if name.isEmpty {
                cardNameOnCardLabel.text = "YOUR NAME"
            } else {
                cardNameOnCardLabel.text = name.uppercased()
            }
    }
    
    @IBAction func amountFieldDidChange(_ sender: UITextField) {
        let amount = sender.text ?? ""
            
            totalAmountLabel.text = "Total Payment: \(amount) EGP"
            
            if amount == "100" {
                totalAmountLabel.textColor = .systemYellow
                sender.layer.borderColor = UIColor.clear.cgColor
                sender.layer.borderWidth = 0
                
                if !(cardNameTextField.text?.isEmpty ?? true) {
                    payButton.isEnabled = true
                    payButton.alpha = 1.0
                    payButton.setTitle("Confirm & Pay 100 EGP", for: .normal)
                }
                
            } else {
                totalAmountLabel.textColor = .systemRed
                
                sender.layer.borderColor = UIColor.systemRed.cgColor
                sender.layer.borderWidth = 1.0
                sender.layer.cornerRadius = 8
                
                payButton.isEnabled = false
                payButton.alpha = 0.5
                payButton.setTitle("Amount must be 100", for: .normal)
            }
    }
    
    @IBAction func payButton(_ sender: Any) {
        
        let successViewController = SuccessViewController()
        
        successViewController.tableNum  = selectedTableNumber ?? "N/A"
        successViewController.customerName = cardNameTextField.text ?? ""
        successViewController.paidAmount  = depositTextField.text ?? ""
        successViewController.numberOfGuests = numberOfGuests ?? 1
        successViewController.modalPresentationStyle = .fullScreen
        present(successViewController, animated: true)
    }
}

