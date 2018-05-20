//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum GuestType {
  case classic
  case vip
  case child
}

enum EmployeeType {
  case foodServices
  case rideServices
  case maintenance
  case manager
}

// I will need in the next part of the project - To manage the type of entrant after selecting from the menu
enum EntrantType {
  case guest(GuestType)
  case employee(EmployeeType)
}
