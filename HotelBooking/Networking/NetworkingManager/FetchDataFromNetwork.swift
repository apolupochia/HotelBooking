//
//  NetworkDataFetch.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 31.08.2023.
//

import Foundation
import SwiftUI

protocol FetchDataFromNetworkProtocol{
    func getInfoAboutHotelFromNetwork()
    func getInfoAboutRoomsFromNetwork()
    func getInfoAboutBookengFromNetwork()

}

class FetchDataFromNetwork : FetchDataFromNetworkProtocol{

    @Published  var coordinator : Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    
    func getInfoAboutHotelFromNetwork(){
        NetworkDataFromUrl().getInfoFromUrl(urlString: ApiString.apiForHotel.rawValue) { (hotelModel : HotelModel?) in
            DispatchQueue.main.async {
                guard let hotelModel = hotelModel else {return}

                self.coordinator.hotelModel = hotelModel
                self.customNavigationText(hotelModel: hotelModel)
                self.imagesFetch(imagesUrlStings: hotelModel.imageUrls){ images in
                    self.coordinator.imagesForHotel = images
                }
            }
        }
    }
    
    func getInfoAboutRoomsFromNetwork(){
        NetworkDataFromUrl().getInfoFromUrl(urlString: ApiString.apiForRoom.rawValue) { (roomsModel : RoomsModel?) in
            DispatchQueue.main.async {
                guard let roomsModel = roomsModel else {return}
                
                self.coordinator.roomsModel = RoomsModelCustom(rooms: [])
                self.coordinator.imagesForRooms = []
                self.addToCustomRoomsModel(roomsModel: roomsModel)
                for i in 0..<roomsModel.rooms.count{
                    self.imagesFetch(imagesUrlStings: roomsModel.rooms[i].imageUrls) { images in
                        self.coordinator.roomsModel.rooms[i].image = images
                        
                    }
                }
            }
        }
    }
    
    func getInfoAboutBookengFromNetwork(){
        NetworkDataFromUrl().getInfoFromUrl(urlString: ApiString.apiForBooking.rawValue) { (bookingModel : BookingModel?) in
            guard let bookingModel = bookingModel else {return}
            DispatchQueue.main.async {
                self.coordinator.bookingModel = bookingModel
            }
        }
    }
     
    
    
    private func customNavigationText(hotelModel : HotelModel){
        DispatchQueue.main.async {
            let newTitleGroup = CreateGroupedItems.shared.createGroupedItemsArray(items: hotelModel.name.split(separator: " ").map { String($0) })
            if newTitleGroup.count == 1{
                self.coordinator.navigationTitleRoomsModel[0] = newTitleGroup[0]
            } else if newTitleGroup.count == 2{
                self.coordinator.navigationTitleRoomsModel[0] = newTitleGroup[0]
                self.coordinator.navigationTitleRoomsModel[1] = newTitleGroup[1]
            }
        }
    }
    
    private func addToCustomRoomsModel(roomsModel : RoomsModel){

        for rooms in roomsModel.rooms{
            let room = RoomCustom(id: rooms.id, name: rooms.name, price: rooms.price, pricePer: rooms.pricePer, peculiarities: rooms.peculiarities, image: nil)
            DispatchQueue.main.async {
                self.coordinator.roomsModel.rooms.append(room)
            }
        }
    }
    
    private func imagesFetch(imagesUrlStings : [String], responce: @escaping ([UIImage]) -> Void){
        var imagesForHotel : [UIImage] = []
        for imageUrl in imagesUrlStings{
            NetworkDataFromUrl().getImageFromUrl(urlString: imageUrl) { image in
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    imagesForHotel.append(image)
                    if imageUrl == imagesUrlStings.last{
                        responce(imagesForHotel)
                    }
                }
            }
        }
    }
    

}
