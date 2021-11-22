//
//  AppCoordinator.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isAuth = false
        
        if !isAuth {
            showRegistrationFlow()
        } else {
            showMainFlow()
        }
    }
    
    private func showRegistrationFlow() {
        
        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)
            
        childCoordinators.append(registrationCoordinator)
    
        registrationCoordinator.flowCompletionHandler = { [weak self] in
            self?.showMainFlow()
            // TODO: remove registrationCoordinator from childCoordinators
        }
        
        registrationCoordinator.start()
    }
    
    private func showMainFlow() {
        
        navigationController.setViewControllers([MainViewController()], animated: true)
    }
}
