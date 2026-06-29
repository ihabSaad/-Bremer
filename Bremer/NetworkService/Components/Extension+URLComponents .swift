//
//  Extension+URLComponents .swift
//  Talabat
//
//  Created by ihab saad on 29/12/2025.
//

import Foundation


extension URLComponents {
    
    init?(endPoint: EndPoint) {
        
        guard let baseUrlString = Constants.URLs.baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let baseURL = URL(string: baseUrlString) else {
            return nil
        }
        let fullURL = baseURL.appendingPathComponent(endPoint.path)
        
        self.init(url: fullURL, resolvingAgainstBaseURL: true)
        
        if let parameters = endPoint.parameters {
            self.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
    }
}
