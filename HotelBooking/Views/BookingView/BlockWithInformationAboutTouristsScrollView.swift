//
//  BlockWithInformationAboutTouristsScrollView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 02.09.2023.
//

import SwiftUI

struct BlockWithInformationAboutTouristsScrollView: View {
    @ObservedObject var coordinator : Coordinator
    var body: some View {
        if (coordinator.bookingModel != nil){
            ZStack{
                Color(hex: "#FBFBFC")
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(coordinator.bookingInfoPersons){ info in
                        BlockWithInformationAboutTouristsView(coordinator: coordinator, id: info.id )
                    }
                    
                }
            }
        }
    }
}

struct BlockWithInformationAboutTouristsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        BlockWithInformationAboutTouristsScrollView(coordinator: Coordinator())
    }
}
