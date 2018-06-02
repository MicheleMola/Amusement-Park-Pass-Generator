//
//  Protocols.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

protocol Entrant {
  var areaAccess: [AreaAccess] { get }
  var rideAccess: [RideAccess] { get }
  var discountAccess: DiscountAccess { get }
}

extension Entrant {
  func getBirthday() -> Date? {
    if self is Child {
      guard let child = self as? Child else {return nil}
      return child.birthday
    } else if self is FoodServiceEmployee {
      guard let employee = self as? FoodServiceEmployee else {return nil}
      return employee.birthday
    } else if self is RideServiceEmployee {
      guard let employee = self as? RideServiceEmployee else {return nil}
      return employee.birthday
    } else if self is MaintenanceEmployee {
      guard let employee = self as? MaintenanceEmployee else {return nil}
      return employee.birthday
    } else if self is Manager {
      guard let employee = self as? Manager else {return nil}
      return employee.birthday
    }
    return nil
  }
}


// Guest
protocol Guest: Entrant {}

// Employee
protocol Employee: Entrant {
  var firstName: String? { get }
  var lastName: String? { get }
  var birthday: Date? { get }
  var streetAddress: String? { get }
  var city: String? { get }
  var state: String? { get }
  var zipCode: Int? { get }
  var socialSecurityNumber: String? { get }
}

protocol Vendor: Entrant {
  var firstName: String? { get }
  var lastName: String? { get }
  var birthday: Date? { get }
  var company: String? { get }
  var dateOfVisit: Date? { get }
}


