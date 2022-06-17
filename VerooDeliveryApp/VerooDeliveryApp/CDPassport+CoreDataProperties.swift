//
//  CDPassport+CoreDataProperties.swift
//  
//
//  Created by Aparna Tati on 17/06/22.
//
//

import Foundation
import CoreData


extension CDPassport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPassport> {
        return NSFetchRequest<CDPassport>(entityName: "CDPassport")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var passportID: String?
    @NSManaged public var placeofIssue: String?
    @NSManaged public var toEmployee: CDEmployee?

}
