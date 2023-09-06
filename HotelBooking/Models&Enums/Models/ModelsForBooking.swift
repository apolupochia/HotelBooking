//
//  ModelsForBooking.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 05.09.2023.
//

import Foundation
import UIKit

let bookingInfoPersonsStartInfo = [
    BookingInfoPersons(id: 0, idString: "Первый",
                       infoPerson: BookingInfoPerson(),
                       infoPersonValidate: BookingInfoValidatePerson(show: true)
    ),
    BookingInfoPersons(id: 1,
                       idString: "Второй",
                       infoPerson: BookingInfoPerson(),
                       infoPersonValidate: BookingInfoValidatePerson(show: false)
    )
]

// MARK: - Model For Booking Info About Person

struct BookingInfoPersons : Identifiable{
    let id : Int
    let idString : String
    var infoPerson : BookingInfoPerson
    var infoPersonValidate: BookingInfoValidatePerson

}

struct BookingInfoPerson : Identifiable{
    
    var id = UUID()

    
    var name : String
    var surname : String
    
   // var dateOfBirth : Date?
    var dateOfBirth : String
    
    var nationality : String
    var nationalPassportNumber : String
    var validityPeriodNationalPassport : String
    
    init() {

        self.name = ""
        self.surname = ""
        self.dateOfBirth = ""
        self.nationality = ""
        self.nationalPassportNumber = ""
        self.validityPeriodNationalPassport = ""
    }
}

struct BookingInfoValidatePerson : Identifiable{
    
    var id = UUID()
    
    var show : Bool

    var name : Bool
    var surname : Bool
    var dateOfBirth : Bool
    var dateOfBirthSheet : Bool
    var nationality : Bool
    var nationalitySheet : Bool
    var nationalPassportNumber : Bool
    var validityPeriodNationalPassport : Bool
    var validityPeriodNationalPassportSheet : Bool
    
    init(show : Bool) {
        self.show = show

        self.name = true
        self.surname = true
        self.dateOfBirth = true
        self.dateOfBirthSheet = false
        self.nationality = true
        self.nationalitySheet = false
        self.nationalPassportNumber = true
        self.validityPeriodNationalPassport = true
        self.validityPeriodNationalPassportSheet = false
    }
    

    
}

// MARK: - Model For Email and Phone info

struct EmailAndTelephoneInfo{
    var email : String
    var telephone : String
    
    var emailValidate : Bool
    var telephoneValidate : Bool
    
    init() {
        self.email = ""
        self.telephone = ""
        self.emailValidate = true
        self.telephoneValidate = true
    }
}


