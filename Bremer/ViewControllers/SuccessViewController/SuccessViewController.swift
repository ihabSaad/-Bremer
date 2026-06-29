//
//  SuccessViewController.swift
//  Bremer
//  Created by ihab saad on 13/05/2026.

import UIKit
import ActivityKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var depositAmountLabel: UILabel!
        
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var backToHomeButton: UIButton!

    var customerName: String = ""
    var tableNum: String = ""
    var numberOfGuests: Int = 0
    var paidAmount: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayQRCode()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3) {
            self.checkmarkImageView.alpha = 1
            self.checkmarkImageView.transform = .identity
        }
        UIView.animate(withDuration: 0.8, delay: 0.6) {
                self.statusLabel.alpha = 1
            
            }
        startLiveActivity()
    }

    private func setupUI() {
        checkmarkImageView.alpha = 0
        checkmarkImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        statusLabel.alpha = 0
        customerNameLabel.text = customerName
            tableNumberLabel.text = "#\(tableNum)"
            depositAmountLabel.text = "\(paidAmount) EGP"
            statusLabel.text = "Confirmed"
        
    
    }

    private func displayQRCode() {
        let qrContent = """
        Bremer Restaurant
        Name: \(customerName)
        Table: \(tableNum)
        Guests: \(numberOfGuests)
        Paid: \(paidAmount) EGP
        """
        
        qrImageView.image = generateQRCode(from: qrContent)
    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: .ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    

    func startLiveActivity() {
        
        let attributes = BookingAttributes(tableNumber: self.tableNum)
        let initialContentState = BookingAttributes.ContentState(endTime: Date().addingTimeInterval(3600))
        
        do {
            let activity = try Activity<BookingAttributes>.request(
                attributes: attributes,
                contentState: initialContentState,
                pushType: nil
            )
            print("Live Activity Started! ID: \(activity.id)")
        } catch {
            print("Error starting Live Activity: \(error.localizedDescription)")
        }
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
