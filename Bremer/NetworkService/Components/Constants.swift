//
//  Constants.swift
//  Talabat
//
//  Created by ihab saad on 28/12/2025.



import Foundation

struct Constants {

    enum URLs {
        
        static let baseUrl = "https://api.jsonbin.io/v3/b/"
        static let timeout: TimeInterval = 40
    }

    enum Path {
        // Auth
        static let foodMenu = "6a01f57c250b1311c3350c01"
        static let tables = "6a020233adc21f119a853955"
        static let login = "auth/users/login"
        static let meProfile = "auth/users/me"

    }
}
