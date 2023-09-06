//
//  ChooseDatePlaseholder.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 06.09.2023.
//

import SwiftUI

struct ChooseDateTextField: View {

    let textOnTextField : String
    @Binding var info : String
    @Binding var infoValidate : Bool
    @Binding var presentSheet : Bool
    @State var date = Date()
    
    
    private let dateFormatter : DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3){

            TextField(textOnTextField, text: $info)
            { bool in
                self.dismissKeyboard()
                if bool{
                    
                    withAnimation {

                        presentSheet = true
                        infoValidate = true
                    }
                }
            }
            
            .sheet(isPresented: $presentSheet) {
                
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Button {
                            withAnimation {
                                presentSheet = false
                            }
                            
                        } label: {
                            Text("Done")
                                .foregroundColor(.white)
                                
                        }
                        .padding(8)
                        .background(Color.blue)
                        .cornerRadius(10)
                        

                    }
                    .frame(height: 50)
                   .padding(.horizontal)
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .frame(height: 200)
                        .onChange(of: date) { newValue in
                            info = dateFormatter.string(from: newValue)
                             
                        }
                        
                            
                }
                .pickerStyle(.wheel)
                .presentationDragIndicator(.hidden)
                .presentationDetents([.height(250)])
            }
            .font(.custom("SF-Pro-Display-Regular", size: 16))
            .foregroundColor(Color(hex: "14142B"))
                
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
        
        .frame(height: 60)
        .padding(.leading)
        .background(infoValidate ?  Color(hex: "#F6F6F9") : Color(hex: "#EB5757").opacity(0.7))
       .cornerRadius(10)

    }
}


