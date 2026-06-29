
//  NetworkManager.swift
//  Created by ihab saad on 28/12/2025.


import Foundation

final class NetworkManager {
    
    
 private  var task: URLSessionDataTask? = nil
 private  var networkLogger = NetworkLogger()
    func request<T: Codable>(type: T.Type, endPoint: EndPoint, completion: @escaping (ResponseStatus<T>) -> Void ) {

        
        // MARK: - URL
        guard let url = URLComponents(endPoint: endPoint)?.url else {
            completion(.failure(statusCode: 0, message: "Invalid URL"))
            return
        }
        

        // MARK: - Request
   
       let request = URLRequest(url: url, endPoint: endPoint)

        // MARK: - Network Call
      task =  URLSession.shared.dataTask(with: request) { data, response, error in

          self.logNetworkRequest(task: self.task, data: data,response: response, body: endPoint.body, error: error)
            
            // Error
            if let error {
                completion(.failure(statusCode: 0, message: error.localizedDescription))
                return
            }

            // Data
            guard let data else {
                completion(.failure(statusCode: 0, message: "NO DATA"))
                return
            }

            // Response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(statusCode: 0, message: "NO RESPONSE"))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
            guard let fail = try? JSONDecoder().decode(Fail.self, from: data) else {
                completion(.failure(statusCode: httpResponse.statusCode,message: "Request failed" ))
                    return
                }
                completion(.failure( statusCode: httpResponse.statusCode, message: fail.message ?? "Request failed"))
                   return
            }
            
            // Decode
            do {
                let dataResponse = try JSONDecoder().decode(type, from: data)
                completion(.success(dataResponse))
                print(dataResponse)
            } catch let error {
                completion(.failure(statusCode: 0, message: error.localizedDescription))
            }

        }
        task?.resume()
    }
    
    private func logNetworkRequest(task: URLSessionDataTask?, data: Data?, response: URLResponse?, body: Any?, error: Error?) {
        let url: String = task?.originalRequest?.url?.absoluteString ?? ""
        let headers: HttpHeaders = task?.originalRequest?.allHTTPHeaderFields ?? [:]
        let responseBody = String(data: data ?? Data(), encoding: .utf8) ?? ""
        let statusCode: Int = (task?.response as? HTTPURLResponse)?.statusCode ?? 0

        networkLogger.debugNetworkLog(url: url, data: data,response: response, headers: headers, body: body, error: error
        )
    }
}

