//
//  RegistrationCoordinator.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

class RegistrationCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private let moduleFactory = ModuleFactory()
    private var userData = UserData(login: nil, password: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showStartModule()
    }

    private func showStartModule() {

        let controller = moduleFactory.createStartModule()

        controller.completionHandler = { [weak self] value in
            guard let value = value else { return }
            switch value {
            case .signInButtonTapped:
                self?.showSignInModule()
            case .signUpButtonTapped:
                self?.showSignUpLoginModule()
            }
        }

        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showSignInModule() {
        
        let controller = moduleFactory.createSignInModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.login = value[0]
            self?.userData.password = value[1]
            self?.flowCompletionHandler?()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showSignUpLoginModule() {
        
        let controller = moduleFactory.createSignUpLoginModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.login = value
            self?.showSignUpPasswordModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showSignUpPasswordModule() {
        
        let controller = moduleFactory.createSignUpPasswordModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.password = value
            self?.flowCompletionHandler?()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
}
