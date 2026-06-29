//
//  TableService.swift
//  Bremer
//
//  Created by ihab saad on 11/05/2026.
//

import Foundation
protocol TableServiceProtocol {
    func getTables(completion: @escaping (ResponseStatus<TablesResponse>) -> Void)
}


class TableService: TableServiceProtocol {
    
    func getTables(completion: @escaping (ResponseStatus<TablesResponse>) -> Void) {
        
        let endPoint = EndPoint(
            path: Constants.Path.tables,
            httpMethods: .get
        )
        NetworkManager().request(type: TablesResponse.self, endPoint: endPoint, completion: completion)
    }
}
