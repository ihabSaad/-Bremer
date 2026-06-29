//
//  NewItemCollectionViewCell.swift
//  Bremer
//
//  Created by ihab saad on 13/04/2026.
//

import UIKit
import Kingfisher

class NewItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageNewItem: UIImageView!
    @IBOutlet weak var nameNewItem: UILabel!
    
    let royalGold = UIColor(red: 0.85, green: 0.70, blue: 0.35, alpha: 1.0)
        
        func configure(item: FoodItem) {
            nameNewItem.text = item.name

            if let url = URL(string: item.image) {
                imageNewItem.kf.setImage(
                    with: url,
                    placeholder: UIImage(systemName: "photo"),
                    options: [
                        .transition(.fade(0.3)),
                        .cacheOriginalImage
                    ]
                )
            }
        }

        override func awakeFromNib() {
            super.awakeFromNib()
            setupPremiumDesign()
        }
        
        private func setupPremiumDesign() {
            imageNewItem.contentMode = .scaleAspectFill
            
            imageNewItem.layer.cornerRadius = 50
            imageNewItem.clipsToBounds = true
            
            imageNewItem.layer.borderWidth = 2.0
            imageNewItem.layer.borderColor = royalGold.cgColor
            
          
            self.layer.shadowColor = royalGold.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.layer.shadowRadius = 6
            self.layer.shadowOpacity = 0.4
            self.layer.masksToBounds = false
            
             nameNewItem.textColor = .white
            nameNewItem.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            nameNewItem.textAlignment = .center
        }
    }
