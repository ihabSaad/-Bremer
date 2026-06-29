//
//  Table.swift
//  Bremer
//
//  Created by ihab saad on 02/02/2026.
//

import Foundation



struct TablesResponse: Codable {
    let record: TableRecord
}

struct TableRecord: Codable {
    let tables: [Table]
}

struct Table: Codable {
    let tableNumber: String
    let status: TableStatus
}
enum TableStatus: String, Codable {
    case available
    case reserved
}
