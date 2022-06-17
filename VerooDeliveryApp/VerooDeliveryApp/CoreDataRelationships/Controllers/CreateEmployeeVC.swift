//
//  CreateEmployeeVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import UIKit

class CreateEmployeeVC: BaseViewController<EmployeePassportCoordinator, BaseViewModel> {

    @IBOutlet weak var txtPlaceOfIssue: UITextField!
    @IBOutlet weak var txtPassportNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    private let manager = EmployeesManager()
    private var placeOfIssuePicker: UIPickerView!
    let places = ["Ahmedabad", "Bangalore", "Delhi","Indore", "Jaipur","Mumbai", "Pune"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillSetUp()
    }

    func viewWillSetUp() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissPicker))

        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        placeOfIssuePicker = UIPickerView()
        placeOfIssuePicker.delegate = self
        placeOfIssuePicker.dataSource = self

        self.txtPlaceOfIssue.inputView = placeOfIssuePicker
        self.txtPlaceOfIssue.inputAccessoryView = toolBar
    }
    
    @objc func dismissPicker() {
        self.view.endEditing(true)
    }

    @IBAction func saveClicked(_ sender: UIButton) {
        let passport = Passports(_id: UUID(), _passportID: self.txtPassportNo.text, _placeOfIssue: self.txtPlaceOfIssue.text, _name: self.txtName.text)
        let project = Projects(_id: UUID(), _title: "My Project1", _name: self.txtName.text)
        let project1 = Projects(_id: UUID(), _title: "My Project2", _name: self.txtName.text)
        let project2 = Projects(_id: UUID(), _title: "My Project3", _name: self.txtName.text)
        let employee = Employees(_id: UUID(), _name: self.txtName.text, _email: self.txtEmail.text, _passport: passport, _projects: [project, project1, project2])
        manager.create(record: employee) ? displayAlert(alertMessage: "Data Saved Successfully") : displayAlert(alertMessage: "Data not saved")
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        self.txtName.text = nil
        self.txtEmail.text = nil
        self.txtPassportNo.text = nil
        self.txtPlaceOfIssue.text = nil
    }
    
    private func displayAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}

extension CreateEmployeeVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return places[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtPlaceOfIssue.text = places[row]
    }
    
}

