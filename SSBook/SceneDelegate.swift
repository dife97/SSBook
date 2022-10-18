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
        
        let text = """
        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
        """
        
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = UIColor(named: "mainPurple")
        tabBarController.tabBar.unselectedItemTintColor = UIColor(named: "mainGray")
        tabBarController.tabBar.isTranslucent = false
        
        tabBarController.viewControllers = [
//            UINavigationController(rootViewController: HomeViewController()),
            UINavigationController(rootViewController: BookInfoViewController(bookCoverImageName: "dummyBookCover",
                                                                              bookTitleText: "Livro legal",
                                                                              authorNameText: "Diego Lindo",
                                                                              bookDescriptionText: text,
                                                                              isFavorite: true)),
            
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
