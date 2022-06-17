//
//  ProjectDetailsVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 22/06/22.
//

import UIKit

class ProjectDetailsVC: UIViewController {

    @IBOutlet weak var tblProjects: UITableView!
    private let manager = ProjectManager()
    var projectData: [Projects]? = nil
    var employeeData: [Employees]? = nil
    var projects: Projects? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizable.projectTitle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        projectData = manager.getAllProjects()
        employeeData = EmployeesManager().getAllEmployee()
        if(projectData?.count != 0 && projectData != nil) {
            self.tblProjects.reloadData()
        }
    }
    
}

extension ProjectDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return employeeData?.count ?? 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblProjects.dequeueReusableCell(withIdentifier: R.reuseIdentifier.projectCell.identifier) as? ProjectsCell else { return UITableViewCell() }
        if let data = projectData {
            ProjectsCell.cellConfiguration(cell: cell, indexPath: indexPath, data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = R.color.labelTextColor()
                
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width - 15, height: 30))
        label.text = employeeData?[section].name
        label.textColor = R.color.mainViewBackgroundColor()
        view.addSubview(label)
                
        return view
    }
    
    
}
