//
//  SignInViewController.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

//MARK: - SignInViewController

class SignInViewController: UIViewController, FlowController {

    //MARK: - Public Properties

    var completionHandler: (([String?]) -> ())?

    //MARK: - Private Properties
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter login"
        
        return textField
    }()

    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"

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
        setupUI()
    }

    //MARK: - Private
    
    private func setupUI() {
        
        title = "Sign In Page"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, nextButton])
        stackView.frame.size = CGSize(width: 200, height: 160)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.center = view.center
        stackView.spacing = 20
        
        view.addSubview(stackView)

    }

    //MARK: - @objc Methods
    
    @objc
    private func didPressNextButton() {

        if loginTextField.text != "" || passwordTextField.text != "" {
            completionHandler?([loginTextField.text, passwordTextField.text])
        } else { return }

    }
    
}
