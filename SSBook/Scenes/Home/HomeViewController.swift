//
//  HomeViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 15/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    let homeViewModel = HomeViewModel()
    
    var customViewHeight: CGFloat {
        6 * 80 + 32
    }
    
    override func loadView() {
        
        view = homeView
        view.backgroundColor = UIColor(named: "mainBackground")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        
        configureDelegates()
        
        homeViewModel.getUserPicture()
        
        navigationController?.setStatusBar(backgroundColor: .white)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        configureScrollViewContentSize()
    }
    
    private func configureScrollViewContentSize() {
        
        let favoriteBooksViewHeight = homeView.myBooksView.favoriteBooksView.frame.size.height
        
        let favoriteAuthorsViewHeight = homeView.myBooksView.favoriteAuthorsView.frame.size.height
        
        let libraryTableViewHeight: CGFloat = CGFloat(homeViewModel.favoriteBooks.count) * 90

        let height: CGFloat = favoriteBooksViewHeight + favoriteAuthorsViewHeight + libraryTableViewHeight + 100
        
        homeView.myBooksView.libraryView.heightAnchor.constraint(equalToConstant: libraryTableViewHeight).isActive = true
        homeView.myBooksView.libraryBooksTableView.heightAnchor.constraint(equalToConstant: libraryTableViewHeight).isActive = true
        homeView.myBooksView.containerView.heightAnchor.constraint(equalToConstant: height).isActive = true
        homeView.myBooksView.scrollView.contentSize = CGSize(width: homeView.myBooksView.frame.size.width, height: height)
    }
    
    private func configureTabBar() {
        
        tabBarItem = UITabBarItem(
            title: "Início",
            image: UIImage(named: "homeTabBarIcon"),
            tag: 0
        )
    }
    
    private func configureDelegates() {
        
        homeViewModel.delegate = self
        
        homeView.myBooksView.configureMyBooksCollectionViews(delegate: self, dataSource: self)
        homeView.myBooksView.configureLibraryBooksTableView(delegate: self, dataSource: self)
    }
    
    private func navigateToBookInfo(with book: FavoriteBookModel) {
            
        let bookData = BookData(
            bookCoverImageName: book.coverImage,
            bookTitleText: book.name,
            authorNameText: book.author,
            bookDescriptionText: book.description,
            isFavorite: book.isFavorite
        )
        
        let bookInfoViewController = BookInfoViewController(bookData: bookData)
        
        navigationController?.pushViewController(bookInfoViewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
              
        if collectionView == homeView.myBooksView.favoriteBooksCollectionView {
            return homeViewModel.favoriteBooks.count
        }

        if collectionView == homeView.myBooksView.favoriteAuthorsCollectionView {
            
            return homeViewModel.favoriteAuthors.count
        }
        
        if collectionView == homeView.myBooksView.categoryMenuCollectionView {
            
            return homeViewModel.booksCategory.count
        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == homeView.myBooksView.favoriteBooksCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteBookCollectionViewCell.identifier,
                                                          for: indexPath) as? FavoriteBookCollectionViewCell
            
            cell?.configure(with: homeViewModel.favoriteBooks[indexPath.row])
            
            return cell ?? UICollectionViewCell()
        }
        
        if collectionView == homeView.myBooksView.favoriteAuthorsCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteAuthorsCollectionViewCell.identifier,
                                                          for: indexPath) as? FavoriteAuthorsCollectionViewCell
            
            cell?.configure(with: homeViewModel.favoriteAuthors[indexPath.row])
            
            return cell ?? UICollectionViewCell()
        }
        
        if collectionView == homeView.myBooksView.categoryMenuCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier,
                                                          for: indexPath) as? CategoryCollectionViewCell
            
            if indexPath.row == 0 {
                cell?.configure(with: homeViewModel.booksCategory[indexPath.row])
                
                cell?.contentView.backgroundColor = UIColor(named: "mainPurple")
                cell?.categoryLabel.textColor = .white
            } else {
                cell?.configure(with: homeViewModel.booksCategory[indexPath.row])
            }
            
            return cell ?? UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
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
            
            let cell: CategoryCollectionViewCell = CategoryCollectionViewCell()
                    
            let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            return CGSize(width: size.width, height: 32)
        }
        
        return CGSize()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == homeView.myBooksView.favoriteBooksCollectionView {
            
            let book = homeViewModel.favoriteBooks[indexPath.row]
            
            navigateToBookInfo(with: book)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return homeViewModel.favoriteBooks.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryBooksTableViewCell",
                                                 for: indexPath) as? LibraryBooksTableViewCell
        
        cell?.configure(with: homeViewModel.favoriteBooks[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let book = homeViewModel.favoriteBooks[indexPath.row]
        
        navigateToBookInfo(with: book)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func didGetUserPicture() {
        
        homeViewModel.getFavoriteBooks()
    }
    
    func didFailToGetUserPicture() {
        
        //TODO: implement error logic
    }
        
    func didGetFavoriteBooks() {

        homeViewModel.getFavoriteAuthors()
    }
    
    func didFailToGetFavoriteBooks() {
        
        //TODO: implement error logic
    }
    
    func didGetFavoriteAuthors() {
        
        homeView.userPictureImageView.image = homeViewModel.userPicture
        homeView.myBooksView.favoriteBooksCollectionView.reloadData()
        homeView.myBooksView.favoriteAuthorsCollectionView.reloadData()
        homeView.myBooksView.libraryBooksTableView.reloadData()
        
        configureScrollViewContentSize()
        
        homeView.loadingActivityIndicatorView.stopAnimating()
        
        homeView.myBooksView.isHidden = false
    }
    
    func didFailToGetFavoriteAuthors() {
        
        //TODO: implement error logic
    }
}
