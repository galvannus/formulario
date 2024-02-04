//
//  UIAlertController+Ext.swift
//  formulario
//
//  Created by Jorge Alejndro Marcial Galvan on 03/02/24.
//

import UIKit

extension UIViewController {
    // Global Alert
    // Define Your number of buttons, styles and completion
    public func openAlert(title: String,
                          message: String,
                          alertStyle: UIAlertController.Style,
                          actionTitles: [String],
                          actionStyles: [UIAlertAction.Style],
                          actions: [(UIAlertAction) -> Void]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for (index, indexTitle) in actionTitles.enumerated() {
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }
}
