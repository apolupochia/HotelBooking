//
//  BlockWithReservationDataView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct BlockWithReservationDataView: View {
    @ObservedObject var coordinator : Coordinator
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        ]
    let left : [String] = ["Вылет из",  "Страна, город", "Даты", "Количество ночей", "Отель", "Номер",  "Питание", ]
    
    var right : [String] = [ ]
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        right.append(coordinator.bookingModel!.departure)
        right.append(coordinator.bookingModel!.arrivalCountry)
        right.append("\(coordinator.bookingModel!.tourDateStart) - \(coordinator.bookingModel!.numberOfNights)")
        right.append(coordinator.bookingModel!.tourDateStop)
        right.append(String(coordinator.bookingModel!.numberOfNights))
        right.append(coordinator.bookingModel!.hotelName)
        right.append(coordinator.bookingModel!.room)
        
        
    }
    var body: some View {
        if (coordinator.bookingModel != nil){
            LazyVGrid(columns: columns) {
                ForEach(Array(zip(left, right)), id: \.0) { item in
                    
                    Text(item.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight : .infinity, alignment: .top)
                        .padding(.top, 1)
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "828796"))
                    Text(item.1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight : .infinity, alignment: .top)
                        .padding(.top, 1)
                        .font(.custom("SF-Pro-Display-Regular", size: 16))
                        .foregroundColor(Color(hex: "000000"))
                    
                    
                }
            }
            .padding()
            .background(Color(hex: "FFFFFF"))
            .cornerRadius(15)
            
        }
    }

}

struct BlockWithReservationDataView_Previews: PreviewProvider {
    static var previews: some View {
        BlockWithReservationDataView(coordinator: Coordinator())
    }
}
