//
//  EnumsForCoordinator.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 06.09.2023.
//

import Foundation

enum MyPages : String, CaseIterable, Identifiable{
    case hotel, rooms, bookingRoom, paidRoom
    var id: String {self.rawValue}
}
