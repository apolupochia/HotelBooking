//
//  BlockWithInformationAboutBuyerView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct BlockWithInformationAboutBuyerView: View {
    @ObservedObject var coordinator : Coordinator
    
    @State var number = ""
    @State var text = ""
    
    @State var placeholder = "+7 (∗∗∗) ∗∗∗-∗∗-∗∗"
    @State var placeholderEmail = "examplemail.000@mail.ru"
    var body: some View {
        if (coordinator.bookingModel != nil){
            VStack(alignment: .leading){
                
                Text("Информация о покупателе")
                    .font(.custom("SF-Pro-Display-Medium", size: 22))
                    .foregroundColor(Color(hex: "000000"))
                
                phoneCustomTextFieldView()
                
                emailCustomTextFieldView()
                
                Text("Эти данные никому не передаются. После оплаты мы вышлем вам чек на указанный вами номер или почту")
                    .font(.custom("SF-Pro-Display-Regular", size: 14))
                    .foregroundColor(Color(hex: "828796"))
                
            }
            
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
        }
    }

    func phoneCustomTextFieldView() -> some View{
        VStack(alignment: .leading, spacing: 3){
            Text("Номер телефона")
                .foregroundColor(Color(hex: "A9ABB7"))
                .font(.custom("SF-Pro-Display-Regular", size: 12))
            ZStack(alignment: .leading){

                Text(placeholder)
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "14142B"))
                
                TextField("", text: $coordinator.bookingInfoPerson.telephone, onEditingChanged: { bool in
                    if bool{
                        withAnimation {
                            coordinator.bookingInfoPerson.telephoneValidate = true
                        }
                    } else {
                        if (coordinator.bookingInfoPerson.telephone.count != 18) {
                            withAnimation {
                                
                                coordinator.bookingInfoPerson.telephoneValidate = false
                            }
                        }
                    }
                })
                    .onChange(of: coordinator.bookingInfoPerson.telephone, perform: { oldValue in
                        coordinator.bookingInfoPerson.telephone = PhoneAndEmailValidity.shared.formatNumber(with: "(XXX) XXX-XX-XX", phone: oldValue)
                        placeholder = PhoneAndEmailValidity.shared.formatPlaceholder(with: "(XXX) XXX-XX-XX", phone: oldValue)
                        
                    })
                    .keyboardType(.default)
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "14142B"))
            }
        }
        
        .frame(height: 60)
        .padding(.leading)
        .background(coordinator.bookingInfoPerson.telephoneValidate ?  Color(hex: "#F6F6F9") : Color(hex: "#EB5757").opacity(0.7))
       .cornerRadius(10)
        
        
    }
    
    
    
    
    func emailCustomTextFieldView() -> some View{
        VStack(alignment: .leading, spacing: 3){
            Text("Почта")
                .foregroundColor(Color(hex: "A9ABB7"))
                .font(.custom("SF-Pro-Display-Regular", size: 12))
            ZStack(alignment: .leading){
                
                Text(placeholderEmail)
                    .font(.custom("SF-Pro-Display-Regular", size: 16))
                    .foregroundColor(Color(hex: "14142B"))
                
                
                TextField("", text: $coordinator.bookingInfoPerson.email) { bool in
                    if !bool{
                        if coordinator.bookingInfoPerson.email == "" {
                            withAnimation {
                                placeholderEmail = "examplemail.000@mail.ru"
                            }
                        }
                        withAnimation {
                            coordinator.bookingInfoPerson.emailValidate = PhoneAndEmailValidity.shared.isValidEmail(coordinator.bookingInfoPerson.email)
                        }
                    } else {
                        withAnimation {
                      
                            placeholderEmail = ""
                            coordinator.bookingInfoPerson.emailValidate = true
                        }
                    }
                }
                .font(.custom("SF-Pro-Display-Regular", size: 16))
                .foregroundColor(Color(hex: "14142B"))
            }
            
        }
        .frame(height: 60)
        .padding(.leading)
        .background( coordinator.bookingInfoPerson.emailValidate ?  Color(hex: "#F6F6F9") : Color(hex: "#EB5757").opacity(0.7))

       .cornerRadius(10)
        
        
    }
  
}

struct BlockWithInformationAboutBuyerView_Previews: PreviewProvider {
    static var previews: some View {
        BlockWithInformationAboutBuyerView(coordinator: Coordinator())
    }
}
