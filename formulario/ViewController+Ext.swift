//
//  ViewController+Ext.swift
//  formulario
//
//  Created by Jorge Alejndro Marcial Galvan on 03/02/24.
//

import UIKit

extension ViewController {
    // MARK: - Core Data

    func createItem(name: String, firstName: String, lastName: String, email: String, phone: String) {
        let newItem = User(context: context)
        newItem.name = name
        newItem.firstName = firstName
        newItem.lastName = lastName
        newItem.email = email
        newItem.phone = phone

        do {
            try context.save()
        } catch {
        }
    }
}
