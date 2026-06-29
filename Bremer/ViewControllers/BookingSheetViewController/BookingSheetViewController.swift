//
//  BookingSheetViewController.swift
//  Bremer
//
//  Created by ihab saad on 12/05/2026.
//

import UIKit

class BookingSheetViewController: UIViewController {

    @IBOutlet weak var guestsPicker: UIPickerView!
    @IBOutlet weak var tableNumberLabel: UILabel!
    
    let guestOptions = Array(1...10)
    var selectedTableNumber: String?
    var selectedGuests: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guestsPicker.delegate = self
        guestsPicker.dataSource = self

        if let tableNum = selectedTableNumber {
            tableNumberLabel.text = "Great Choice! Table #\(tableNum.uppercased()) is now reserved for your selection."
        }
       
    }
    
    @IBAction func proceedToPayment(_ sender: Any) {
        
        let paymentVC = PaymentViewController()
        paymentVC.selectedTableNumber = selectedTableNumber
        paymentVC.numberOfGuests = selectedGuests
        present(paymentVC, animated: true)
    }
}


extension BookingSheetViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guestOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return "\(guestOptions[row]) Persons"
        }

        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            let title = "\(guestOptions[row]) Persons"
            return NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGuests = guestOptions[row]
    }
}


