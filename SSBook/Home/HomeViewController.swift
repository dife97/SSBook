//
//  HomeViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 15/10/22.
//

import UIKit
import Apollo

class HomeViewController: UIViewController {

    override func loadView() {
        
        view = HomeView()

        view.backgroundColor = UIColor(named: "mainBackground")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        
//        apolloClient.fetch(query: FavoriteBooksQuery()) { result in
//
//            guard let data = try? result.get().data else { return }
//
//            for item in data.favoriteBooks {
//
//                print("Book name = \(item.name) and Book Author = \(item.author.name). Is favorite? = \(item.isFavorite)")
//            }
//        }
//
//        apolloClient.fetch(query: FavoriteAuthorsQuery()) { result in
//
//            guard let data = try? result.get().data else { return }
//
//            for item in data.favoriteAuthors {
//
//                print("Author name = \(item.name) and Book count = \(item.booksCount)")
//            }
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
//    private func configureNavigationBar() {
//
//        let logoImageView = UIImageView(image: UIImage(named: "logo"))
//        logoImageView.frame = CGRect(x: 0, y: 0, width: 78, height: 44)
//        logoImageView.contentMode = .scaleAspectFit
//
//        let userPictureImageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
//        userPictureImageView.tintColor = UIColor(named: "mainGray")
//        userPictureImageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
//        userPictureImageView.contentMode = .scaleAspectFit
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userPictureImageView)
//    }
    
    private func configureTabBar() {
        
        tabBarItem = UITabBarItem(
            title: "Início",
            image: UIImage(named: "homeTabBarIcon"),
            tag: 0
        )
    }
}
