//
//  HotelRoomView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct HotelRoomView: View {
    @ObservedObject var coordinator : Coordinator
    private static let topId = "topIdHere"
    
    var body: some View {
        
        ZStack{
            Color(hex: "#F5F5F5")
            if (coordinator.roomsModel.rooms.count != 0) {
                ScrollViewReader{ reader in
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach( coordinator.roomsModel.rooms) { room in
                            HotelRoomCellView(coordinator: coordinator, room: room)
                        }
                        .id(Self.topId)
                        .padding(.vertical, 8)
                    }
                    .onChange(of: coordinator.toTop[1]){  i in
                        reader.scrollTo(Self.topId, anchor: .top)
                    }
                }
            } else {
                ProblemWithInternetView()
            }
        }
        .refreshable {
            coordinator.getInfoAboutRooms()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomToolBarContent(firstTextLine : coordinator.navigationTitleRoomsModel[0], secondTextLine : coordinator.navigationTitleRoomsModel[1])
        }
        
        .toolbar { CustomToolBarBackButtonContent(coordinator: coordinator) }
    }
    
}

struct HotelRoomView_Previews: PreviewProvider {
    static var previews: some View {
        HotelRoomView(coordinator: Coordinator())
    }
}


