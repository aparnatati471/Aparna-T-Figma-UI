//
//  UpdateDeleteVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import UIKit

class UpdateDeleteVC: BaseViewController<ShowDetailsCoordinator, BaseViewModel> {

    @IBOutlet weak var tfEmail: CustomTextField!
    @IBOutlet weak var tfName: CustomTextField!
    private let manager = EmployeeManager()
    var selectedEmployee: Employee? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tfEmail.text = selectedEmployee?.email
        self.tfName.text = selectedEmployee?.name
    }
    
    @IBAction func updateClicked(_ sender: CustomButtonTwo) {
        let title = R.string.localizable.updateAlertTitle()
        manager.updateEmployee(employee: Employee(name: tfName.text, email: tfEmail.text, id: selectedEmployee?.id ?? UUID())) ? alert(title: title, message: R.string.localizable.updateAlertMsg()) : alert(title: title, message: R.string.localizable.updateAlertFailMsg())
    }
    
    @IBAction func deleteClicked(_ sender: CustomButtonTwo) {
        let title = R.string.localizable.deleteAlertTitle()
        manager.deleteEmployee(id: selectedEmployee?.id ?? UUID()) ? alert(title: title, message: R.string.localizable.deleteAlertMsg()) : alert(title: title, message: R.string.localizable.deleteAlertFailMsg())
    }
    
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: R.string.localizable.done(), style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: true)
        })
        present(alertController, animated: true, completion: nil)
    }
    
}
