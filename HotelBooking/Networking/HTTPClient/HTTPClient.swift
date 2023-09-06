//
//  HTTPClient.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 31.08.2023.
//

import Foundation

struct HTTPClient {
    
    static let shared = HTTPClient()
    
    typealias completeClosure = (_ data: Data?, _ error: Error?) -> Void
    func getRequest(request: URLRequest, callback: @escaping completeClosure) {
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            callback(data, error)
        }
        .resume()
    }
   
}

public enum HTTPMethod : String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}
