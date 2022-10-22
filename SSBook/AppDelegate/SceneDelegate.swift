//
//  SceneDelegate.swift
//  SSBook
//
//  Created by Diego Ferreira on 15/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = createTabBarController()
        
        window?.makeKeyAndVisible()
    }
    
    private func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = UIColor(named: "mainPurple")
        tabBarController.tabBar.unselectedItemTintColor = UIColor(named: "mainGray")
        tabBarController.tabBar.isTranslucent = false
        
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: HomeViewController()),
            
            DummyViewController(title: "Adicionar",
                                tabBarItem: UITabBarItem(title: "Adicionar",
                                                         image: UIImage(named: "addTabBarIcon"),
                                                         tag: 1)),
            
            DummyViewController(title: "Buscar",
                                tabBarItem: UITabBarItem(title: "Buscar",
                                                         image: UIImage(named: "searchTabBarIcon"),
                                                         tag: 2)),
            
            DummyViewController(title: "Favoritos",
                                tabBarItem: UITabBarItem(title: "Favoritos",
                                                         image: UIImage(named: "heartTabBarIcon"),
                                                         tag: 3))
        ]
        
        return tabBarController
    }
}
