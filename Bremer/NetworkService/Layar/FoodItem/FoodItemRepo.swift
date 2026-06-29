//
//  FoodItemRepo.swift
//  Bremer
//
//  Created by ihab saad on 11/05/2026.
//

import Foundation


class FoodItemRepo {
    
    var service: FoodItemServiceProtocol
    init(service: FoodItemServiceProtocol = FoodItemService()) {
        self.service = service
    }
    
    func getFoodItems(completion: @escaping (ResponseStatus<FoodResponse>) -> Void) {
        service.getFoodItems(completion: completion)
    }
}
