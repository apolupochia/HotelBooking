//
//  HotelRoomCell.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct HotelRoomCellView: View {
    @ObservedObject var coordinator : Coordinator
    let room : RoomCustom
 //   let images : [UIImage]
    var body: some View {
        
        VStack{
            CarouselOfPhotosView(carousel: room.image)
            Text(room.name)
                .font(.custom("SF-Pro-Display-Medium", size: 22))
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.horizontal)
                .foregroundColor(Color(hex: "000000"))
            
            WrappedHStackView(words: room.peculiarities)
            
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.horizontal)
            Button {
                
            } label: {
                HStack{
                    Text("Подробнее о номере")
                        .font(.custom("SF-Pro-Display-Medium", size: 16))
                        .foregroundColor(Color(hex: "0D72FF"))
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 6, height: 12)
                        .foregroundColor(Color(hex: "0D72FF"))
                    
                }
            }
            .padding(5)
            .background(Color(hex: "#0D72FF").opacity(0.10))
            .cornerRadius(5)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding(.horizontal)
            
            HStack(alignment: .bottom){
                
                Text( "\(String(room.price.formattedWithSeparator)) ₽")
                    .font(.custom("SF-Pro-Display-Semibold", size: 30))
                    .foregroundColor(Color(hex: "#000000"))
                
                + Text("  \(room.pricePer.lowercased())")
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "828796"))
                
            }
            .padding(.vertical)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding(.horizontal)
            
            Button {
                coordinator.goBookingRoom()
            } label: {
                HStack{
                    Spacer()
                    Text("Выборать номер")
                        .font(.custom("SF-Pro-Display-Medium", size: 16))
                        .foregroundColor(Color(hex: "FFFFFF"))
                    Spacer()
                }
                
            }
            .frame(height: 48)
            .background(Color(hex: "0D72FF"))
            .cornerRadius(15)
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(15)
    }
    
}

//struct HotelRoomCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        HotelRoomCellView(coordinator: Coordinator(), room: RoomCustom(
//            id: 1,
//                  name: "Стандартный номер с видом на бассейн",
//                  price: 186600,
//            pricePer: "За 7 ночей с перелетом",
//            peculiarities: [
//                "Включен только завтрак",
//                "Кондиционер"
//            ],
//            imageUrls: nil
//        ))
//    }
//}
