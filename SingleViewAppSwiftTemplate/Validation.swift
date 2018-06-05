//
//  Validation.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 05/06/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum ValidationType {
  case socialSecurityNumber
  case zipCode
}

enum RegEx: String {
  case socialSecurityNumber = "[0-9]{3}+-[0-9]{2}+-[0-9]{4}"
  case zipCode = "^.{4,5}$"
}

class Validation {
  
  public static let shared = Validation()
  
  func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
    let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
    let result = stringTest.evaluate(with: testStr)
    return result
  }
}
