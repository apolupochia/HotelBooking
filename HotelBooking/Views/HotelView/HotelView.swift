//
//  HotelView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct HotelView: View {
    @ObservedObject var coordinator : Coordinator
    private static let topId = "topIdHere"
    var body: some View {
        
        ZStack{
            if coordinator.hotelModel != nil{
                Color(hex: "#F5F5F5")
                ScrollViewReader{ reader in
                    ScrollView(.vertical, showsIndicators: false) {
                        CarouselOfPhotosView(carousel: coordinator.imagesForHotel)
                            .id(Self.topId)
                        BasicInformationAboutTheHotelView(coordinator: coordinator)
                        DetailInformationAboutHotelView(coordinator: coordinator)
                        NumberSelectionButtonView(coordinator: coordinator)

                    }
                    .onChange(of: coordinator.toTop[0]){  i in
                            reader.scrollTo(Self.topId, anchor: .top) // scroll
                    }
                    
                }
            }
            else {
                ProblemWithInternetView()
            }
        }
        .refreshable {
            coordinator.getInfoAboutHotel()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomToolBarContent(firstTextLine : "Отель")
        }
        
        
    }

}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView(coordinator: Coordinator())
    }
}
