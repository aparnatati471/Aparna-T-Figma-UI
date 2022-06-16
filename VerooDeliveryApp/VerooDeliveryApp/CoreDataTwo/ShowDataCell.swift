//
//  ShowDataCell.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import UIKit

class ShowDataCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    static func cellConfiguration(cell: ShowDataCell, indexPath: IndexPath, data: [Employee]) {
        cell.name.text = data[indexPath.row].name
        cell.email.text = data[indexPath.row].email
    }
    
}
