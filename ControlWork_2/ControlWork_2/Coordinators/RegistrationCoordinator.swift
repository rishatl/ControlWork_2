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
    private var userData = UserData(phoneNumber: nil, password: nil, name: nil, birthday: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showEnterNameModule()
    }
    
    private func showEnterPhoneModule() {
        
        let controller = moduleFactory.createEnterPhoneModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.phoneNumber = value
            self?.showConformPhoneModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showConformPhoneModule() {
        
        let controller = moduleFactory.createConformPhoneModule()
        
        controller.completionHandler = { [weak self] value in
            if value {
                self?.showEnterPasswordModule()
            } else {
                // show error
            }
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterPasswordModule() {
        
        let controller = moduleFactory.createEnterPasswordModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.password = value
            self?.flowCompletionHandler?()
//            self?.showEnterBirthdayModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterNameModule() {
        
        let controller = moduleFactory.createEnterNameModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.name = value
            self?.showEnterPhoneModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterBirthdayModule() {
        
        let controller = moduleFactory.createEnterBirthdayModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.birthday = value
            self?.flowCompletionHandler?()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
