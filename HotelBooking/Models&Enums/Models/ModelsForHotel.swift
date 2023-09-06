//
//  ModelsForHotel.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 05.09.2023.
//

import Foundation


let detailedInformationHotel = [
    DetailedInformationHotelModel( textTitle: "Удобства", texInfo: "Самое необходимое", image: "emoji-happy1"),
    DetailedInformationHotelModel( textTitle: "Что включено", texInfo: "Самое необходимое", image: "tick-square1"),
    DetailedInformationHotelModel( textTitle: "Что не включено", texInfo: "Самое необходимое", image: "close-square1"),
]


struct DetailedInformationHotelModel : Identifiable, Codable, Equatable{
    var id = UUID()
    let textTitle : String
    let texInfo : String
    let image : String
    
    
}
