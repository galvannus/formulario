//
//  ViewController+Ext.swift
//  formulario
//
//  Created by Jorge Alejndro Marcial Galvan on 03/02/24.
//

import UIKit

extension ViewController {
    // MARK: - Functions

    @objc func submitForm() {
        if let email = emailTextField.text?.trim(), let firstName = firstNameTextField.text?.trim(), let lastName = lastNameTextField.text?.trim(),
           let phone = phoneTextField.text?.trim(), let name = nameTextField.text?.trim(), !firstName.isEmpty, !name.isEmpty, !lastName.isEmpty {
            if !isEmailValid(email) {
                openAlert(title: "Alert", message: "Correo Eléctronico invalido",
                          alertStyle: .alert,
                          actionTitles: ["Ok"],
                          actionStyles: [.default], actions: [
                              { _ in
                                  //
                              },
                          ])
            } else if !isPhoneValid(value: phone) {
                openAlert(title: "Alert", message: "Número celular invalido",
                          alertStyle: .alert,
                          actionTitles: ["Ok"],
                          actionStyles: [.default], actions: [
                              { _ in
                                  //
                              },
                          ])
            } else {
                createItem(name: name, firstName: firstName, lastName: lastName, email: email, phone: phone)
            }

        } else {
            openAlert(title: "Alert", message: "Los campos deben estar llenos",
                      alertStyle: .alert,
                      actionTitles: ["Ok"],
                      actionStyles: [.default], actions: [
                          { _ in
                              //
                          },
                      ])
        }
    }

    func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        return result
    }

    func isPhoneValid(value: String) -> Bool {
        let PHONE_REGEX = "[+]*[(]?[0-9]{1,3}[)]?[0-9-\\s\\.]+"

        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }

    func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

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
            openAlert(title: "Registro Completo", message: "Se registró correctamente la información del usuario.",
                      alertStyle: .alert,
                      actionTitles: ["Ok"],
                      actionStyles: [.default], actions: [
                          { [weak self] _ in
                              self?.emailTextField.text = ""
                              self?.nameTextField.text = ""
                              self?.firstNameTextField.text = ""
                              self?.lastNameTextField.text = ""
                              self?.phoneTextField.text = ""
                              
                              self?.nameTextField.becomeFirstResponder()
                          },
                      ])
        } catch {
            print(error)
        }
    }
}
