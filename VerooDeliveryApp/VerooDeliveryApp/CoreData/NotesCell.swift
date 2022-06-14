//
//  NotesCell.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 15/06/22.
//

import UIKit

class NotesCell: UITableViewCell {

    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var name: UILabel!
    
    // Cell Configuration
    static func cellConfiguration(cell: NotesCell, indexPath: IndexPath, data: [Notes]) {
        cell.name.text = data[indexPath.row].name
        guard let date = data[indexPath.row].createdAt else { return }
        cell.createdAt.text = String(describing: date)
    }
    
}
