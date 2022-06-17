//
//  EmployeeCell.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var empEmail: UILabel!
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empImage: UIImageView!
    
    static func cellConfiguration(cell: EmployeeCell, indexPath: IndexPath, data: [Employees]) {
        cell.empEmail.text = data[indexPath.row].email
        cell.empName.text = data[indexPath.row].name
    }
    
    
}
