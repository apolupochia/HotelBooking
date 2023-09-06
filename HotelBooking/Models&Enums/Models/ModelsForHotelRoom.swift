//
//  ModelsForHotelRoom.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 05.09.2023.
//

import Foundation
import UIKit


// MARK: - Custom Model For Rooms

struct RoomsModelCustom {
    var rooms: [RoomCustom]
}

struct RoomCustom : Identifiable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    var image: [UIImage]?

}
