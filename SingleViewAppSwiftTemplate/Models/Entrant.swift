//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum GuestType: String {
  case classic = "Classic"
  case vip = "VIP"
  case child = "Child"
  case senior = "Senior"
  case seasonPass = "Season Pass"
}

enum EmployeeType: String {
  case foodServices = "Food Services"
  case rideServices = "Ride Services"
  case maintenance = "Maintenance"
  case contract = "Contract"
}

enum ManagerType: String {
  case shift = "Shift"
  case general = "General"
  case senior = "Senior"
}

enum VendorName: String {
  case acme = "Acme"
  case orkin = "Orkin"
  case fedex = "Fedex"
  case nwElectrical = "NW Electrical"
}

enum EntrantType {
  case none
  case guest(type: GuestType)
  case employee(type: EmployeeType)
  case manager
  case vendor
}
