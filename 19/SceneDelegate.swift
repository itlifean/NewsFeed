//
//  SceneDelegate.swift
//  NewsFeed
//
//  Created by Ana Oganesiani on 30.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: NewsViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
