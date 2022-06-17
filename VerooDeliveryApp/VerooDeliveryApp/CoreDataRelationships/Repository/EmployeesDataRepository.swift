//
//  EmployeesDataRepository.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation
import CoreData

protocol EmployeesRepo1: BaseRepository {
}

struct EmployeesDataRepository: EmployeesRepo1 {
    
    typealias T = Employees
    
    func create(record: Employees) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = record.id
        cdEmployee.email = record.email
        cdEmployee.name = record.name
        if(record.passport != nil) {
            let cdPassport = CDPassport(context: PersistentStorage.shared.context)
            cdPassport.passportID = record.passport?.passportID
            cdPassport.id = record.passport?.id
            cdPassport.placeofIssue = record.passport?.placeofIsuue
            cdEmployee.toPassport = cdPassport
        }
        if(record.projects != nil) {
            var projectSet = Set<CDProject>()
            guard let count = record.projects?.count else { return }
            for i in 0..<count {
                let cdProject = CDProject(context: PersistentStorage.shared.context)
                cdProject.id = record.projects?[i].id
                cdProject.title = record.projects?[i].title
                projectSet.insert(cdProject)
            }
            cdEmployee.toProject = projectSet as NSSet
        }
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employees]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employees: [Employees] = []
        result?.forEach({ (cdEmployee) in
            employees.append(cdEmployee.convertToEmployees()!)
        })
        return employees
    }
    
    func get(byIdentifier id: UUID) -> Employees? {
        let result = self.getCdEmployee(byId: id)
        guard result != nil else {return nil}
        return result?.convertToEmployees()
    }
    
    func update(record: Employees) -> Bool {
        let cdEmployee = self.getCdEmployee(byId: record.id)
        guard cdEmployee != nil else {return false}
        cdEmployee?.email = record.email
        cdEmployee?.name = record.name
        cdEmployee?.toPassport?.placeofIssue = record.passport?.placeofIsuue
        cdEmployee?.toPassport?.passportID = record.passport?.passportID
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let result = self.getCdEmployee(byId: id)
        guard result != nil else { return false }
        PersistentStorage.shared.context.delete(result!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func count() -> Int {
        return getAll()?.count ?? 1
    }
    
    private func getCdEmployee(byId id: UUID) -> CDEmployee? {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById
        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        return result.first
    }
    
}
