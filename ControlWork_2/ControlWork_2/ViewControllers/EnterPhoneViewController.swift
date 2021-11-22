//
//  EnterPhoneViewController.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

class EnterPhoneViewController: UIViewController, FlowController {
  
    var completionHandler: ((String?) -> ())?
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter phone"
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
        
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    private func addSubviews() {
        
        title = "EnterPhone"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [textField, nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc
    private func didPressNextButton() {
        
        completionHandler?(textField.text)
        
//        let userData = UserData(phoneNumber: textField.text, password: nil, name: nil, birthday: nil)
//
//        let conformPhoneViewController = ConformPhoneViewController()
//
//        conformPhoneViewController.setup(userData: userData)
//        navigationController?.pushViewController(conformPhoneViewController, animated: true)
    }
}
