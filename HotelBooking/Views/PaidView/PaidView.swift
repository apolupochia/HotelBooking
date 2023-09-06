//
//  PaidView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct PaidView: View {
    @ObservedObject var coordinator : Coordinator
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            
            Spacer()
            mainView()
            Spacer()
            Spacer()
            buttonView()
   
        }
        .edgesIgnoringSafeArea(.bottom)

        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar { CustomToolBarContent(firstTextLine : "Заказ оплачен") }
        .toolbar { CustomToolBarBackButtonContent(coordinator: coordinator) }
    }
    
    
    
    func mainView() -> some View{
        VStack{
            Image("paidImage")
                .resizable()
                .frame(width: 44, height: 44)
                .padding()
                .background(Color(hex: "F6F6F9"))
                .cornerRadius(50)
            
            Text("Ваш заказ принят в работу")
                .font(.custom("SF-Pro-Display-Medium", size: 22))
                .foregroundColor(Color(hex: "000000"))
                .padding()
            
            Text("Подтверждение заказа №\(String(Int.random(in: 100000..<999999))) может занять некоторое время (от 1 часа до суток).\nКак только мы получим ответ от туроператора, вам на почту придет уведомление.")
            
                .font(.custom("SF-Pro-Display-Regular", size: 16))
                .foregroundColor(Color(hex: "828796"))
                .padding()
        }
    }
    
    func buttonView() -> some View{
        VStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(Color(hex: "F6F6F9"))
            Button {

                coordinator.goHome()
            } label: {
                HStack{
                    Spacer()
                    Text("Супер")
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "FFFFFF"))
                    Spacer()
                }
                
            }
            .frame(height: 48)
            .background(Color(hex: "0D72FF"))
            .cornerRadius(15)
            .padding(.bottom, 35)
            .padding(.horizontal)
        }
    }
}

struct PaidView_Previews: PreviewProvider {
    static var previews: some View {
        PaidView(coordinator: Coordinator())
    }
}
