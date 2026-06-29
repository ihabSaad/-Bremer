//
//  Extension+Encodable .swift
//  Talabat
//
//  Created by ihab saad on 29/12/2025.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dic = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]   else {
                return nil
                
            }
            return dic
        } catch {
            return nil
        }
    }
}


