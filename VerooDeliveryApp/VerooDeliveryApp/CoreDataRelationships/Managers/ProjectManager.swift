//
//  ProjectManager.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation

struct ProjectManager {
    
    private let _projectDataRepo = ProjectsDataRepository()

    func createProjects(record: Projects) {
        _projectDataRepo.create(record: record)
    }

    func getAllProjects() -> [Projects]? {
        return _projectDataRepo.getAll()
    }
    
    func getById(byIdentifier id: UUID) -> Projects? {
        return _projectDataRepo.get(byIdentifier: id)
    }
    
}
