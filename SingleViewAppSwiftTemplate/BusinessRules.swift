//
//  BusinessRules.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum AreaAccess: String {
  case amusement = "Amusement Area"
  case kitchen = "Kitchen Area"
  case rideControl = "Ride Control Area"
  case maintenance = "Maintenance Area"
  case office = "Office Area"
}

enum RideAccess: String {
  case all = "Access all rides"
  case skipLines = "Skip all ride lines"
  case none = "No Access to the rides"
}

typealias DiscountAccess = (food: Int, merchandise: Int)

enum DiscountArea {
  case food
  case merchandise
}

