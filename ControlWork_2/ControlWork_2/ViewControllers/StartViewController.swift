//
//  EnterNameViewController.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

enum ButtonTapped {
    case signInButtonTapped
    case signUpButtonTapped
}

//MARK: - StartViewController

class StartViewController: UIViewController, FlowController {

    //MARK: - Public Properties
    
    var completionHandler: ((ButtonTapped?) -> ())?

    //MARK: - Private Properties
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(didSignInButton), for: .touchUpInside)
        
        return button
    }()

    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(didSignUpButton), for: .touchUpInside)

        return button
    }()

    //MARK: - Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Private
    
    private func setupUI() {

        title = "Register Page"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.frame.size = CGSize(width: 200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.center = view.center
        stackView.spacing = 40
        
        view.addSubview(stackView)
    }

    //MARK: - @objc Methods
    
    @objc
    private func didSignInButton() {
        completionHandler?(ButtonTapped.signInButtonTapped)
    }

    @objc
    private func didSignUpButton() {
        completionHandler?(ButtonTapped.signUpButtonTapped)
    }

}
