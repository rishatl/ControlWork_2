//
//  SignUpLoginViewController.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

//MARK: - SignUpLoginViewController

class SignUpLoginViewController: UIViewController, FlowController {

    //MARK: - Public Properties
    
    var completionHandler: ((String?) -> ())?

    //MARK: - Private Properties
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter login"
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)

        return button
    }()

    //MARK: - Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    //MARK: - Private
    
    private func addSubviews() {
        
        title = "Register Login Page"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [loginTextField, nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.center = view.center
        stackView.spacing = 40
        
        view.addSubview(stackView)
    }

    //MARK: - @objc Methods
    
    @objc
    private func didPressNextButton() {

        if loginTextField.text != "" {
            completionHandler?(loginTextField.text)
        } else { return }
    }
}
