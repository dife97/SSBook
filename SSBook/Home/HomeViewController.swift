//
//  HomeViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 15/10/22.
//

import UIKit
import Apollo

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    override func loadView() {
        
        view = homeView

        view.backgroundColor = UIColor(named: "mainBackground")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        
        configureFavoriteBooksCollectionView()
        
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setScrollViewContentSize()
    }
    
    private func setScrollViewContentSize() {
        
        let height: CGFloat = homeView.myBooksView.favoriteBooksView.frame.size.height + 100
        
        homeView.myBooksView.scrollView.contentSize = CGSize(width: homeView.myBooksView.frame.size.width, height: height)
        homeView.myBooksView.containerView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func configureTabBar() {
        
        tabBarItem = UITabBarItem(
            title: "Início",
            image: UIImage(named: "homeTabBarIcon"),
            tag: 0
        )
    }
    
    private func configureFavoriteBooksCollectionView() {
        
        homeView.myBooksView.configureFavoriteBooksCollectionView(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteBookCollectionViewCell.identifier, for: indexPath) as? FavoriteBookCollectionViewCell
        
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 136, height: 262)
    }
}
