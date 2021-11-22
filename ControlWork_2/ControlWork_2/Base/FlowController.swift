//
//  FlowController.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import Foundation

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
