//
//  Employees.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation

class Employees {
    
    let id: UUID
    let name, email: String?
    var passport: Passports?
    var projects: [Projects]?
    
    init(_id: UUID, _name: String?, _email: String?, _passport: Passports?, _projects: [Projects]? = nil) {
        self.id = _id
        self.name = _name
        self.email = _email
        self.passport = _passport
        self.projects = _projects
    }
    
}
