//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var typeSegmentedControl: SegmentedControl!
  @IBOutlet weak var subtypeSegmentedControl: SegmentedControl!
  
  // Form labels
  @IBOutlet weak var dateOfBirthLabel: UILabel!
  @IBOutlet weak var ssnLabel: UILabel!
  @IBOutlet weak var projectNumberLabel: UILabel!
  @IBOutlet weak var firstnameLabel: UILabel!
  @IBOutlet weak var lastnameLabel: UILabel!
  @IBOutlet weak var companyLabel: UILabel!
  @IBOutlet weak var streetAddressLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var stateLabel: UILabel!
  @IBOutlet weak var zipCodeLabel: UILabel!
  @IBOutlet weak var dateOfVisitLabel: UILabel!
  
  // Form text fields
  @IBOutlet weak var dateOfBirthTextField: UITextField!
  @IBOutlet weak var ssnTextField: UITextField!
  @IBOutlet weak var projectNumberTextField: UITextField!
  @IBOutlet weak var firstnameTextField: UITextField!
  @IBOutlet weak var lastnameTextField: UITextField!
  @IBOutlet weak var companyTextField: UITextField!
  @IBOutlet weak var streetAddressTextField: UITextField!
  @IBOutlet weak var cityTextField: UITextField!
  @IBOutlet weak var stateTextField: UITextField!
  @IBOutlet weak var zipCodeTextField: UITextField!
  @IBOutlet weak var dateOfVisitTextField: UITextField!
  
  
  typealias LabelAndTextField = (label: UILabel, textField: UITextField)
  
  lazy var dateOfBirthGroup: LabelAndTextField = (dateOfBirthLabel, dateOfBirthTextField)
  lazy var ssnGroup: LabelAndTextField = (ssnLabel, ssnTextField)
  lazy var projectNumberGroup: LabelAndTextField = (projectNumberLabel, projectNumberTextField)
  lazy var firstnameGroup: LabelAndTextField = (firstnameLabel, firstnameTextField)
  lazy var lastnameGroup: LabelAndTextField = (lastnameLabel, lastnameTextField)
  lazy var companyGroup: LabelAndTextField = (companyLabel, companyTextField)
  lazy var streetAddressGroup: LabelAndTextField = (streetAddressLabel, streetAddressTextField)
  lazy var cityGroup: LabelAndTextField = (cityLabel, cityTextField)
  lazy var stateGroup: LabelAndTextField = (stateLabel, stateTextField)
  lazy var zipCodeGroup: LabelAndTextField = (zipCodeLabel, zipCodeTextField)
  lazy var dateOfVisitGroup: LabelAndTextField = (dateOfVisitLabel, dateOfVisitTextField)
  
  lazy var fieldsCollection: [LabelAndTextField] = [dateOfBirthGroup, ssnGroup, projectNumberGroup, firstnameGroup, lastnameGroup, companyGroup, streetAddressGroup, cityGroup, stateGroup, zipCodeGroup, dateOfVisitGroup]
  
  lazy var childCollection: [LabelAndTextField] = [dateOfBirthGroup]
  lazy var seasonPassCollection: [LabelAndTextField] = [firstnameGroup, lastnameGroup, streetAddressGroup, cityGroup, stateGroup, zipCodeGroup, dateOfBirthGroup]
  lazy var seniorCollection: [LabelAndTextField] = [firstnameGroup, lastnameGroup, dateOfBirthGroup]
  lazy var employeeBaseCollection: [LabelAndTextField] = [firstnameGroup, lastnameGroup, streetAddressGroup, cityGroup, stateGroup, zipCodeGroup, dateOfBirthGroup, ssnGroup]
  lazy var contractCollection: [LabelAndTextField] = [firstnameGroup, lastnameGroup, streetAddressGroup, cityGroup, stateGroup, zipCodeGroup, dateOfBirthGroup, ssnGroup, projectNumberGroup]
  lazy var vendorCollection: [LabelAndTextField] = [firstnameGroup, lastnameGroup, dateOfVisitGroup, dateOfBirthGroup]
  
  var selectedType: String {
    return typeSegmentedControl.titleForSegment(at: typeSegmentedControl.selectedSegmentIndex)!
  }
  
  var selectedSubtype: String {
    return subtypeSegmentedControl.titleForSegment(at: subtypeSegmentedControl.selectedSegmentIndex)!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    showSubtype()
    setEnabled(fromGroup: fieldsCollection, toValue: false)
  }
  
  @IBAction func typeSegmentedControlPressed() {
    showSubtype()
  }
  
  @IBAction func subtypeSegmentedControlPressed() {
    configureForm()
  }
  
  func showSubtype() {
    var subtypes = [String]()
    switch selectedType {
    case "Guest":
      subtypes = GuestType.all
    case "Employee":
      subtypes = EmployeeType.all
    case "Manager":
      subtypes = ManagerType.all
    case "Vendor":
      subtypes = VendorName.all
    default:
      subtypes = []
    }
    
    subtypeSegmentedControl.removeAllSegments()
    
    for (index, subtype) in subtypes.enumerated() {
      subtypeSegmentedControl.insertSegment(withTitle: subtype, at: index, animated: true)
    }
  }
  
  func configureForm() {
    setEnabled(fromGroup: fieldsCollection, toValue: false)
    
    var fieldsToEnable: [LabelAndTextField] = [LabelAndTextField]()
    
    switch selectedType {
    case "Guest":
      switch selectedSubtype {
      case GuestType.child.rawValue:
        fieldsToEnable = childCollection
      case GuestType.senior.rawValue:
        fieldsToEnable = seniorCollection
      case GuestType.seasonPass.rawValue:
        fieldsToEnable = seasonPassCollection
      default:
        break
      }
    case "Employee":
      switch selectedSubtype {
      case EmployeeType.foodServices.rawValue, EmployeeType.maintenance.rawValue, EmployeeType.rideServices.rawValue:
        fieldsToEnable = employeeBaseCollection
      case EmployeeType.contract.rawValue:
        fieldsToEnable = contractCollection
      default:
        break
      }
    case "Manager":
      // Management tier from selected subtype
      
      fieldsToEnable = employeeBaseCollection
      
    case "Vendor":
      companyTextField.text = selectedSubtype
      fieldsToEnable = vendorCollection
    default:
      break
    }
    
    setEnabled(fromGroup: fieldsToEnable, toValue: true)
  }
  
  func setEnabled(fromGroup group: [LabelAndTextField], toValue value: Bool) {
    group.forEach({ label, textField in
      label.isEnabled = value
      textField.isEnabled = value
      textField.text?.removeAll()
    })
  }
  
  
  @IBAction func populateDataPressed(_ sender: UIButton) {
    
  }
  
  
  @IBAction func generatePassPressed(_ sender: UIButton) {
  }
  
  
  
  
}
