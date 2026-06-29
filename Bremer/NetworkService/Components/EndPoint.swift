//
//  EndPoint.swift
//  Talabat
//
//  Created by ihab saad on 28/12/2025.
//

import Foundation

typealias HttpHeaders = [String: String]
typealias Parameters = [String: Any]

struct EndPoint {
       let path: String
       let httpMethods:HTTPMethod
       let httpHeaders: HttpHeaders?
       let parameters: Parameters?
       let body: Any?
    
init(path: String,
     httpMethods: HTTPMethod,
     httpHeaders: HttpHeaders? = nil,
     parameters: Parameters? = nil,
     body: Any? = nil) {
        self.path = path
        self.httpMethods = httpMethods
        self.httpHeaders = httpHeaders
        self.parameters = parameters
        self.body = body
    }
}



