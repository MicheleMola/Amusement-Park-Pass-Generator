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

extension GuestType {
  static let all = [classic.rawValue, vip.rawValue, child.rawValue, senior.rawValue, seasonPass.rawValue]
}

enum EmployeeType: String {
  case foodServices = "Food Services"
  case rideServices = "Ride Services"
  case maintenance = "Maintenance"
  case contract = "Contract"
}

extension EmployeeType {
  static let all = [foodServices.rawValue, rideServices.rawValue, maintenance.rawValue, contract.rawValue]
}

enum ManagerType: String {
  case shift = "Shift"
  case general = "General"
  case senior = "Senior"
}

extension ManagerType {
  static let all = [shift.rawValue, general.rawValue, senior.rawValue]
}

enum VendorName: String {
  case acme = "Acme"
  case orkin = "Orkin"
  case fedex = "Fedex"
  case nwElectrical = "NW Electrical"
}

extension VendorName {
  static let all = [acme.rawValue, orkin.rawValue, fedex.rawValue, nwElectrical.rawValue]
}

// I will need in the next part of the project - To manage the type of entrant after selecting from the menu
enum EntrantType {
  case guest(GuestType)
  case employee(EmployeeType)
}
