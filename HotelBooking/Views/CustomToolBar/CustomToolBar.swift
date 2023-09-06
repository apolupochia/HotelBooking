//
//  CustomToolBar.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 05.09.2023.
//

import Foundation
import SwiftUI



struct CustomToolBarContent: ToolbarContent {

    var firstTextLine = ""
    var secondTextLine = ""
    

    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            VStack(alignment: .center) {
                Text(firstTextLine)
                    .font(.custom("SF-Pro-Display-Medium", size: 18))
                    .foregroundColor(Color(hex: "000000"))
                if secondTextLine != ""{
                    Text(secondTextLine)
                        .font(.custom("SF-Pro-Display-Medium", size: 18))
                        .foregroundColor(Color(hex: "000000"))
                }
            }
        }
    }
}


struct CustomToolBarBackButtonContent: ToolbarContent {
    @ObservedObject var coordinator : Coordinator

    var body: some ToolbarContent {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    coordinator.backButton()
                } label: {
                    Image("vector-3")
                        .resizable()
                        .frame(width: 6, height: 12)
                        .foregroundColor(Color(hex: "000000"))
                }
                    .frame(width: 15, height: 15)
        }
    }
}
