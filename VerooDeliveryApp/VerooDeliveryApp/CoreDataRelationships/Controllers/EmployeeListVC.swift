//
//  EmployeeListVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import UIKit

class EmployeeListVC: BaseViewController<EmployeePassportCoordinator, BaseViewModel> {

    @IBOutlet weak var tblEmployee: UITableView!
    private var manager = EmployeesManager()
    var employeeData: [Employees]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizable.employeeTitle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        employeeData = manager.getAllEmployee()
        if(employeeData != nil && employeeData?.count != 0) {
            self.tblEmployee.reloadData()
        }
    }
    
}

extension EmployeeListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblEmployee.dequeueReusableCell(withIdentifier: R.reuseIdentifier.empCell.identifier) as? EmployeeCell else { return UITableViewCell() }
        if let data = employeeData {
            EmployeeCell.cellConfiguration(cell: cell, indexPath: indexPath, data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "EmployeePassport", bundle: nil)
        guard let data = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailsVC") as? EmployeeDetailsVC else { return }
        guard let empData = employeeData else { return }
        data.selectedEmployee = empData[indexPath.row]
        self.navigationController?.pushViewController(data, animated: true)
    }
    
}
