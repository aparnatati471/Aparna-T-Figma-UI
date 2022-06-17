//
//  EmployeeManager.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation

struct EmployeesManager {
    
    private let _employeeDataRepo = EmployeesDataRepository()
    
    func create(record: Employees) -> Bool {
        if(validatePassport(passport: record.passport) == false) {
            record.passport = nil
        }
        _employeeDataRepo.create(record: record)
        return true
    }
    
    func getAllEmployee() -> [Employees]? {
        return _employeeDataRepo.getAll()
    }
    
    func deleteEmployee(byIdentified id: UUID) -> Bool {
        return _employeeDataRepo.delete(id: id)
    }
    
    func updateEmployee(record: Employees) -> Bool {
        return _employeeDataRepo.update(record: record)
    }
    
    func countEmployee() -> Int {
        return _employeeDataRepo.count()
    }
    
    private func validatePassport(passport: Passports?) -> Bool {
        if(passport == nil || passport?.passportID?.isEmpty == true || passport?.placeofIsuue?.isEmpty == true) {
            return false
        }
        return true
    }
    
}
