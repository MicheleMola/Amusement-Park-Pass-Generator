//
//  PassViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michele Mola on 04/06/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {
  
  var pass: Pass?
  
  @IBOutlet weak var fullNameLabel: UILabel!
  @IBOutlet weak var passType: UILabel!
  
  @IBOutlet weak var rideAccessLabel: UILabel!
  @IBOutlet weak var foodDiscountLabel: UILabel!
  @IBOutlet weak var merchandiseDiscountLabel: UILabel!
  
  @IBOutlet weak var responseLabel: UILabel!
  @IBOutlet weak var responseView: UIView!
  
  let checkpoint = Checkpoint()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    if let pass = pass {
      passType.text = pass.type.rawValue
      
      switch pass.type {
      case .childGuest, .vipGuest, .classicGuest:
        fullNameLabel.text = ""
      case .seasonGuest:
        if let seasonGuest = pass.entrant as? SeasonPass, let firstName = seasonGuest.firstName, let lastName = seasonGuest.lastName { fullNameLabel.text = "\(firstName) \(lastName)" }
      case .seniorGuest:
        if let seniorGuest = pass.entrant as? Senior, let firstName = seniorGuest.firstName, let lastName = seniorGuest.lastName { fullNameLabel.text = "\(firstName) \(lastName)" }
      case .foodServicesEmployee, .rideServicesEmployee, .maintenanceEmployee, .manager, .contractEmployee:
        if let employee = pass.entrant as? Employee, let firstName = employee.firstName, let lastName = employee.lastName { fullNameLabel.text = "\(firstName) \(lastName)" }
      case .vendor:
        if let vendor = pass.entrant as? Vendor, let firstName = vendor.firstName, let lastName = vendor.lastName {
          fullNameLabel.text = "\(firstName) \(lastName)"
          if let companyName = vendor.company {
            passType.text?.append(" - Company name: \(companyName)")
          }
        }
      }
      
      if pass.entrant.rideAccess.contains(.all) {
        rideAccessLabel.text = "• Unlimited Rides"
      }
      
      let foodDiscount = pass.entrant.discountAccess.food
      foodDiscountLabel.text = "• \(foodDiscount)% Food Discount"
      
      let merchandiseDiscount = pass.entrant.discountAccess.merchandise
      merchandiseDiscountLabel.text = "• \(merchandiseDiscount)% Merchandise Discount"
    }
  }
  
  
  @IBAction func accessPressed(_ sender: UIButton) {
    if pass != nil {
      var feedbackTuple: (message: String, feedback: Bool) = (String(), Bool())
      switch sender.tag {
      case 0:
        feedbackTuple = checkpoint.canAccess(toArea: .office, withPass: &pass!)
      case 1:
        feedbackTuple = checkpoint.canAccess(toArea: .kitchen, withPass: &pass!)
      case 2:
        feedbackTuple = checkpoint.canAccess(toArea: .rideControl, withPass: &pass!)
      case 3:
        feedbackTuple = checkpoint.canAccess(toArea: .amusement, withPass: &pass!)
      case 4:
        feedbackTuple = checkpoint.canAccessToRides(withPass: &pass!)
      case 5:
        feedbackTuple = checkpoint.percentageDiscount(atArea: .food, withPass: &pass!)
      case 6:
        feedbackTuple = checkpoint.percentageDiscount(atArea: .merchandise, withPass: &pass!)
      case 7:
        feedbackTuple = checkpoint.canAccess(toArea: .maintenance, withPass: &pass!)
      default:
        break
      }
      
      returnResponse(withMessage: feedbackTuple.message, andFeedback: feedbackTuple.feedback)
    }
    
  }
  
  func returnResponse(withMessage message: String, andFeedback feedback: Bool) {
    responseLabel.text = message
    responseView.backgroundColor? = feedback ? .green : .red
  }
  

}
