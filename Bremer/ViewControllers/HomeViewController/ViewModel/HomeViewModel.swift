//
//  HomeViewModel.swift
//  Bremer
//
//  Created by ihab saad on 11/05/2026.

import RxSwift
import Foundation

enum ViewState {
    case loading
    case success
    case failure(message: String)
}

class HomeViewModel {
    
    // Repositories
    private let foodItemRepo = FoodItemRepo()
    private let tableRepo = TableRepo()
    
    let tablesState = PublishSubject<ViewState>()
    let foodsState = PublishSubject<ViewState>()
    
    // Data Sources
    var tables = [Table]()
    var foods = [FoodItem]()
    
    // MARK: - Networking Functions
    
    func fetchAllData() {
        fetchTables()
        fetchFoods()
    }
    
    private func fetchTables() {
        tablesState.on(.next(.loading))
        
        tableRepo.getTables { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.tables = data.record.tables
                self.tablesState.on(.next(.success))
            case .failure(_, let message):
                self.tablesState.onNext(.failure(message: message))
            }
        }
    }
    
    private func fetchFoods() {
        foodsState.on(.next(.loading))
        
        foodItemRepo.getFoodItems { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.foods = data.record
                self.foodsState.on(.next(.success))
            case .failure(_, let message):
                self.foodsState.onNext(.failure(message: message))
            }
        }
    }
}
