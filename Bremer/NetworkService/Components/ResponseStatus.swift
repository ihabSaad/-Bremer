//
//  ResponseStatus.swift
//  Talabat
//
//  Created by ihab saad on 28/12/2025.
//

import Foundation


enum ResponseStatus<T: Codable> {
    
  case success(T)
  case failure(statusCode: Int, message: String)

}
