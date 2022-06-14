//
//  Notes+CoreDataProperties.swift
//  
//
//  Created by Aparna Tati on 14/06/22.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}
