//
//  PassportCell.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import UIKit

class PassportCell: UITableViewCell {

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var passportID: UILabel!
    
    static func cellConfiguration(cell: PassportCell, indexPath: IndexPath, data: [Passports]) {
        cell.employeeName.text = data[indexPath.row].name
        cell.passportID.text = data[indexPath.row].passportID
    }
    
}
