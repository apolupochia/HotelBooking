//
//  BlockWithHotelView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct BlockWithHotelView: View {
    @ObservedObject var coordinator : Coordinator
    var body: some View {
        if (coordinator.bookingModel != nil){
            VStack(alignment: .leading){
                
                HStack(spacing: 0){
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(hex: "FFA800"))
                    Text(" \(coordinator.bookingModel!.horating) \(coordinator.bookingModel!.ratingName)")

                        .font(.custom("SF-Pro-Display-Medium", size: 16))
                        .foregroundColor(Color(hex: "FFA800"))
                    
                }
                .padding(5)
                .background(Color(hex: "FFC700").opacity(0.20))
                .cornerRadius(5)
                
                
                
                Text(coordinator.bookingModel!.hotelName)
                    .font(.custom("SF-Pro-Display-Medium", size: 22))
                    .foregroundColor(Color(hex: "000000"))
                    .padding(.bottom, 8)
                
                Text(coordinator.bookingModel!.hotelAdress)
                    .font(.custom("SF-Pro-Display-Medium", size: 14))
                    .foregroundColor(Color(hex: "0D72FF"))
                    .padding(.top, 0)
            }
            .padding(.vertical)
            .padding(.horizontal)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}

struct BlockWithHotelView_Previews: PreviewProvider {
    static var previews: some View {
        BlockWithHotelView(coordinator: Coordinator())
    }
}
