//
//  User+CoreDataProperties.swift
//  formulario
//
//  Created by Jorge Alejndro Marcial Galvan on 02/02/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?

}

extension User : Identifiable {

}
