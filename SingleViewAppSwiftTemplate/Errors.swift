//
//  Errors.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

enum InvalidField: String, Error {
  case invalidFirstName = "Invalid First Name"
  case invalidLastName = "invalid Last Name"
  case invalidAddress = "Invalid Address"
  case invalidCity = "Invalid City"
  case invalidState = "Invalid State"
  case invalidZipCode = "Invalid Zip Code"
  case invalidBirthday = "Invalid Birthday"
  case invalidFreeAge = "Invalid Age for Free Child Guest"
  case invalidSocialSecurityNumber = "Invalid Social Security Number"
  case invalidManagementTier = "Invalid Management Tier"
}

enum PopulateError: Error {
  case failedPopulateOnEmployee
  case failedPopulateOnGuest
}

