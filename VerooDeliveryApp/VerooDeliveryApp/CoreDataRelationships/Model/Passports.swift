//
//  Passport.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation

class Passports {
    
    let id: UUID
    let passportID, placeofIsuue, name: String?
    
    init(_id: UUID, _passportID: String?, _placeOfIssue: String?, _name: String?) {
        self.id = _id
        self.passportID = _passportID
        self.placeofIsuue = _placeOfIssue
        self.name = _name
    }
    
}
