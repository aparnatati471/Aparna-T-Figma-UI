//
//  CDEmployeeExtension.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation

extension CDEmployee {
    
    func convertToEmployees() -> Employees? {
        return Employees(_id: self.id ?? UUID(), _name: self.name, _email: self.email, _passport: self.toPassport?.convertToPassport())
    }
    
}
