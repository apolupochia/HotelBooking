//
//  CustomTextFieldView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 05.09.2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    let textOnTextField : String
    @Binding var info : String
    @Binding var infoValidate : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 3){

            TextField(textOnTextField, text: $info)
            { bool in
                
                if bool{
                    withAnimation {
                        infoValidate = true
                    }
                }
            }

            .keyboardType( .default)
            .font(.custom("SF-Pro-Display-Regular", size: 16))
            .foregroundColor(Color(hex: "14142B"))
      
        }
        
        .frame(height: 60)
        .padding(.leading)
        .background(infoValidate ?  Color(hex: "#F6F6F9") : Color(hex: "#EB5757").opacity(0.7))
       .cornerRadius(10)
        

    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(textOnTextField: "Дата рождения", info: .constant("123"), infoValidate: .constant(true))
    }
}
