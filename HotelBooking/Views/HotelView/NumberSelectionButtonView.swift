//
//  NumberSelectionButtonView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct NumberSelectionButtonView: View {
    @ObservedObject var coordinator : Coordinator
    var body: some View {
        if coordinator.hotelModel != nil{
            VStack{
                Button {
                    coordinator.goHotelRooms()
                } label: {
                    HStack{
                        Spacer()
                        Text("К выбору номера")
                            .font(.custom("SF-Pro-Display-Medium", size: 16))
                            .foregroundColor(Color(hex: "#FFFFFF"))
                        Spacer()
                    }
                    
                }
                
                .frame(height: 48)
                .background(Color(hex: "#0D72FF"))
                .cornerRadius(15)
            }
            .padding()
            .background(Color(hex: "FFFFFF"))
            .cornerRadius(12)
        }
    }
}

struct NumberSelectionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumberSelectionButtonView(coordinator: Coordinator())
    }
}
