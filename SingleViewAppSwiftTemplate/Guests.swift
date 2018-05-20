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

extension Child {
  func print() -> String? {
    guard let birthday = self.birthday else { return nil }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    let date = dateFormatter.string(from: birthday)
    
    return "Birthday: \(date)"
  }
}

