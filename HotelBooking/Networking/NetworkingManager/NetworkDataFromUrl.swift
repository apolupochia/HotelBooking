//
//  NetworkDataFromUrl.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 05.09.2023.
//

import Foundation
import UIKit


protocol NetworkDataFromUrlProtocol{
    func getInfoFromUrl<T: Decodable>(urlString : String, responce: @escaping (T?) -> Void)
    func getImageFromUrl(urlString : String, responce: @escaping (UIImage?) -> Void)
}

class NetworkDataFromUrl : NetworkDataFromUrlProtocol{
    
    func getInfoFromUrl<T: Decodable>(urlString : String, responce: @escaping (T?) -> Void) {
       guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: urlString) else { return  }
      HTTPClient().getRequest(request: request) { data, error in

           guard  let data = data else {
               responce(nil)
               return
           }

           guard let newFiles = try? JSONDecoder().decode(T.self, from: data) else {
               responce(nil)
               return
           }
           responce(newFiles)

       }
  }
    
    func getImageFromUrl(urlString : String, responce: @escaping (UIImage?) -> Void) {
        guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: urlString) else { return  }
       HTTPClient().getRequest(request: request) { data, error in

            guard  let data = data else {
                responce(nil)
                return
            }

           
           let image =  UIImage(data: data)
           responce(image)

        }
   }
    
}
