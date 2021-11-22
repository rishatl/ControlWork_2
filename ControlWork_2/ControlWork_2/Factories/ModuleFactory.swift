//
//  ModuleFactory.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import Foundation

//MARK: - Factory

class ModuleFactory {

    //MARK: - Public

    func createStartModule() -> StartViewController {
        StartViewController()
    }
    
    func createSignInModule() -> SignInViewController {
        SignInViewController()
    }
    
    func createSignUpLoginModule() -> SignUpLoginViewController {
        SignUpLoginViewController()
    }

    func createSignUpPasswordModule() -> SignUpPasswordViewController {
        SignUpPasswordViewController()
    }

}
