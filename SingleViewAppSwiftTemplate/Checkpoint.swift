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
  
  let correctSound = SoundManager(fileName: "CorrectDing", fileType: "wav", idSound: 0)
  let wrongSound = SoundManager(fileName: "IncorrectBuzz", fileType: "wav", idSound: 1)
  
  init() {
    loadSound()
  }
  
  func loadSound() {
    do {
      try correctSound.load()
      try wrongSound.load()
    } catch {
      print(error)
    }
  }
  
  func canAccess(toArea area: AreaAccess, withPass pass: inout Pass) -> (String, Bool) {
    if isValidSwipeTime(fromPass: &pass) {
      let birthday = pass.entrant.getBirthday()
      if pass.entrant.areaAccess.contains(area) {
        let birthdayString = checkBirthday(fromBirthday: birthday)
        correctSound.play()
        return ("\(birthdayString)Access Allowed", true)
      } else {
        wrongSound.play()
        return ("Access Not Allowed", false)
      }
    } else {
      wrongSound.play()
      return ("Swiped twice within 5 seconds, wait and try again.", false)
    }
  }
  
  func percentageDiscount(atArea area: DiscountArea, withPass pass: inout Pass) -> (String, Bool) {
    if isValidSwipeTime(fromPass: &pass) {
      let birthday = pass.entrant.getBirthday()
      switch area {
      case .food:
        if (pass.entrant.discountAccess.food != 0) {
          correctSound.play()
          return ("\(checkBirthday(fromBirthday: birthday))Discount on food: \(pass.entrant.discountAccess.food)%", true)
        }
        wrongSound.play()
        return ("No Discount on food", false)
        
      case .merchandise:
        if (pass.entrant.discountAccess.merchandise != 0) {
          correctSound.play()
          return ("\(checkBirthday(fromBirthday: birthday))Discount on merchandise: \(pass.entrant.discountAccess.merchandise)%", true)
        }
        wrongSound.play()
        return ("No Discount on merchandise", false)
      }
    } else {
      wrongSound.play()
      return ("Swiped twice within 5 seconds, wait and try again.", false)
    }
  }
  
  func canAccessToRides(withPass pass: inout Pass) -> (String, Bool) {
    if isValidSwipeTime(fromPass: &pass) {
      if pass.entrant.rideAccess.contains(.all) {
        let birthday = pass.entrant.getBirthday()
        let birthdayString = checkBirthday(fromBirthday: birthday)
        var responseString = "\(birthdayString)Access Allowed"
        if pass.entrant.rideAccess.contains(.skipLines) {
          responseString += ", may skip rides"
        }
        correctSound.play()
        return (responseString, true)
      } else {
        wrongSound.play()
        return ("Access Not Allowed", false)
      }
    } else {
      wrongSound.play()
      return ("Swiped twice within 5 seconds, wait and try again.", false)
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
      pass.swipeTime = Date()
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
