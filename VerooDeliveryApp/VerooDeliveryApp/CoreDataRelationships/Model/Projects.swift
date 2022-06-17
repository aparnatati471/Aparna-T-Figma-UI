//
//  Projects.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation

class Projects {
    
    let id: UUID
    let title: String?
    let name: String?
    
    init(_id: UUID, _title: String?, _name: String?) {
        self.id = _id
        self.title = _title
        self.name  = _name
    }
    
}
