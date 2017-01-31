//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Julie Berry on 1/30/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task");
    }

    @NSManaged public var important: Bool
    @NSManaged public var name: String?

}
