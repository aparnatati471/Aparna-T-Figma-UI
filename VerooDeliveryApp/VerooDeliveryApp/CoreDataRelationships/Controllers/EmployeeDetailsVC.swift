//
//  EmployeeDetailsVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import UIKit

class EmployeeDetailsVC: UIViewController {
    
    private let manager = EmployeesManager()
    var selectedEmployee: Employees? = nil

    @IBOutlet weak var txtPassportIssuePlace: UITextField!
    @IBOutlet weak var txtPassportNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillSetup()
    }
    
    func viewWillSetup() {
        self.txtName.text = selectedEmployee?.name
        self.txtEmail.text = selectedEmployee?.email
        self.txtPassportNo.text = selectedEmployee?.passport?.passportID
        self.txtPassportIssuePlace.text = selectedEmployee?.passport?.placeofIsuue
    }
    
    
    @IBAction func updateClicked(_ sender: UIButton) {
        let title = R.string.localizable.updateAlertTitle()
        manager.updateEmployee(record: Employees(_id: selectedEmployee?.id ?? UUID(), _name: self.txtName.text, _email: self.txtEmail.text, _passport: Passports(_id: selectedEmployee?.id ?? UUID(), _passportID: self.txtPassportNo.text, _placeOfIssue: self.txtPassportIssuePlace.text, _name: self.txtName.text))) ? alert(title: title, message: R.string.localizable.updateAlertMsg()) : alert(title: title, message: R.string.localizable.updateAlertFailMsg())
    }
    
    @IBAction func deleteClicked(_ sender: UIButton) {
        let title = R.string.localizable.deleteAlertTitle()
        manager.deleteEmployee(byIdentified: selectedEmployee?.id ?? UUID()) ? alert(title: title, message: R.string.localizable.deleteAlertMsg()) : alert(title: title, message: R.string.localizable.deleteAlertFailMsg())
    }
    
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: R.string.localizable.done(), style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: true)
        })
        present(alertController, animated: true, completion: nil)
    }
    
}
