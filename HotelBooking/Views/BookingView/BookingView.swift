//
//  BookingView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct BookingView: View {
    @ObservedObject var coordinator : Coordinator
    private static let topId = "topIdHere"
    @State var country = ""
    var body: some View {
        
        ZStack{
            if coordinator.bookingModel != nil{
                Color(hex: "#F5F5F5")

                ScrollViewReader{ reader in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack{
                            BlockWithHotelView(coordinator: coordinator)
                                .id(Self.topId)
                            BlockWithReservationDataView(coordinator: coordinator)
                            BlockWithInformationAboutBuyerView(coordinator: coordinator)
                            BlockWithInformationAboutTouristsScrollView(coordinator: coordinator)
                            AddNewBlockWithInformationAboutTouristsView(coordinator: coordinator)
                            TheBlockWithFinalPriceView(coordinator: coordinator)
                            BookingViewButton(coordinator: coordinator)
                        }
                        .padding(.vertical, 8)
                        
                    }
                    .onChange(of: coordinator.toTop[2]){  i in
                            reader.scrollTo(Self.topId, anchor: .top) // scroll
                    }
                }
            }
            else {
                ProblemWithInternetView()
            }
        }
        .refreshable {
                coordinator.getInfoAboutBooking()
  
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar { CustomToolBarContent(firstTextLine : "Бронирование") }
        .toolbar { CustomToolBarBackButtonContent(coordinator: coordinator) }
    }
    

}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(coordinator: Coordinator())
    }
}
