//
//  BlockWithInformationAboutTouristsView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct BlockWithInformationAboutTouristsView: View {
    @ObservedObject var coordinator : Coordinator
    @State var namePlaceholder = "Иван"
    @State var surnamePlaceholder = "Иванов"
//    @State var presentSheet = false
    var id  : Int
  //  @State var info = ""
    var body: some View {
        if (coordinator.bookingModel != nil){
                VStack(alignment: .leading){
                    titleView()
                    if (coordinator.bookingInfoPersons[id].infoPersonValidate.show){
                        
                        nameCustomTextFieldView()
                        surnameCustomTextFieldView()

                        ChooseDateTextField(textOnTextField: "Дата рождения", info: $coordinator.bookingInfoPersons[id].infoPerson.dateOfBirth, infoValidate: $coordinator.bookingInfoPersons[id].infoPersonValidate.dateOfBirth, presentSheet: $coordinator.bookingInfoPersons[id].infoPersonValidate.dateOfBirthSheet)
                        
                        ChooseNationalityTextField(textOnTextField: "Гражданство", info: $coordinator.bookingInfoPersons[id].infoPerson.nationality, infoValidate: $coordinator.bookingInfoPersons[id].infoPersonValidate.nationality, presentSheet: $coordinator.bookingInfoPersons[id].infoPersonValidate.nationalitySheet)
                        CustomTextFieldView(textOnTextField: "Номер загранпаспорта", info: $coordinator.bookingInfoPersons[id].infoPerson.nationalPassportNumber, infoValidate: $coordinator.bookingInfoPersons[id].infoPersonValidate.nationalPassportNumber)
                        ChooseDateTextField(textOnTextField: "Срок действия загранпаспорта", info: $coordinator.bookingInfoPersons[id].infoPerson.validityPeriodNationalPassport, infoValidate: $coordinator.bookingInfoPersons[id].infoPersonValidate.validityPeriodNationalPassport, presentSheet: $coordinator.bookingInfoPersons[id].infoPersonValidate.validityPeriodNationalPassportSheet)
     
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            }
        
    }
    
    
    
    
    
    
    
    
    
    func titleView() -> some View{
        HStack{
            Text("\(coordinator.bookingInfoPersons[id].idString) турист")
                .font(.custom("SF-Pro-Display-Medium", size: 22))
                .foregroundColor(Color(hex: "000000"))
            Spacer()
            Button {
                withAnimation {

                    coordinator.bookingInfoPersons[id].infoPersonValidate.show.toggle()
                }
            } label: {
                Image( coordinator.bookingInfoPersons[id].infoPersonValidate.show == true ? "Vector 55up" : "Vector 55down")
                    .resizable()
                    .frame(width: 12, height: 6)
                    .foregroundColor(Color(hex: "#0D72FF"))
            }
            .frame(width: 12, height: 12)
            .padding(8)
            .background(Color(hex: "#0D72FF").opacity(0.10))
            .cornerRadius(5)
        }
    }
    
    
    func nameCustomTextFieldView() -> some View{
        VStack(alignment: .leading, spacing: 3){
            Text("Имя")
                .foregroundColor(Color(hex: "A9ABB7"))
                .font(.custom("SF-Pro-Display-Regular", size: 12))
            ZStack(alignment: .leading){
                Text(namePlaceholder)
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "14142B"))
                TextField("", text: $coordinator.bookingInfoPersons[id].infoPerson.name)
                { bool in

                    if bool{
                        withAnimation {
                      //      presentSheet = false
                            namePlaceholder = ""
                            coordinator.bookingInfoPersons[id].infoPersonValidate.name = true
                        }
                    } else {
                //        UIApplication.shared.endEditing()
                        if coordinator.bookingInfoPersons[id].infoPerson.name.replacingOccurrences(of: " ", with: "") == ""{
                            withAnimation {
                                namePlaceholder = "Иван"
                            }
                        }
                    }
                }
            }
            .font(.custom("SF-Pro-Display-Regular", size: 16))
            .foregroundColor(Color(hex: "14142B"))
                
        }
        .frame(height: 60)
        .padding(.leading)
        .background(coordinator.bookingInfoPersons[id].infoPersonValidate.name ?  Color(hex: "#F6F6F9") : Color(hex: "#EB5757").opacity(0.7))
       .cornerRadius(10)
    }
    
    func surnameCustomTextFieldView() -> some View{
        VStack(alignment: .leading, spacing: 3){
            Text("Фамилия")
                .foregroundColor(Color(hex: "A9ABB7"))
                .font(.custom("SF-Pro-Display-Regular", size: 12))
            ZStack(alignment: .leading){
                Text(surnamePlaceholder)
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "14142B"))
                TextField("", text: $coordinator.bookingInfoPersons[id].infoPerson.surname)
                { bool in
                    if bool{
                        withAnimation {
                      //     presentSheet = false
                            surnamePlaceholder = ""
                            coordinator.bookingInfoPersons[id].infoPersonValidate.surname = true
                        }
                    } else {
                 //       UIApplication.shared.endEditing()
                        if coordinator.bookingInfoPersons[id].infoPerson.surname.replacingOccurrences(of: " ", with: "") == ""{
                            withAnimation {
                                surnamePlaceholder = "Иванов"
                            }
                        }
                    }
                }
                .font(.custom("SF-Pro-Display-Regular", size: 16))
                .foregroundColor(Color(hex: "14142B"))
            }
                
        }
        .frame(height: 60)
        .padding(.leading)
        .background( coordinator.bookingInfoPersons[id].infoPersonValidate.surname ?  Color(hex: "#F6F6F9") : Color(hex: "#EB5757").opacity(0.7))
       .cornerRadius(10)
    }

    

}

struct BlockWithInformationAboutTouristsView_Previews: PreviewProvider {
    static var previews: some View {
        BlockWithInformationAboutTouristsView(coordinator: Coordinator(),id: 0)
    }
}
