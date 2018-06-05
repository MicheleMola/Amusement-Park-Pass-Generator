//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum PassType: String {
  case classicGuest = "Classic Guest Pass"
  case vipGuest = "VIP Guest Pass"
  case childGuest = "Child Guest Pass"
  case seasonGuest = "Season Guest Pass"
  case seniorGuest = "Senior Guest Pass"
  case foodServicesEmployee = "Food Services Employee Pass"
  case rideServicesEmployee = "Ride Servies Employee Pass"
  case maintenanceEmployee = "Maintenance Employee Pass"
  case contractEmployee = "Contract Employee Pass"
  case manager = "Manager Pass"
  case vendor = "Vendor Pass"
}

struct Pass {
  let entrant: Entrant
  let type: PassType
  var swipeTime: Date? = nil
  
  init(entrant: Entrant, type: PassType) {
    self.entrant = entrant
    self.type = type
  }
}
