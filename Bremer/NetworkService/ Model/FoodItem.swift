//
//  FoodItem.swift
//  Bremer
//
//  Created by ihab saad on 11/05/2026.
//

import Foundation

struct FoodResponse: Codable {
    let record: [FoodItem] 
}

struct FoodItem: Codable {
    let name: String
    let image: String
}
