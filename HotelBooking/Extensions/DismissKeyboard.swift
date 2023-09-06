//
//  DismissKeyboard.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 06.09.2023.
//

import Foundation
import SwiftUI

extension View {
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
