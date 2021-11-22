//
//  CoordinatorFactory.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import Foundation
import UIKit

class CoordinatorFactory {
    
    func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
        RegistrationCoordinator(navigationController: navigationController)
    }
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        AppCoordinator(navigationController: navigationController)
    }
}
