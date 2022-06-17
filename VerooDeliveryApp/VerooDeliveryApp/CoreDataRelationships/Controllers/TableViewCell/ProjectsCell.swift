//
//  ProjectsCell.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 22/06/22.
//

import UIKit

class ProjectsCell: UITableViewCell {
    
    @IBOutlet weak var projectTitle: UILabel!
    
    static func cellConfiguration(cell: ProjectsCell, indexPath: IndexPath, data: [Projects]) {
        cell.projectTitle.text = data[indexPath.row].title
    }
    
}
