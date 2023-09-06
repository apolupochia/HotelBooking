//
//  AddNewBlockWithInformationAboutTouristsView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 02.09.2023.
//

import SwiftUI

struct AddNewBlockWithInformationAboutTouristsView: View {
    @ObservedObject var coordinator : Coordinator
    var body: some View {
        HStack{
            Text("Добавить туриста")
                .font(.custom("SF-Pro-Display-Medium", size: 22))
                .foregroundColor(Color(hex: "000000"))
            Spacer()
            Button {
                withAnimation {

                    addNew()
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(hex: "FFFFFF"))
            }
            .frame(width: 12, height: 12)
            .padding(8)
            .background(Color(hex: "0D72FF"))
            .cornerRadius(5)
        }
        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
        
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
    func addNew(){
        let newId = coordinator.bookingInfoPersons.count
        let newElement = BookingInfoPersons(
            id: newId,
            idString: numberString(id: newId),
            infoPerson: BookingInfoPerson(),
            infoPersonValidate: BookingInfoValidatePerson(show: true)
        )
        coordinator.bookingInfoPersons.append(newElement)
        print(coordinator.bookingInfoPersons)
        
    }
    
    func numberString(id : Int) -> String{
        switch id{
        case 0:
            return "Первый"
        case 1:
            return "Второй"
        case 2:
            return "Третий"
        case 3:
            return "Четвёртый"
        case 4:
            return "Петый"
        case 5:
            return "Шестой"
        case 6:
            return "Седьмой"
        case 7:
            return "Восьмой"
        case 8:
            return "Девятый"
        case 9:
            return "Десятый"
        default:
            return "\(id + 1)"
        }
    }
}

struct AddNewBlockWithInformationAboutTouristsView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewBlockWithInformationAboutTouristsView(coordinator: Coordinator())
    }
}

