//
//  CDPassportExtension.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation

extension CDPassport {
    
    func convertToPassport() -> Passports? {
        return Passports(_id: self.id ?? UUID(), _passportID: self.passportID, _placeOfIssue: self.placeofIssue, _name: self.toEmployee?.name)
    }
    
}
