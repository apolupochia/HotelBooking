//
//  testView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 06.09.2023.
//

import Foundation
import SwiftUI



struct ChooseNationalityTextField: View {
    
    
    let textOnTextField : String
    @Binding var info : String
    @Binding var infoValidate : Bool
    
    @Binding var presentSheet : Bool
    @State private var selectedCategory: Countries = .italian
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
                VStack{
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
                    
                    Picker("Food Category", selection: $selectedCategory) {
                        ForEach(Countries.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .onChange(of: selectedCategory) { newValue in
                        info = newValue.rawValue
                    }
                }
                .pickerStyle(.wheel)
                .padding()
                
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


