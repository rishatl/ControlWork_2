//
//  AppCoordinator.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

//MARK: - AppCoordinator

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    //MARK: - Private Properties
    
    private var childCoordinators: [Coordinator] = []

    private var userDefaults = UserDefaults.standard

    //MARK: - Initialize

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: - Public
    
    func start() {
        
        if !userDefaults.bool(forKey: "1") {
            showRegistrationFlow()
        } else {
            showActivityFlow()
        }

    }

    //MARK: - Private
    
    private func showRegistrationFlow() {
        
        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)
            
        childCoordinators.append(registrationCoordinator)
    
        registrationCoordinator.flowCompletionHandler = { [weak self] in
            self?.showActivityFlow()
            self?.userDefaults.set(true, forKey: "1")
        }
        
        registrationCoordinator.start()
    }
    
    private func showActivityFlow() {
        navigationController.setViewControllers([ActivityViewController()], animated: true)
    }
    
}
