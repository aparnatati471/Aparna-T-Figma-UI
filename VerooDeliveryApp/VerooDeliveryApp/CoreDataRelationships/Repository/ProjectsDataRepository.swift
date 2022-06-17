//
//  ProjectsDataRepository.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation
import CoreData

protocol ProjectsRepo: BaseRepository {
}

struct ProjectsDataRepository: ProjectsRepo {
    
    typealias T = Projects

    func create(record: Projects) {
        let cdProject = CDProject(context: PersistentStorage.shared.context)
        cdProject.id = record.id
        cdProject.title = record.title
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Projects]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDProject.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Projects] = []
        records?.forEach({ (cdProject) in
            results.append(cdProject.convertToProject()!)
        })
        return results
    }
    
    func get(byIdentifier id: UUID) -> Projects? {
        let result = self.getCdProject(byId: id)
        guard result != nil else {
            return nil
        }
        return result?.convertToProject()
    }
    
    func update(record: Projects) -> Bool {
        let cdProject = self.getCdProject(byId: record.id)
        guard cdProject != nil else {return false}
        cdProject?.title = record.title
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let project = getCdProject(byId: id)
        guard project != nil else {return false}

        PersistentStorage.shared.context.delete(project!)
        PersistentStorage.shared.saveContext()

        return true
    }
    
    private func getCdProject(byId id: UUID) -> CDProject? {
        let fetchRequest = NSFetchRequest<CDProject>(entityName: "CDProject")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        
        return result.first
    }
    
}
