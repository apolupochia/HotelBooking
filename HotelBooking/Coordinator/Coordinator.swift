//
//  Coordinator.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 31.08.2023.
//

import Foundation
import SwiftUI

@MainActor
protocol CoordinatorProtocol {
    func goHome()
    func backButton()
    func goHotelRooms()
    func goBookingRoom()
    func goPaidRoom()
    
    func getInfoAboutHotel()
    func getInfoAboutRooms()
    func getInfoAboutBooking()
    
    func refresh()
}

class Coordinator: ObservableObject, CoordinatorProtocol{
    
    
    // MARK: Stored Properties
    
    @Published var path = NavigationPath()
    @Published var page : MyPages = .hotel
    
    @Published var hotelModel : HotelModel?
    @Published var roomsModel =  RoomsModelCustom(rooms: [])
    @Published var bookingModel : BookingModel?
    
    @Published var imagesForHotel : [UIImage]?
    @Published var imagesForRooms : [[UIImage]]? = []

    @Published var bookingInfoPerson = EmailAndTelephoneInfo()
    
    @Published var navigationTitleRoomsModel : [String] = ["", ""]
    @Published var toTop : [Bool] = [false, false, false]
    
    @Published var bookingInfoPersons = bookingInfoPersonsStartInfo


    init(){

        getInfoAboutHotel()

    }

    
    func goHome(){
        refresh()
        path.removeLast(path.count)
    }
    
    func backButton(){
        path.removeLast()
    }
    

    func goHotelRooms(){
        getInfoAboutRooms()
        path.append(MyPages.rooms)
    }
    
    func goBookingRoom(){
        getInfoAboutBooking()
        path.append(MyPages.bookingRoom)
    }
    
    func goPaidRoom(){
        path.append(MyPages.paidRoom)
    }
    
    
    func getInfoAboutHotel(){
        FetchDataFromNetwork(coordinator: self).getInfoAboutHotelFromNetwork()
    }
        
    func getInfoAboutRooms(){
        FetchDataFromNetwork(coordinator: self).getInfoAboutRoomsFromNetwork()
    }
    
        
    func getInfoAboutBooking(){
        FetchDataFromNetwork(coordinator: self).getInfoAboutBookengFromNetwork()
    }

    
    func refresh(){

        hotelModel = nil
        imagesForHotel = nil
        
        roomsModel = RoomsModelCustom(rooms: [])
        imagesForRooms = []
        
        bookingModel = nil
        bookingInfoPerson = EmailAndTelephoneInfo()
        bookingInfoPersons = bookingInfoPersonsStartInfo
        
        navigationTitleRoomsModel = ["", ""]
        for i in 0..<toTop.count {toTop[i].toggle()}
        
        getInfoAboutHotel()
    }
    
    
    
    @ViewBuilder
    func getPage(_ page : MyPages) -> some View{
        switch page{
        case .hotel:
            HotelView(coordinator: self)
        case .rooms:
            HotelRoomView(coordinator: self)
        case .bookingRoom:
            BookingView(coordinator: self)
        case .paidRoom:
            PaidView(coordinator: self)
        }
        
    }

}




