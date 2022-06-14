//
//  Passport+CoreDataProperties.swift
//  
//
//  Created by Aparna Tati on 15/06/22.
//
//

import Foundation
import CoreData


extension Passport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Passport> {
        return NSFetchRequest<Passport>(entityName: "Passport")
    }

    @NSManaged public var number: String?
    @NSManaged public var expiryDate: Date?
    @NSManaged public var ofUser: User?

}
