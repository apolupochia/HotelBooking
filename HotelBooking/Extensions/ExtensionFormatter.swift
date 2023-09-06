//
//  ExtensionFormatter.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 04.09.2023.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}
