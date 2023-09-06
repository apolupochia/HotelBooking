//
//  BookingViewButton.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 31.08.2023.
//

import SwiftUI

struct BookingViewButton: View {
    @ObservedObject var coordinator : Coordinator
    @State var date = Date()
    @State var country = ""
    var body: some View {
        VStack{
            Button {
                if checkValid() {
                    withAnimation {
                        coordinator.goPaidRoom()
                    }
                }
            } label: {
                HStack{
                    Spacer()
                    Text("Оплатить")
                        .font(.custom("SF-Pro-Display-Medium", size: 16))
                        .foregroundColor(Color(hex: "FFFFFF"))
                    Spacer()
                }
                
            }
            
            .frame(height: 48)
            .background(Color(hex: "0D72FF"))
            .cornerRadius(15)
            
        }
        .padding()
        .background(Color(hex: "FFFFFF"))
        .cornerRadius(12)
        
    }
    
    
    func checkValid() -> Bool{
        var answer = true
        let checkDataAboutPersons = CheckDataAboutPersons(coordinator: coordinator)
        let boolEmailAndPhone = checkDataAboutPersons.checkDataBookingInfoPerson()
        for id in 0..<coordinator.bookingInfoPersons.count{
            
            answer = checkDataAboutPersons.checkDataBookingInfoPersons(id: id, emailAndPhone: boolEmailAndPhone) && answer
        }
        return answer
    }

 
}

struct BookingViewButton_Previews: PreviewProvider {
    static var previews: some View {
        BookingViewButton(coordinator: Coordinator())
    }
}


enum countries : String , CaseIterable, Identifiable{
    var id: String { self.rawValue }
    case Russia = "Россия"
    case GreatBritain = "Великобритания1"
    case Russia1 = "Росси2я"
    case GreatBritain1 = "Великобритания3"
    case Russia2 = "Росси4я"
    case GreatBritain3 = "Великобритания5"
}
