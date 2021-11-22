//
//  SceneDelegate.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator = CoordinatorFactory().createAppCoordinator(navigationController: UINavigationController())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = appCoordinator.navigationController

        appCoordinator.start()

        window?.makeKeyAndVisible()

        guard let _ = (scene as? UIWindowScene) else { return }
    }

}

