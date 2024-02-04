//
//  ViewController.swift
//  formulario
//
//  Created by Jorge Alejndro Marcial Galvan on 02/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var nameTextField: UITextField!
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var emailTextField: UITextField!
    var phoneTextField: UITextField!
    var submitButton: UIButton!
    var formRegisterStackView: UIStackView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Registrar Usuario"
        dismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpLayout()
    }
    
    // Configuración elementos UI
    private func setUpView() {
        nameTextField = UITextField()
        nameTextField.placeholder = "Nombre(s)"
        nameTextField.becomeFirstResponder()
        
        firstNameTextField = UITextField()
        firstNameTextField.placeholder = "Apellido Paterno"
        
        lastNameTextField = UITextField()
        lastNameTextField.placeholder = "Apellido Materno"
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Correo Eléctronico"
        emailTextField.keyboardType = .emailAddress
        
        phoneTextField = UITextField()
        phoneTextField.placeholder = "Número celular"
        phoneTextField.keyboardType = .numberPad

        submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Enviar", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.backgroundColor = .systemGreen
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        
        [nameTextField, firstNameTextField, lastNameTextField, emailTextField, phoneTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.autocorrectionType = .no
            $0.layer.borderWidth = 1.0
            $0.layer.cornerRadius = 10
            $0.layer.borderColor = UIColor.systemGray6.cgColor
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
            $0.leftViewMode = .always
        }
        
        formRegisterStackView = UIStackView(arrangedSubviews: [nameTextField, firstNameTextField, lastNameTextField, emailTextField, phoneTextField, submitButton])
        formRegisterStackView.translatesAutoresizingMaskIntoConstraints = false
        formRegisterStackView.axis = .vertical
        formRegisterStackView.distribution = .equalSpacing
        formRegisterStackView.spacing = 24
    }
    
    private func setUpLayout() {
        view.addSubview(formRegisterStackView)

        // Definir altura de los elementos
        [nameTextField, firstNameTextField, lastNameTextField, emailTextField, phoneTextField].forEach {
            // El elemento actual el heightAnchor = 50, se activa con isActive = true
            $0?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }

        // Activar constraints
        NSLayoutConstraint.activate([
            formRegisterStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            formRegisterStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            formRegisterStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}

