//
//  EnumsForChooseNationality.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 06.09.2023.
//

import Foundation

enum Countries: String, CaseIterable, Identifiable {
    case none = ""
    case kazakhstan = "Казахстан"
    case italian = "Италия"
    case mexican = "Россия"
    case chinese = "Китай"
    case indian = "Индия"
    case american = "Америка"
    case belarus = "Беларусь"
    

    var id: Countries { self }
}
