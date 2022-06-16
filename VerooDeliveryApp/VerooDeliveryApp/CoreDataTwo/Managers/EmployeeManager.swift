//
//  EmployeeManager.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import Foundation

struct EmployeeManager {
    
    private let _employeeRepository = EmployeeDataRepository()
    
    func createEmployee(employee: Employee) {
        _employeeRepository.create(employee: employee)
    }
    
    func fetchEmployee() -> [Employee]? {
        return _employeeRepository.getAll()
    }
    
    func fetchEmployee(byIdentifier id: UUID) -> Employee? {
        return _employeeRepository.get(byIdentifier: id)
    }
    
    func updateEmployee(employee: Employee) -> Bool {
        return _employeeRepository.update(employee: employee)
    }
    
    func deleteEmployee(id: UUID) -> Bool {
        return _employeeRepository.delete(id: id)
    }
    
}
