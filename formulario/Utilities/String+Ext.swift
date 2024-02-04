//
//  String+Ext.swift
//  formulario
//
//  Created by Jorge Alejndro Marcial Galvan on 04/02/24.
//

import Foundation

extension String {
    func trim() -> String {
        return trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
