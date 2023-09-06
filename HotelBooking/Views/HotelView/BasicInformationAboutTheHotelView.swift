//
//  BasicInformationAboutTheHotelView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct BasicInformationAboutTheHotelView: View {
    @ObservedObject var coordinator : Coordinator
    var body: some View {
        if coordinator.hotelModel != nil{
            VStack(alignment: .leading){
                HStack(spacing: 0){
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(hex: "FFA800"))
                    
                    Text(" \(coordinator.hotelModel?.rating ?? 0) \(coordinator.hotelModel?.ratingName ?? " ")")
                        .font(.custom("SF-Pro-Display-Medium", size: 16))
                        .foregroundColor(Color(hex: "FFA800"))
                        .opacity(1)
                    
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(hex: "FFC700").opacity(0.20))
                .cornerRadius(5)
                
                
                
                Text(coordinator.hotelModel?.name ?? " ")
                    .font(.custom("SF-Pro-Display-Medium", size: 22))
                    .foregroundColor(Color(hex: "000000"))
                    .padding(.vertical, 8)
                
                Text(coordinator.hotelModel?.adress ?? " ")
                    .font(.custom("SF-Pro-Display-Medium", size: 14))
                    .foregroundColor(Color(hex: "0D72FF"))
                
                
                HStack(alignment: .bottom){
                    
                    Text( "от \(String(coordinator.hotelModel!.minimalPrice.formattedWithSeparator)) ₽")
                        .font(.custom("SF-Pro-Display-Semibold", size: 30))
                        .foregroundColor(Color(hex: "000000"))
                    + Text("  \(coordinator.hotelModel?.priceForIt ?? " ")")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "828796"))
                    
                }
                .padding(.vertical)
            }
            .padding(.leading)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding(.vertical)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .background(Color.white)
            .cornerRadius(15)
        }

    }
}

struct BasicInformationAboutTheHotelView_Previews: PreviewProvider {
    static var previews: some View {
        BasicInformationAboutTheHotelView(coordinator: Coordinator())
    }
}


