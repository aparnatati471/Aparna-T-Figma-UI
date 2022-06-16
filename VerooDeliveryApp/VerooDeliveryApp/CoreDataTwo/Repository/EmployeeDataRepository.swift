//
//  EmployeeDataRepository.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import Foundation
import CoreData

protocol EmployeeRepo {
    
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(id: UUID) -> Bool
    
}

struct EmployeeDataRepository: EmployeeRepo {
    
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = employee.id
        cdEmployee.name = employee.name
        cdEmployee.email = employee.email
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employess: [Employee] = []
        result?.forEach({ (cdEmployee) in
            let employee = Employee(name: cdEmployee.name, email: cdEmployee.email, id: cdEmployee.id ?? UUID())
            employess.append(employee)
        })
        return employess
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getByIdentifier(byIdentifier: id)
        guard result != nil else { return nil }
        return Employee(name: result?.name, email: result?.email, id: result?.id ?? UUID())
    }
    
    func update(employee: Employee) -> Bool {
        let cdEmployee = getByIdentifier(byIdentifier: employee.id)
        guard cdEmployee != nil else { return false }
        cdEmployee?.email = employee.email
        cdEmployee?.name = employee.name
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let result = getByIdentifier(byIdentifier: id)
        guard result != nil else { return false }
        PersistentStorage.shared.context.delete(result ?? CDEmployee())
        PersistentStorage.shared.saveContext()
        return true
    }
    
    private func getByIdentifier(byIdentifier id: UUID) -> CDEmployee? {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch let error {
            print(error)
        }
        return nil
    }
    
}

