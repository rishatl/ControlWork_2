//
//  Coordinator.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import Foundation
import UIKit

//MARK: - Completion

typealias CoordinatorHandler = () -> ()

//MARK: - Protocol Coordinator

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }
    
    func start()
}
