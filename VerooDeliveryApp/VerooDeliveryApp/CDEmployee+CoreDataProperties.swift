//
//  CDEmployee+CoreDataProperties.swift
//  
//
//  Created by Aparna Tati on 16/06/22.
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
    
    public func convertToEmployee() -> Employee {
        return Employee(name: self.name, email: self.email, id: self.id ?? UUID())
    }

}
