//
//  Checkpoint.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

class Checkpoint {
  
  private let delaySwipe = 5
  
  func canAccess(toArea area: AreaAccess, withPass pass: inout Pass) -> String {
    if isValidSwipeTime(fromPass: &pass) {
      let birthday = pass.entrant.getBirthday()
      return pass.entrant.areaAccess.contains(area) ? "\(checkBirthday(fromBirthday: birthday))\(area.rawValue) Access Allowed at: \(Date())" : "\(area.rawValue) Access Not Allowed"
    } else {
      return "Alert: \(area.rawValue) Access Not Allowed at \(Date())"
    }
  }
  
  func percentageDiscount(atArea area: DiscountArea, withPass pass: inout Pass) -> String {
    if isValidSwipeTime(fromPass: &pass) {
      let birthday = pass.entrant.getBirthday()
      switch area {
      case .food:
        return "\(checkBirthday(fromBirthday: birthday))Discount on food: \(pass.entrant.discountAccess.food)%. Date and time: \(Date())"
      case .merchandise:
        return "\(checkBirthday(fromBirthday: birthday))Discount on merchandise: \(pass.entrant.discountAccess.merchandise)%. Date and time: \(Date())"
      }
    } else {
      return "Alert: \(area) Access Not Allowed at \(Date())"
    }
  }
  
  func canAccess(toRide ride: RideAccess, withPass pass: inout Pass) -> String {
    if isValidSwipeTime(fromPass: &pass) {
      let birthday = pass.entrant.getBirthday()
      return pass.entrant.rideAccess.contains(ride) ? "\(checkBirthday(fromBirthday: birthday))\(ride.rawValue) Allowed at: \(Date())" : "\(ride.rawValue) Not Allowed"
    } else {
      return "Alert: \(ride.rawValue) Access Not Allowed at \(Date())"
    }
  }
  
  private func isValidSwipeTime(fromPass pass: inout Pass) -> Bool {
    if pass.swipeTime == nil {
      pass.swipeTime = Date()
      return true
    } else {
      let calendar = Calendar.current
      let unitFlags = Set<Calendar.Component>([ .second ])
      let datecomponenets = calendar.dateComponents(unitFlags, from: pass.swipeTime!, to: Date())
      let seconds = datecomponenets.second
      if let seconds = seconds {
        if seconds < delaySwipe {
          return false
        }
      }
      return true
    }
  }
  
  private func checkBirthday(fromBirthday birthday: Date?) -> String {
    
    guard let birthday = birthday else { return "" }
    let calendar = Calendar.current
    
    let currentDay = calendar.component(.day, from: Date())
    let currentMonth = calendar.component(.month, from: Date())
    
    let dayFromBirtday = calendar.component(.day, from: birthday)
    let monthFromBirtday = calendar.component(.month, from: birthday)
    
    if currentDay == dayFromBirtday && currentMonth == monthFromBirtday {
      return "Happy Birthday!!! "
    }
    return ""
  }
}
