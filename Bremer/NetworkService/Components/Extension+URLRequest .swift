//
//  Extension+URLRequest .swift
//  Talabat
//
//  Created by ihab saad on 02/01/2026.
//

import Foundation


extension URLRequest {
    
    // MARK: - Request

    init(url: URL, endPoint: EndPoint) {
        self.init(url: url, timeoutInterval: Constants.URLs.timeout)
        httpMethod = endPoint.httpMethods.rawValue
        
        addValue("application/json", forHTTPHeaderField: "Content-Type")
        addValue("application/json", forHTTPHeaderField: "Accept")
        addValue("iOS", forHTTPHeaderField: "Platform")
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            addValue(version, forHTTPHeaderField: "version")
          }

        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            addValue(build, forHTTPHeaderField: "build-Number")
          }


        
    //    if let token = UserDefaultsTokenStorage.shared.get()  {
      //      addValue(token, forHTTPHeaderField: "x-auth-token")
            
            endPoint.httpHeaders?.forEach { key, Value in
                addValue(Value, forHTTPHeaderField: key)
            }
            
        if let body = endPoint.body,![HTTPMethod.get, HTTPMethod.delete].contains(endPoint.httpMethods) {
                
        guard  let dic = (body as? Codable)?.asDictionary() else { return }
                
         guard let jsonData = try? JSONSerialization.data(withJSONObject: dic) else { return }
            httpBody = jsonData
            }
        }
    }




