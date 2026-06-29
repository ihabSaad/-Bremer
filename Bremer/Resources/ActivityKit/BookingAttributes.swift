//
//  BookingAttributes.swift
//  Bremer
//
//  Created by ihab saad on 14/05/2026.
//


import ActivityKit
import Foundation

struct BookingAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var endTime: Date
    }

    var tableNumber: String
    var restaurantName: String = "Bremer"
}
