//
//  TableRepo.swift
//  Bremer
//
//  Created by ihab saad on 11/05/2026.
//

import Foundation


class TableRepo {
    
    var service: TableServiceProtocol
    init(service: TableServiceProtocol = TableService()) {
        self.service = service
    }
    
    func getTables(completion: @escaping (ResponseStatus<TablesResponse>) -> Void) {
        service.getTables(completion: completion)
    }
}
