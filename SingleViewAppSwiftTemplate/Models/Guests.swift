//
//  Guests.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct Classic: Guest {
  let areaAccess: [AreaAccess] = [.amusement]
  let rideAccess: [RideAccess] = [.all]
  let discountAccess: DiscountAccess = (0, 0)
}

struct Vip: Guest {
  let areaAccess: [AreaAccess] = [.amusement]
  let rideAccess: [RideAccess] = [.all]
  let discountAccess: DiscountAccess = (10, 20)
}

struct Child: Guest {
  let areaAccess: [AreaAccess] = [.amusement]
  let rideAccess: [RideAccess] = [.all]
  let discountAccess: DiscountAccess = (0, 0)
  
  var birthday: Date?
  
  init(birthday: Date?) throws {
    guard let birthday = birthday else { throw InvalidField.invalidBirthday }
    self.birthday = birthday
    
    if !isValid(birthday: birthday) { throw InvalidField.invalidFreeAge }
  }
  
  private func isValid(birthday: Date) -> Bool {
    let maxChildAge = 5
    
    let calendar = Calendar.current
    let ageComponent = calendar.dateComponents([.year], from: birthday , to: Date())
    
    if let ageComponent = ageComponent.year {
      if ageComponent > maxChildAge {
        return false
      }
    }
    return true
  }
}

struct SeasonPass: Guest {
  let areaAccess: [AreaAccess] = [.amusement]
  let rideAccess: [RideAccess] = [.all, .skipLines]
  let discountAccess: DiscountAccess = (10, 20)
  
  let firstName: String?
  let lastName: String?
  let birthday: Date?
  let streetAddress: String?
  let city: String?
  let state: String?
  let zipCode: Int?
  
  init(firstName: String?, lastName: String?, birthday: Date?, streetAddress: String?, city: String?, state: String?, zipCode: Int? ) throws {
    
    guard let firstName = firstName, !firstName.isEmpty else { throw InvalidField.invalidFirstName }
    self.firstName = firstName
    
    guard let lastName = lastName, !lastName.isEmpty else { throw InvalidField.invalidLastName }
    self.lastName = lastName
    
    guard let birthday = birthday else { throw InvalidField.invalidBirthday }
    self.birthday = birthday
    
    guard let streetAddress = streetAddress, !streetAddress.isEmpty else { throw InvalidField.invalidAddress }
    self.streetAddress = streetAddress
    
    guard let city = city, !city.isEmpty else { throw InvalidField.invalidCity }
    self.city = city
    
    guard let state = state, !state.isEmpty else { throw InvalidField.invalidState }
    self.state = state
    
    guard let zipCode = zipCode else { throw InvalidField.invalidZipCode }
    self.zipCode = zipCode
  }
  
}

struct Senior: Guest {
  let areaAccess: [AreaAccess] = [.amusement]
  let rideAccess: [RideAccess] = [.all, .skipLines]
  let discountAccess: DiscountAccess = (10, 10)
  
  let firstName: String?
  let lastName: String?
  let birthday: Date?
  
  init(firstName: String?, lastName: String?, birthday: Date?) throws {
    guard let firstName = firstName, !firstName.isEmpty else { throw InvalidField.invalidFirstName }
    self.firstName = firstName
    
    guard let lastName = lastName, !lastName.isEmpty else { throw InvalidField.invalidLastName }
    self.lastName = lastName
    
    guard let birthday = birthday else { throw InvalidField.invalidBirthday }
    self.birthday = birthday
  }
  
}

extension Child {
  func print() -> String? {
    guard let birthday = self.birthday else { return nil }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    let date = dateFormatter.string(from: birthday)
    
    return "Birthday: \(date)"
  }
}

