//
//  ShowDataVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import UIKit

class ShowDataVC: BaseViewController<ShowsDataCoordinator, BaseViewModel> {
    
    @IBOutlet weak var tblEmployees: UITableView!
    private var employeeManager = EmployeeManager()
    var employeeData: [Employee]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizable.employeeTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        employeeData = employeeManager.fetchEmployee()
        if(employeeData != nil && employeeData?.count != 0) {
            self.tblEmployees.reloadData()
        }
    }
    
}

extension ShowDataVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblEmployees.dequeueReusableCell(withIdentifier: R.reuseIdentifier.employeeCell.identifier) as? ShowDataCell else { return UITableViewCell() }
        if let data = employeeData {
            ShowDataCell.cellConfiguration(cell: cell, indexPath: indexPath, data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "CoreData", bundle: nil)
        guard let data = storyboard.instantiateViewController(withIdentifier: "UpdateDeleteVC") as? UpdateDeleteVC else { return }
        guard let empData = employeeData else { return }
        data.selectedEmployee = empData[indexPath.row]
        self.navigationController?.pushViewController(data, animated: true)
    }

}
