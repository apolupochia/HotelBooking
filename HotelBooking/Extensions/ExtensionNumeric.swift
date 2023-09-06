//
//  ExtensionNumeric.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 04.09.2023.
//

import Foundation

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
