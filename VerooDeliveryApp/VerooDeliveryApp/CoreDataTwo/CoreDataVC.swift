//
//  CoreDataVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import UIKit

class CoreDataVC: BaseViewController<CoreDataCoordinator, BaseViewModel> {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    private let manager: EmployeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tfName.text = ""
        tfEmail.text = ""
        tfPassword.text = ""
    }
    
    @IBAction func createEmployeeClicked(_ sender: UIButton) {
        manager.createEmployee(employee: Employee(name: tfName.text, email: tfEmail.text, id: UUID()))
        print("Data Saved Successfully!!")
        coordinator?.navigateToShowData()
    }
    
    @IBAction func alreadyRegistered(_ sender: CustomButtonTwo) {
        coordinator?.navigateToShowData()
    }
    
}
