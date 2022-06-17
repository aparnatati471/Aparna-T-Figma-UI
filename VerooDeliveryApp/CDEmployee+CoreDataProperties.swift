//
//  CDEmployee+CoreDataProperties.swift
//  
//
//  Created by Aparna Tati on 21/06/22.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toPassport: CDPassport?
    @NSManaged public var toProject: NSOrderedSet?

}

// MARK: Generated accessors for toProject
extension CDEmployee {

    @objc(insertObject:inToProjectAtIndex:)
    @NSManaged public func insertIntoToProject(_ value: CDProject, at idx: Int)

    @objc(removeObjectFromToProjectAtIndex:)
    @NSManaged public func removeFromToProject(at idx: Int)

    @objc(insertToProject:atIndexes:)
    @NSManaged public func insertIntoToProject(_ values: [CDProject], at indexes: NSIndexSet)

    @objc(removeToProjectAtIndexes:)
    @NSManaged public func removeFromToProject(at indexes: NSIndexSet)

    @objc(replaceObjectInToProjectAtIndex:withObject:)
    @NSManaged public func replaceToProject(at idx: Int, with value: CDProject)

    @objc(replaceToProjectAtIndexes:withToProject:)
    @NSManaged public func replaceToProject(at indexes: NSIndexSet, with values: [CDProject])

    @objc(addToProjectObject:)
    @NSManaged public func addToToProject(_ value: CDProject)

    @objc(removeToProjectObject:)
    @NSManaged public func removeFromToProject(_ value: CDProject)

    @objc(addToProject:)
    @NSManaged public func addToToProject(_ values: Set<CDProject>)

    @objc(removeToProject:)
    @NSManaged public func removeFromToProject(_ values: Set<CDProject>)

}
