//
//  CheckDataAboutPerson.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 04.09.2023.
//

import Foundation

protocol CheckDataAboutPersonsProtocol{
    func checkDataBookingInfoPerson() -> Bool
    func checkDataBookingInfoPersons(id : Int, emailAndPhone : Bool) -> Bool
}

class CheckDataAboutPersons : CheckDataAboutPersonsProtocol{


    
    @Published  var coordinator : Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    @MainActor func checkDataBookingInfoPerson() -> Bool{
        if (PhoneAndEmailValidity.shared.isValidEmail( coordinator.bookingInfoPerson.email)) {
            coordinator.bookingInfoPerson.emailValidate = true
            
        } else {
            coordinator.bookingInfoPerson.emailValidate = false
        }
        
        if ( coordinator.bookingInfoPerson.telephone.count == 18 ) {
            coordinator.bookingInfoPerson.telephoneValidate = true
            
        } else {
            coordinator.bookingInfoPerson.telephoneValidate = false
        }
        
        return (  coordinator.bookingInfoPerson.telephoneValidate &&  coordinator.bookingInfoPerson.emailValidate )
    }
    
    @MainActor func checkDataBookingInfoPersons(id : Int, emailAndPhone : Bool) -> Bool{
        var closingView = false
        
        coordinator.bookingInfoPersons[id].infoPerson.name = coordinator.bookingInfoPersons[id].infoPerson.name.replacingOccurrences(of: " ", with: "")
        coordinator.bookingInfoPersons[id].infoPerson.surname = coordinator.bookingInfoPersons[id].infoPerson.surname.replacingOccurrences(of: " ", with: "")

        if id == 0 {
            coordinator.bookingInfoPersons[id].infoPersonValidate.name = !coordinator.bookingInfoPersons[id].infoPerson.name.isEmpty
            coordinator.bookingInfoPersons[id].infoPersonValidate.surname = !coordinator.bookingInfoPersons[id].infoPerson.surname.isEmpty
            coordinator.bookingInfoPersons[id].infoPersonValidate.dateOfBirth = !coordinator.bookingInfoPersons[id].infoPerson.dateOfBirth.isEmpty
            coordinator.bookingInfoPersons[id].infoPersonValidate.nationality = !coordinator.bookingInfoPersons[id].infoPerson.nationality.isEmpty
            coordinator.bookingInfoPersons[id].infoPersonValidate.nationalPassportNumber = !coordinator.bookingInfoPersons[id].infoPerson.nationalPassportNumber.isEmpty
            coordinator.bookingInfoPersons[id].infoPersonValidate.validityPeriodNationalPassport = !coordinator.bookingInfoPersons[id].infoPerson.validityPeriodNationalPassport.isEmpty
        } else {
            if (coordinator.bookingInfoPersons[id].infoPerson.name.isEmpty && coordinator.bookingInfoPersons[id].infoPerson.surname.isEmpty && coordinator.bookingInfoPersons[id].infoPerson.dateOfBirth.isEmpty && coordinator.bookingInfoPersons[id].infoPerson.nationality.isEmpty && coordinator.bookingInfoPersons[id].infoPerson.nationalPassportNumber.isEmpty && coordinator.bookingInfoPersons[id].infoPerson.validityPeriodNationalPassport.isEmpty && coordinator.bookingInfoPersons[id].infoPersonValidate.show == false) {
                closingView = true
            } else {
                coordinator.bookingInfoPersons[id].infoPersonValidate.name = !coordinator.bookingInfoPersons[id].infoPerson.name.isEmpty
                coordinator.bookingInfoPersons[id].infoPersonValidate.surname = !coordinator.bookingInfoPersons[id].infoPerson.surname.isEmpty
                coordinator.bookingInfoPersons[id].infoPersonValidate.dateOfBirth = !coordinator.bookingInfoPersons[id].infoPerson.dateOfBirth.isEmpty
                coordinator.bookingInfoPersons[id].infoPersonValidate.nationality = !coordinator.bookingInfoPersons[id].infoPerson.nationality.isEmpty
                coordinator.bookingInfoPersons[id].infoPersonValidate.nationalPassportNumber = !coordinator.bookingInfoPersons[id].infoPerson.nationalPassportNumber.isEmpty
                coordinator.bookingInfoPersons[id].infoPersonValidate.validityPeriodNationalPassport = !coordinator.bookingInfoPersons[id].infoPerson.validityPeriodNationalPassport.isEmpty
            }
        }
       
        

        if (id == 0){
            return (emailAndPhone && coordinator.bookingInfoPersons[id].infoPersonValidate.name && coordinator.bookingInfoPersons[id].infoPersonValidate.surname && coordinator.bookingInfoPersons[id].infoPersonValidate.dateOfBirth && coordinator.bookingInfoPersons[id].infoPersonValidate.nationality && coordinator.bookingInfoPersons[id].infoPersonValidate.nationalPassportNumber &&  coordinator.bookingInfoPersons[id].infoPersonValidate.validityPeriodNationalPassport)
        } else {
            if (closingView){
                return true
            } else {
                return (coordinator.bookingInfoPersons[id].infoPersonValidate.name && coordinator.bookingInfoPersons[id].infoPersonValidate.surname && coordinator.bookingInfoPersons[id].infoPersonValidate.dateOfBirth && coordinator.bookingInfoPersons[id].infoPersonValidate.nationality && coordinator.bookingInfoPersons[id].infoPersonValidate.nationalPassportNumber &&  coordinator.bookingInfoPersons[id].infoPersonValidate.validityPeriodNationalPassport)
            }
        }
        
    }
}
