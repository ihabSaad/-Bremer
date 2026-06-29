//
//  FoodItemService.swift
//  Bremer
//
//  Created by ihab saad on 11/05/2026.
//

import Foundation

protocol FoodItemServiceProtocol {
    
    func getFoodItems(completion: @escaping (ResponseStatus<FoodResponse>) -> Void)
}

class FoodItemService: FoodItemServiceProtocol {
    func getFoodItems(completion: @escaping (ResponseStatus<FoodResponse>) -> Void) {
        let endPoint = EndPoint(path: Constants.Path.foodMenu, httpMethods: .get)
        NetworkManager().request(type: FoodResponse.self, endPoint: endPoint, completion: completion)
    }
    
    
}
