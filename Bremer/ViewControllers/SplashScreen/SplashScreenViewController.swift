//
//  SplashScreenViewController.swift
//  Bremer
//
//  Created by ihab saad on 02/02/2026.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    // MARK: -  OutLet
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameRestaurantLabel: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            imageView.alpha = 0
            nameRestaurantLabel.text = ""
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.goToLoginViewController()
            }
            
            startImageAnimation()
        }
        
        // MARK: - Animations
        private func startImageAnimation() {
            imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseInOut, animations: {
                self.imageView.alpha = 1
                self.imageView.transform = .identity
            }) { _ in
                
                self.typeText(for: "Bremer®\nRestaurants")
            }
        }
        
        private func typeText(for text: String) {
            var charIndex = 0.0
            for letter in text {
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
                    self.nameRestaurantLabel.text?.append(letter)
                }
                charIndex += 1
            }
        }
    }


extension SplashScreenViewController {
    
    private func goToLoginViewController(){
        let loginVC = loginViewController()
        loginVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
