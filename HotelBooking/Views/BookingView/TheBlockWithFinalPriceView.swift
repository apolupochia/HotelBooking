//
//  TheBlockWithFinalPriceView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct TheBlockWithFinalPriceView: View {
    @ObservedObject var coordinator : Coordinator
    var body: some View {
        if (coordinator.bookingModel != nil){
            VStack(alignment: .leading,spacing: 0){
                HStack{
                    Text("Тур")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "828796"))
                    
                    Spacer()
                    
                    Text("\(coordinator.bookingModel!.tourPrice.formattedWithSeparator) ₽")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "000000"))
                }
                .padding(.bottom)
                
                HStack{
                    Text("Топливный сбор")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "828796"))
                    
                    Spacer()
                    
                    Text("\(coordinator.bookingModel!.fuelCharge.formattedWithSeparator) ₽")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "000000"))
                }
                .padding(.bottom)
                
                HStack{
                    Text("Сервисный сбор")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "828796"))
                    
                    Spacer()
                    
                    Text("\(coordinator.bookingModel!.serviceCharge.formattedWithSeparator) ₽")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "000000"))
                }
                .padding(.bottom)
                
                HStack{
                    Text("К оплате")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "828796"))
                    
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Text("\((coordinator.bookingModel!.tourPrice + coordinator.bookingModel!.fuelCharge + coordinator.bookingModel!.serviceCharge).formattedWithSeparator) ₽")
                    
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "0D72FF"))
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}

struct TheBlockWithFinalPriceView_Previews: PreviewProvider {
    static var previews: some View {
        TheBlockWithFinalPriceView(coordinator: Coordinator())
    }
}




