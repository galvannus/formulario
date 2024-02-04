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
        if let email = emailTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextField.text,
           let phone = phoneTextField.text, let name = nameTextField.text {
            if !isEmailValid(email){
                openAlert(title: "Alert", message: "Correo Eléctronico invalido",
                          alertStyle: .alert,
                          actionTitles: ["Ok"],
                          actionStyles: [.default],actions: [
                            {_ in
                                print("okay clicked")
                            }
                          ])
            }else if !isPhoneValid(value: phone){
                openAlert(title: "Alert", message: "Número celular invalido",
                          alertStyle: .alert,
                          actionTitles: ["Ok"],
                          actionStyles: [.default],actions: [
                            {_ in
                                print("okay clicked")
                            }
                          ])
            }else{
                createItem(name: name, firstName: firstName, lastName: lastName, email: email, phone: phone)
            }
            
        } else{
            openAlert(title: "Alert", message: "Por favor llena los campos",
                      alertStyle: .alert,
                      actionTitles: ["Ok"],
                      actionStyles: [.default],actions: [
                        {_ in
                            print("okay clicked")
                        }
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
            print("submit")
        } catch {
            print(error)
        }
    }
}
