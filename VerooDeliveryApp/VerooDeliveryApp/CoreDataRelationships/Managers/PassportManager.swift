//
//  PassportManager.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation

struct PassportManager {
    
    private let _passportDataRepo = PassportDataRepository()

    func create(record: Passports) {
        _passportDataRepo.create(record: record)
    }

    func getAllPassports() -> [Passports]? {
        return _passportDataRepo.getAll()
    }

    func deleteEmployee(byIdentifier id: UUID) -> Bool {
        return _passportDataRepo.delete(id: id)
    }
    
}
