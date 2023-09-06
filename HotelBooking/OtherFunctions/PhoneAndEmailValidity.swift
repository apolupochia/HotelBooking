//
//  PhoneAndEmailValidity.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 04.09.2023.
//

import Foundation

class PhoneAndEmailValidity{
    static let shared = PhoneAndEmailValidity()
    
    
    func formatNumber(with mask: String, phone: String) -> String {
        let phoneNumber = delOld(phone: phone)
        var newPhone = ""
        var index = phoneNumber.startIndex
        let endIndex = phoneNumber.endIndex
        
        for maskElement in  mask where index < endIndex{
            if ((maskElement == "(") || (maskElement == ")") || (maskElement == "-") || (maskElement == " ") ){
                newPhone.append(maskElement)
            }
            else {
                newPhone.append(phoneNumber[index])
                index = phoneNumber.index(after: index)
                
            }
        }
        
        return newPhone == "" ? "" : "+7 " + newPhone
    }
    
    func formatPlaceholder(with mask: String, phone: String) -> String {
        var newPlaswholder = "+7 (∗∗∗) ∗∗∗-∗∗-∗∗"
        if phone.count > 18{
            newPlaswholder = ""
        }
        else { for _ in phone { newPlaswholder.removeFirst()} }
        newPlaswholder =  phone + newPlaswholder

        return  newPlaswholder
   
    }
    
    func delOld(phone : String) -> String{
        if phone == "+7"{ return ""}
        var newPhone = phone
        if newPhone.count > 2{
            newPhone.removeFirst()
            newPhone.removeFirst()
            newPhone.removeFirst()
        }
        
        var phone = ""
        
        for i in newPhone{
            if ((i != "(") && (i != ")") && (i != " ") && (i != "-") && Int(String(i)) != nil ){
                phone.append(i)
            }
        }
        return phone
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
