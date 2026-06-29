//
//  TablesCollectionViewCell.swift
//  Bremer
//
//  Created by ihab saad on 02/02/2026.
//

import UIKit

class TablesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - OutLets
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var tableNumberLabel: UILabel!
    @IBOutlet weak private var statusLabel: UILabel!
    @IBOutlet weak private var lockImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
        containerView.clipsToBounds = false
        
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 10
        
        statusLabel.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        statusLabel.text = ""
        containerView.alpha = 1
        isUserInteractionEnabled = true
    }
    
    func configure(with table: Table) {
        
        tableNumberLabel.text = table.tableNumber
        containerView.layer.borderWidth = 2.0
        
        switch table.status {
            
        case .available:
            
            let royalGold = UIColor(red: 0.85, green: 0.70, blue: 0.35, alpha: 1.0)
            
            containerView.backgroundColor = .black
            containerView.layer.borderColor = royalGold.cgColor
            
            tableNumberLabel.textColor = royalGold
            statusLabel.text = "Available"
            statusLabel.textColor = .white
            
            lockImage.isHidden = true
            
            containerView.layer.shadowColor = royalGold.cgColor
            
        case .reserved:
            
            let darkColor = UIColor(white: 0.2, alpha: 1.0)
            
            containerView.backgroundColor = .clear
            containerView.layer.borderColor = darkColor.cgColor
            
            tableNumberLabel.textColor = darkColor
            statusLabel.text = "Reserved"
            statusLabel.textColor = darkColor
            
            lockImage.isHidden = false
            lockImage.tintColor = darkColor
            
            containerView.layer.shadowOpacity = 0
        }
    }
}

