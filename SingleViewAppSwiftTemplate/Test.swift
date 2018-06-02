//
//  Test.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 20/05/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

class Test {
  
  let checkpoint = Checkpoint()
  
  /*
  func test() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    // Success case for Classic Guest: Allowed Access to Amusement Area
    print("--- Test case 1 ---")
    print("Classic Guest")
    let classic1 = Classic()
    var passClassic1 = Pass(entrant: classic1)
    print("\n" + checkpoint.canAccess(toArea: .amusement, withPass: &passClassic1))
    
    // Fail case for Classic Guest: Access Not Allowed to Kitchen Area
    print("\n--- Test case 2 ---")
    print("Classic Guest")
    let classic2 = Classic()
    var passClassic2 = Pass(entrant: classic2)
    print("\n" + checkpoint.canAccess(toArea: .kitchen, withPass: &passClassic2))
    
    // Success case for Classic Guest: Allowed Access to All rides
    print("\n--- Test case 3 ---")
    print("Classic Guest")
    let classic3 = Classic()
    var passClassic3 = Pass(entrant: classic3)
    print("\n" + checkpoint.canAccess(toRide: .all, withPass: &passClassic3))
    
    // Success case for Vip Guest: Allowed Access to Amusement Area
    print("\n--- Test case 4 ---")
    print("Vip Guest")
    let vip1 = Vip()
    var passVip1 = Pass(entrant: vip1)
    print("\n" + checkpoint.canAccess(toArea: .amusement, withPass: &passVip1))
    
    // Success case for Vip Guest: Allowed Access to Amusement Area
    print("\n--- Test case 5 ---")
    print("Vip Guest")
    let vip2 = Vip()
    var passVip2 = Pass(entrant: vip2)
    print("\n" + checkpoint.canAccess(toRide: .all, withPass: &passVip2))
    
    // Vip Guest: Percentage of discount at Food Area
    print("\n--- Test case 6 ---")
    print("Vip Guest")
    let vip3 = Vip()
    var passVip3 = Pass(entrant: vip3)
    print("\n" + checkpoint.percentageDiscount(atArea: .food, withPass: &passVip3))
    
    // Fail case for Free Child Guest: Access Not Allowed to Kitchen Area
    print("\n--- Test case 7 ---")
    print("Free Child Guest")
    do {
      let date = dateFormatter.date(from: "12/12/1992")
      let child = try Child(birthday: date)
      if let infoChild = child.print() { print(infoChild) }
      
      var pass = Pass(entrant: child)
      
      print("\n" + checkpoint.canAccess(toArea: .kitchen, withPass: &pass))
      
    } catch let error as InvalidField {
      print("Error Child Guest: \(error.rawValue)")
    } catch {
      print("Unexpected error: \(error).")
    }
    
    // Free Child Guest: Percentage of discount at Food Area
    print("\n--- Test case 8 ---")
    print("Free Child Guest")
    do {
      let date = dateFormatter.date(from: "10/12/2014")
      let child = try Child(birthday: date)
      if let infoChild = child.print() { print(infoChild) }
      
      var pass = Pass(entrant: child)
      
      print("\n" + checkpoint.percentageDiscount(atArea: .food, withPass: &pass))
      
    } catch let error {
      print("Error Child Guest: \(error)")
    }
    
    // Success case for Free Child Guest: Allowed Access to All rides
    print("\n--- Test case 9 ---")
    print("Free Child Guest")
    do {
      let date = dateFormatter.date(from: "03/14/2015")
      let child = try Child(birthday: date)
      if let infoChild = child.print() { print(infoChild) }
      
      var pass = Pass(entrant: child)
      
      print("\n" + checkpoint.canAccess(toRide: .all, withPass: &pass))
      
    } catch let error {
      print("Error Child Guest: \(error)")
    }
    
    // Success case for Hourly Employee - Food Services: Allowed Access at Kitchen Area
    print("\n--- Test case 10 ---")
    print("Hourly Employee - Food Services")
    do {
      let date = dateFormatter.date(from: "12/10/1992")
      let foodServices = try FoodServiceEmployee(firstName: "Michele", lastName: "Mola", birthday: date, streetAddress: "Via dei polli 8", city: "Napoli", state: "Italia", zipCode: 80146, socialSecurityNumber: 10)
      if let infoEmployee = foodServices.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: foodServices)
      
      print("\n" + checkpoint.canAccess(toArea: .kitchen, withPass: &pass))
      
    } catch let error {
      print("Error Employee - Food Services: \(error)")
    }
    
    // Fail case for Hourly Employee - Food Services: Error init (missed firstName)
    print("\n--- Test case 11 ---")
    print("Hourly Employee - Food Services")
    do {
      let date = dateFormatter.date(from: "11/14/1990")
      let foodServices = try FoodServiceEmployee(firstName: nil, lastName: "Mola", birthday: date, streetAddress: "Viale Mazzini 18", city: "Napoli", state: "Italia", zipCode: 80100, socialSecurityNumber: 2)
      if let infoEmployee = foodServices.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: foodServices)
      
      print("\n" + checkpoint.canAccess(toRide: .all, withPass: &pass))
      
    } catch let error {
      print("Error Employee - Food Services: \(error)")
    }
    
    // Hourly Employee - Food Services: Percentage of discount at Merchandise Area
    print("\n--- Test case 12 ---")
    print("Hourly Employee - Food Services")
    do {
      let date = dateFormatter.date(from: "04/23/1980")
      let foodServices = try FoodServiceEmployee(firstName: "Jack", lastName: "Bonventura", birthday: date, streetAddress: "Via della speranza", city: "Milano", state: "Italia", zipCode: 70234, socialSecurityNumber: 1)
      if let infoEmployee = foodServices.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: foodServices)
      
      print("\n" + checkpoint.percentageDiscount(atArea: .merchandise, withPass: &pass))
      
    } catch let error {
      print("Error Employee - Food Services: \(error)")
    }
    
    // Success case for Hourly Employee - Ride Services: Allowed Access at Ride Control Area
    print("\n--- Test case 13 ---")
    print("Hourly Employee - Ride Services")
    do {
      let date = dateFormatter.date(from: "01/20/1978")
      let rideServices = try RideServiceEmployee(firstName: "Leopoldo", lastName: "Mastellone", birthday: date, streetAddress: "Via delle galline 4", city: "Napoli", state: "Italia", zipCode: 80134, socialSecurityNumber: 5)
      if let infoEmployee = rideServices.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: rideServices)
      
      print("\n" + checkpoint.canAccess(toArea: .rideControl, withPass: &pass))
      
    } catch let error {
      print("Error Employee - Ride Services: \(error)")
    }
    
    // Fail case for Hourly Employee - Ride Services: Access Not Allowed to skip all ride lines
    print("\n--- Test case 14 ---")
    print("Hourly Employee - Ride Services")
    do {
      let date = dateFormatter.date(from: "06/11/1993")
      let rideServices = try RideServiceEmployee(firstName: "Giusy", lastName: "Castaldo", birthday: date, streetAddress: "Via Enrico Sforza 3", city: "Napoli", state: "Italia", zipCode: 80135, socialSecurityNumber: 11)
      if let infoEmployee = rideServices.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: rideServices)
      
      print("\n" + checkpoint.canAccess(toRide: .skipLines, withPass: &pass))
      
    } catch let error {
      print("Error Employee - Ride Services: \(error)")
    }
    
    // Hourly Employee - Ride Services: Percentage of discount at Food Area
    print("\n--- Test case 15 ---")
    print("Hourly Employee - Ride Services")
    do {
      let date = dateFormatter.date(from: "02/03/1969")
      let rideServices = try RideServiceEmployee(firstName: "Teresa", lastName: "Esposito", birthday: date, streetAddress: "Via Verde 4", city: "Napoli", state: "Italia", zipCode: 80123, socialSecurityNumber: 23)
      if let infoEmployee = rideServices.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: rideServices)
      
      print("\n" + checkpoint.percentageDiscount(atArea: .food, withPass: &pass))
      
    } catch let error {
      print("Error Employee - Ride Services: \(error)")
    }
    
    // Success case for Hourly Employee - Maintenance: Allowed Access at Maintenance Area
    print("\n--- Test case 16 ---")
    print("Hourly Employee - Maintenance")
    do {
      let date = dateFormatter.date(from: "03/02/1973")
      let maintenance = try MaintenanceEmployee(firstName: "Giacomo", lastName: "Mazzini", birthday: date, streetAddress: "Via della gioconda", city: "Torino", state: "Italia", zipCode: 78234, socialSecurityNumber: 25)
      if let infoEmployee = maintenance.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: maintenance)
      
      print("\n" + checkpoint.canAccess(toArea: .maintenance, withPass: &pass))
      
    } catch let error{
      print("Error Employee - Maintenance: \(error)")
    }
    
    // Fail case for Hourly Employee - Maintenance: Error init (missed city)
    print("\n--- Test case 17 ---")
    print("Hourly Employee - Maintenance")
    do {
      let date = dateFormatter.date(from: "07/09/1991")
      let maintenance = try MaintenanceEmployee(firstName: "Giacomo", lastName: "Mazzini", birthday: date, streetAddress: "Via della gioconda", city: nil, state: "Italia", zipCode: 78234, socialSecurityNumber: 25)
      if let infoEmployee = maintenance.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: maintenance)
      
      print("\n" + checkpoint.canAccess(toArea: .maintenance, withPass: &pass))
      
    } catch let error{
      print("Error Employee - Maintenance: \(error)")
    }
    
    // Hourly Employee - Maintenance: Percentage of discount at Merchandise Area
    print("\n--- Test case 18 ---")
    print("Hourly Employee - Maintenance")
    do {
      let date = dateFormatter.date(from: "12/20/1974")
      let maintenance = try MaintenanceEmployee(firstName: "Marko", lastName: "Rog", birthday: date, streetAddress: "Castelvolturno 4", city: "Napoli", state: "Italia", zipCode: 80120, socialSecurityNumber: 31)
      if let infoEmployee = maintenance.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: maintenance)
      
      print("\n" + checkpoint.percentageDiscount(atArea: .merchandise, withPass: &pass))
      
    } catch let error{
      print("Error Employee - Maintenance: \(error)")
    }
    
    // Success case for Hourly Employee - Manager: Allowed Access at Office Area
    print("\n--- Test case 19 ---")
    print("Hourly Employee - Manager")
    do {
      let date = dateFormatter.date(from: "02/25/1979")
      let manager = try Manager(firstName: "Pepe", lastName: "Reina", birthday: date, streetAddress: "Castelvolturno 19", city: "Napoli", state: "Italia", zipCode: 80120, socialSecurityNumber: 36, managementTier: .senior)
      if let infoEmployee = manager.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: manager)
      
      print("\n" + checkpoint.canAccess(toArea: .office, withPass: &pass))
      
    } catch let error{
      print("Error Employee - Manager: \(error)")
    }
    
    // Hourly Employee - Manager: Percentage of discount at Food Area
    print("\n--- Test case 20 ---")
    print("Hourly Employee - Manager")
    do {
      let date = dateFormatter.date(from: "05/19/1975")
      let manager = try Manager(firstName: "Luigi", lastName: "Pirandello", birthday: date, streetAddress: "Via dei poeti 4", city: "Bologna", state: "Italia", zipCode: 21345, socialSecurityNumber: 41, managementTier: .shift)
      if let infoEmployee = manager.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: manager)
      
      print("\n" + checkpoint.percentageDiscount(atArea: .food, withPass: &pass))
      
    } catch let error{
      print("Error Employee - Manager: \(error)")
    }
    
    // Hourly Employee - Manager
    // Bonus: Failed second swipe within 5 seconds and Successed third swipe after 6 seconds
    print("\n--- Test case 21 ---")
    print("Hourly Employee - Manager")
    do {
      let date = dateFormatter.date(from: "06/20/1985")
      let manager = try Manager(firstName: "Dries", lastName: "Mertens", birthday: date, streetAddress: "Via dei calciatori 21", city: "Firenze", state: "Italia", zipCode: 23087, socialSecurityNumber: 52, managementTier: .general)
      if let infoEmployee = manager.print() { print(infoEmployee) }
      
      var pass = Pass(entrant: manager)
      
      print("\n" + checkpoint.canAccess(toArea: .office, withPass: &pass))
      
      // Failed swipe: within 5 seconds
      print("\n" + checkpoint.canAccess(toArea: .maintenance, withPass: &pass))
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
        // Successed swipe: after 5 seconds
        print("\n" + self.checkpoint.canAccess(toArea: .maintenance, withPass: &pass))
      }
      
    } catch let error{
      print("Error Employee - Manager: \(error)")
    }
    
    
  }
 */
}

