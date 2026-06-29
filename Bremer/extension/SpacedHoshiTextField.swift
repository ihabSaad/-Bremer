//
//  f.swift
//  Bremer
//
//  Created by ihab saad on 02/02/2026.
//


import Foundation
import UIKit
import TextFieldEffects

class SpacedHoshiTextField: HoshiTextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
     
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
}
