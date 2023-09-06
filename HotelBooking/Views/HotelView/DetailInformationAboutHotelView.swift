//
//  DetailInformationAboutHotelView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct DetailInformationAboutHotelView: View {
    @ObservedObject var coordinator : Coordinator

    var body: some View {
        if coordinator.hotelModel != nil{
            VStack(alignment: .leading){
                Text("Об отеле")
                    .font(.custom("SF-Pro-Display-Medium", size: 22))
                    .foregroundColor(Color(hex: "000000"))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                if let hotelModel = coordinator.hotelModel, let aboutTheHotel = hotelModel.aboutTheHotel{
                    
                    WrappedHStackView(words: aboutTheHotel.peculiarities)
                    
                }
                Text(coordinator.hotelModel?.aboutTheHotel.description ?? "")
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "000000").opacity(0.90))
                    .padding(.vertical)
                
                VStack(alignment : .center, spacing: 0){
                    ForEach(detailedInformationHotel){ info in
                        buttons(info: info)
                            .padding(.horizontal)
                            .padding(.vertical)
                        if (detailedInformationHotel.last != info){
                            Rectangle()
                                .frame(height: 1)
                                .padding(.horizontal, 32)
                            
                        }
                        
                    }
                    
                    .background(Color(hex: "#FBFBFC"))
                }
                .cornerRadius(15)
                
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(12)
            
            
            
        }
    }
    
    
    func buttons(info : DetailedInformationHotelModel) -> some View {
        Button {
            
        } label: {
            HStack{
                Image(info.image)
                    .resizable()
                    .frame(width: 24, height: 24)
                    
                VStack(alignment: .leading){
                    Text(info.textTitle)
                        .font(.custom("SF-Pro-Display-Medium", size: 16))
                        .foregroundColor(Color(hex: "2C3035"))
                    Text(info.texInfo)
                        .font(.custom("SF-Pro-Display-Medium", size: 14))
                        .foregroundColor(Color(hex: "828796"))
                    
                }
                Spacer()
                Image( "Vector 55 1")
                    .resizable()
                    .foregroundColor(Color(hex: "2C3035"))
                  
                    .frame(width: 6, height: 12)
                    
            }
        }
    }
}

struct DetailInformationAboutHotelView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInformationAboutHotelView(coordinator: Coordinator())
    }
}






