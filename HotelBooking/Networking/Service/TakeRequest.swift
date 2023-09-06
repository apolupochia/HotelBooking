//
//  TakeRequest.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 31.08.2023.
//

import Foundation

final class TakeRequest{
    static func requestForHTTP(urlString : String) -> URLRequest? {
        guard let url = URL(string: urlString) else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
