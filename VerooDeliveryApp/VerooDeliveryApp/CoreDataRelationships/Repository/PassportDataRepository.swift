//
//  PassportRepository.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation
import CoreData

protocol PassportRepo: BaseRepository {
}

struct PassportDataRepository: PassportRepo {
    
    typealias T = Passports

    func create(record: Passports) {
        let cdPassport = CDPassport(context: PersistentStorage.shared.context)
        cdPassport.id = record.id
        cdPassport.passportID = record.passportID
        cdPassport.placeofIssue = record.placeofIsuue
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Passports]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDPassport.self)
        var passports: [Passports] = []
        result?.forEach({ (cdPassports) in
            passports.append(cdPassports.convertToPassport()!)
        })
        return passports
    }
    
    func get(byIdentifier id: UUID) -> Passports? {
        let result = self.getCdPassport(byId: id)
        guard result != nil else {
            return nil
        }
        return result?.convertToPassport()
    }
    
    func update(record: Passports) -> Bool {
        let cdPassport = self.getCdPassport(byId: record.id)
        guard cdPassport != nil else {return false}
        return false
    }
    
    func delete(id: UUID) -> Bool {
        let employee = getCdPassport(byId: id)
        guard employee != nil else {return false}
        PersistentStorage.shared.context.delete(employee!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    private func getCdPassport(byId id: UUID) -> CDPassport? {
        let fetchRequest = NSFetchRequest<CDPassport>(entityName: "CDPassport")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById
        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        return result.first
    }

}
