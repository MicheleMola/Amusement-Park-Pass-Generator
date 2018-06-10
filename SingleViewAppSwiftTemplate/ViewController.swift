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
  
  lazy var guestType = [GuestType.classic.rawValue, GuestType.vip.rawValue, GuestType.child.rawValue, GuestType.senior.rawValue, GuestType.seasonPass.rawValue]
  lazy var employeeType = [EmployeeType.foodServices.rawValue, EmployeeType.rideServices.rawValue, EmployeeType.maintenance.rawValue, EmployeeType.contract.rawValue]
  lazy var managerType = [ManagerType.shift.rawValue, ManagerType.general.rawValue, ManagerType.senior.rawValue]
  lazy var vendorType = [VendorName.acme.rawValue, VendorName.orkin.rawValue, VendorName.fedex.rawValue, VendorName.nwElectrical.rawValue]
  
  let projectNumbers = ["1001", "1002", "1003", "2001", "2002"]
  
  var entrantType: EntrantType = EntrantType.none
  
  var datePickerView: UIDatePicker = UIDatePicker()
  var selectedTextField: UITextField = UITextField()
  
  let pickerView = UIPickerView()
  
  @IBOutlet weak var generatePassButton: UIButton!
  
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
    
    generatePassButton.isEnabled = false
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    
    projectNumberTextField.inputView = pickerView
    pickerView.delegate = self
    
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedPickerView))
    toolbar.setItems([done], animated: false)
    
    projectNumberTextField.inputAccessoryView = toolbar
  }
  
  @IBAction func typeSegmentedControlPressed() {
    showSubtype()
  }
  
  @IBAction func subtypeSegmentedControlPressed() {
    configureForm()
  }
  
  func showSubtype() {
    setEnabled(fromGroup: fieldsCollection, toValue: false)
    subtypeSegmentedControl.removeAllSegments()
    
    var subtypes = [String]()
    switch selectedType {
    case "Guest":
      subtypes = guestType
    case "Employee":
      subtypes = employeeType
    case "Manager":
      subtypes = managerType
    case "Vendor":
      subtypes = vendorType
    default:
      subtypes = []
    }
    
    for (index, subtype) in subtypes.enumerated() {
      subtypeSegmentedControl.insertSegment(withTitle: subtype, at: index, animated: true)
    }
  }
  
  func configureForm() {
    setEnabled(fromGroup: fieldsCollection, toValue: false)
    
    var fieldsToEnable: [LabelAndTextField] = [LabelAndTextField]()
    
    generatePassButton.isEnabled = true
    
    switch selectedType {
    case "Guest":
      switch selectedSubtype {
      case GuestType.child.rawValue:
        fieldsToEnable = childCollection
        entrantType = .guest(type: .child)
      case GuestType.senior.rawValue:
        fieldsToEnable = seniorCollection
        entrantType = .guest(type: .senior)
      case GuestType.seasonPass.rawValue:
        fieldsToEnable = seasonPassCollection
        entrantType = .guest(type: .seasonPass)
      case GuestType.classic.rawValue:
        entrantType = .guest(type: .classic)
      case GuestType.vip.rawValue:
        entrantType = .guest(type: .vip)
      default:
        break
      }
    case "Employee":
      switch selectedSubtype {
      case EmployeeType.foodServices.rawValue:
        fieldsToEnable = employeeBaseCollection
        entrantType = .employee(type: .foodServices)
      case EmployeeType.maintenance.rawValue:
        fieldsToEnable = employeeBaseCollection
        entrantType = .employee(type: .maintenance)
      case EmployeeType.rideServices.rawValue:
        fieldsToEnable = employeeBaseCollection
        entrantType = .employee(type: .rideServices)
      case EmployeeType.contract.rawValue:
        fieldsToEnable = contractCollection
        entrantType = .employee(type: .contract)
      default:
        break
      }
    case "Manager":
      fieldsToEnable = employeeBaseCollection
      entrantType = .manager
      
    case "Vendor":
      companyTextField.text = selectedSubtype
      fieldsToEnable = vendorCollection
      entrantType = .vendor
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
    populateForm()
  }
  
  
  @IBAction func generatePassPressed(_ sender: UIButton) {
    let pass = generatePass()
    if let pass = pass {
      performSegue(withIdentifier: "showPass", sender: pass)
    }
  }
  
  @IBAction func textFieldDateEditing(_ sender: UITextField) {
    datePickerView.datePickerMode = .date
    
    sender.inputView = datePickerView
    
    selectedTextField = sender
      
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedDataPickerView))
    toolbar.setItems([done], animated: false)
    
    sender.inputAccessoryView = toolbar
    sender.inputView = datePickerView
    
    datePickerView.datePickerMode = .date
  }
  
  @objc func donePressedDataPickerView() {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM / dd / yyyy"
    
    let dateString = formatter.string(from: datePickerView.date)
    selectedTextField.text = "\(dateString)"
    self.view.endEditing(true)
  }
  
  @objc func donePressedPickerView() {
    self.view.endEditing(true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showPass" {
      if let passViewController = segue.destination as? PassViewController {
        passViewController.pass = sender as? Pass
      }
    }
  }
}


// Populate Form & Generate Pass
extension ViewController {
  
  func getText(fromTextFieldTag tag: Int) -> String? {
    switch tag {
    case 0:
      if selectedSubtype == GuestType.child.rawValue {
        return "12 / 10 / 2015"
      }
      return "12 / 10 / 1982"
    case 1:
      return "081-32-2678"
    case 2:
      guard let projectNumber = projectNumbers.randomItem() else { return nil }
      return "\(projectNumber)"
    case 3:
      return "Michele"
    case 4:
      return "Mola"
    case 6:
      return "06 / 01 / 2018"
    case 7:
      return "Via Giacomo Leopardi 10"
    case 8:
      return "Naples"
    case 9:
      return "Italy"
    case 10:
      return "80147"
    default:
      return nil
    }
  }
  
  func populateForm() {
    fieldsCollection.forEach({ label, textField in
      if textField.isEnabled {
        textField.text = getText(fromTextFieldTag: textField.tag)
      }
    })
  }
  
  
  func generatePass() -> Pass? {
    var entrant: Entrant!
    var passType: PassType
    
    switch entrantType {
    case .employee(let type):
      switch type {
      case .rideServices:
        do {
          let employee = try RideServiceEmployee(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text.convertToInt(), socialSecurityNumber: ssnTextField.text)
          entrant = employee
          passType = .rideServicesEmployee
        } catch let error {
          showAlert(withError: error)
          return nil
        }

      case .foodServices:
        do {
          let employee = try FoodServiceEmployee(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text.convertToInt(), socialSecurityNumber: ssnTextField.text)
          entrant = employee
          passType = .foodServicesEmployee
        } catch let error {
          showAlert(withError: error)
          return nil
        }
        
      case .contract:
        do {
          let employee = try Contract(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text.convertToInt(), socialSecurityNumber: ssnTextField.text, projectNumber: projectNumberTextField.text.convertToInt())
          entrant = employee
          passType = .contractEmployee
        } catch let error {
          showAlert(withError: error)
          return nil
        }
        
      case .maintenance:
        do {
          let employee = try MaintenanceEmployee(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text.convertToInt(), socialSecurityNumber: ssnTextField.text)
          entrant = employee
          passType = .maintenanceEmployee
        } catch let error {
          showAlert(withError: error)
          return nil
        }
        
      }
    case .manager:
      do {
        let managerType = ManagerType(rawValue: selectedSubtype)
        let employee = try Manager(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text.convertToInt(), socialSecurityNumber: ssnTextField.text, managementTier: managerType)
        entrant = employee
        passType = .manager
      } catch let error {
        showAlert(withError: error)
        return nil
      }
    case .guest(let type):
      switch type {
      case .child:
        do {
          let guest = try Child(birthday: getDate(fromTextField: dateOfBirthTextField))
          entrant = guest
          passType = .childGuest
        } catch let error {
          showAlert(withError: error)
          return nil
        }
      case .classic:
        let guest = Classic()
        entrant = guest
        passType = .classicGuest
      case .seasonPass:
        do {
          let guest =  try SeasonPass(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text.convertToInt())
          entrant = guest
          passType = .seasonGuest
        } catch let error {
          showAlert(withError: error)
          return nil
        }
        
      case .senior:
        do {
          let guest = try Senior(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField))
          entrant = guest
          passType = .seniorGuest
        } catch let error {
          showAlert(withError: error)
          return nil
        }
      case .vip:
        let guest = Vip()
        entrant = guest
        passType = .vipGuest
      }
    case .vendor:
      do {
        let vendor = try VendorCompany(firstName: firstnameTextField.text, lastName: lastnameTextField.text, birthday: getDate(fromTextField: dateOfBirthTextField), company: companyTextField.text, dateOfVisit: getDate(fromTextField: dateOfVisitTextField))
        entrant = vendor
        passType = .vendor
      } catch let error {
        showAlert(withError: error)
        return nil
      }
    default:
      return nil
    }
    return Pass(entrant: entrant, type: passType)
  }
  
  func getDate(fromTextField textField: UITextField) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM / dd / yyyy"
    
    guard let dateText = textField.text else { return nil }
    let date = dateFormatter.date(from: dateText)
    return date
  }
  
  func showAlert(withError error: Error) {
    var message = String()
    
    if let error = error as? InvalidField {
      message = error.rawValue
    } else {
      message = error.localizedDescription
    }
    
    let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
}

// Keyboard & PickerView for Project Number
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return projectNumbers.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return projectNumbers[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    projectNumberTextField.text = projectNumbers[row]
  }
  
  
  @objc func keyboardWillShow(sender: NSNotification) {
    self.view.frame.origin.y -= self.view.frame.origin.y != 0 ? 0 : 150
  }
  
  @objc func keyboardWillHide(sender: NSNotification) {
    self.view.frame.origin.y += 150
  }
  
}

