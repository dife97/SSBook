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
        
        configureCollectionViews()
        
        
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
        
        configureScrollViewContentSize()
    }
    
    private func configureScrollViewContentSize() {
        
        let favoriteBooksViewHeight = homeView.myBooksView.favoriteBooksView.frame.size.height
        let favoriteAuthorsViewHeight = homeView.myBooksView.favoriteAuthorsView.frame.size.height
        let libraryViewHeight = homeView.myBooksView.libraryView.frame.size.height
        
        let height: CGFloat = favoriteBooksViewHeight + favoriteAuthorsViewHeight + libraryViewHeight
        
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
    
    private func configureCollectionViews() {
        
        homeView.myBooksView.configureMyBooksCollectionViews(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
              
//        if collectionView == homeView.myBooksView.favoriteBooksCollectionView {
//            return
//        }
//
//        if collectionView == homeView.myBooksView.favoriteAuthorsCollectionView {
//            return
//        }
        
        
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == homeView.myBooksView.favoriteBooksCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteBookCollectionViewCell.identifier,
                                                          for: indexPath) as? FavoriteBookCollectionViewCell
            
            
            return cell ?? UICollectionViewCell()
        }
        
        if collectionView == homeView.myBooksView.favoriteAuthorsCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteAuthorsCollectionViewCell.identifier,
                                                          for: indexPath) as? FavoriteAuthorsCollectionViewCell
            
            
            return cell ?? UICollectionViewCell()
        }
        
        if collectionView == homeView.myBooksView.categoryMenuCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier,
                                                          for: indexPath) as? CategoryCollectionViewCell
            
            
            return cell ?? UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == homeView.myBooksView.favoriteBooksCollectionView {
            return CGSize(width: 136, height: 262)
        }
        
        if collectionView == homeView.myBooksView.favoriteAuthorsCollectionView {
            return CGSize(width: 248, height: 69)
        }
        
        if collectionView == homeView.myBooksView.categoryMenuCollectionView {
            return CGSize(width: 92, height: 32)
        }
        
        return CGSize()
    }
}
