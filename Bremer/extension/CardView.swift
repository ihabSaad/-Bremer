//
//  CardView.swift
//  Bremer
//
//  Created by ihab saad on 13/05/2026.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCard()
    }

    private func setupCard() {
        self.layer.cornerRadius = 15
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowRadius = 12
        self.layer.shadowOpacity = 0.5
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
        self.layer.masksToBounds = false
    }
}
