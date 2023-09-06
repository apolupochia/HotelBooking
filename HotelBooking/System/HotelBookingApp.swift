//
//  HotelBookingApp.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

@main
struct HotelBookingApp: App {
    @StateObject var coordinator = Coordinator()
    @State var afa = false
    var body: some Scene {
        WindowGroup {

     //       ContentView()
                      CoordinatorView()
                    .environmentObject(coordinator)
            }
    
    }
}
