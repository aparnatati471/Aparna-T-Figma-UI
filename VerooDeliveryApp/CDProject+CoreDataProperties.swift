//
//  CDProject+CoreDataProperties.swift
//  
//
//  Created by Aparna Tati on 21/06/22.
//
//

import Foundation
import CoreData


extension CDProject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDProject> {
        return NSFetchRequest<CDProject>(entityName: "CDProject")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var toEmployee: CDEmployee?

}
