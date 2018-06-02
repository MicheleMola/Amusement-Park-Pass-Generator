//
//  Vendor.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 02/06/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct VendorCompany: Vendor {
  var firstName: String?
  var lastName: String?
  var birthday: Date?
  var company: String?
  var dateOfVisit: Date?
  
  var areaAccess: [AreaAccess]
  var rideAccess: [RideAccess] = []
  var discountAccess: DiscountAccess = (0, 0)
  
  init(firstName: String?, lastName: String?, birthday: Date?, company: String?, dateOfVisit: Date?) throws {
    guard let firstName = firstName, !firstName.isEmpty else { throw InvalidField.invalidFirstName }
    self.firstName = firstName
    
    guard let lastName = lastName, !lastName.isEmpty else { throw InvalidField.invalidLastName }
    self.lastName = lastName
    
    guard let birthday = birthday else { throw InvalidField.invalidBirthday }
    self.birthday = birthday
    
    guard let dateOfVisit = dateOfVisit else { throw InvalidField.invalidDateOfVisit }
    self.dateOfVisit = dateOfVisit
    
    guard let company = company, !company.isEmpty else { throw InvalidField.invalidCompany }
    
    switch company {
    case VendorName.acme.rawValue:
      self.areaAccess = [.kitchen]
    case VendorName.orkin.rawValue:
      self.areaAccess = [.kitchen, .amusement, .rideControl]
    case VendorName.fedex.rawValue:
      self.areaAccess = [.maintenance, .office]
    case VendorName.nwElectrical.rawValue:
      self.areaAccess = [.kitchen, .amusement, .rideControl, .maintenance, .office]
    default:
      throw InvalidField.invalidCompany
    }
    
    self.company = company

  }
}
