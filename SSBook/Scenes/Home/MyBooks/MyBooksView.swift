//
//  MyBooksView.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class MyBooksView: UIView {
        
    let scrollView = SSScrollView(backgroundColorName: "mainBackground")
    
    let containerView = SSView(backgroundColorName: "mainBackground")
    
    lazy var favoriteBooksView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "mainBackground")
        
        return view
    }()
    
    let favoriteBooksLabel = SSLabel(text: "Livros favoritos")
    
    lazy var seeAllFavoriteBooksButton: SSButton = {
        let button = SSButton(title: "ver todos", titleColorName: "mainPurple")

        button.buttonAction = { self.didTapSeeAllFavoriteBooksButton() }

        return button
    }()

    lazy var favoriteBooksCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.backgroundColor = UIColor(named: "mainBackground")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.register(FavoriteBookCollectionViewCell.self,
                                forCellWithReuseIdentifier: FavoriteBookCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    lazy var favoriteAuthorsView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 175))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.roundCornerView(corners: .topLeft, radius: 32)
        
        return view
    }()
    
    let favoriteAuthorsLabel = SSLabel(text: "Autores favoritos")
    
    lazy var seeAllFavoriteAuthorsButton: SSButton = {
        let button = SSButton(title: "ver todos", titleColorName: "mainPurple")

        button.buttonAction = { self.didTapSeeAllFavoriteAuthorsButton() }

        return button
    }()
    
    lazy var favoriteAuthorsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.register(FavoriteAuthorsCollectionViewCell.self,
                                forCellWithReuseIdentifier: FavoriteAuthorsCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    lazy var libraryView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let librayTitleLabel = SSLabel(text: "Biblioteca")
    
    lazy var categoryMenuCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.backgroundColor = .white
        
        layout.scrollDirection = .horizontal
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    lazy var libraryBooksTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 90
        tableView.showsVerticalScrollIndicator = false
        tableView.register(LibraryBooksTableViewCell.self,
                           forCellReuseIdentifier: LibraryBooksTableViewCell.identifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureScrollView()
        
        configureFavoriteBooksView()
        
        configureFavoriteAuthorsView()
        
        configureLibraryView()
        
        additionalConfiguration()
    }
    
    private func configureScrollView() {
        
        addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func configureFavoriteBooksView() {
        
        favoriteBooksView.addSubview(favoriteBooksLabel)
        favoriteBooksView.addSubview(seeAllFavoriteBooksButton)
        favoriteBooksView.addSubview(favoriteBooksCollectionView)
        
        scrollView.addSubview(favoriteBooksView)
        
        NSLayoutConstraint.activate([
            favoriteBooksView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            favoriteBooksView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            favoriteBooksView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            favoriteBooksView.heightAnchor.constraint(equalToConstant: 370),
            
            favoriteBooksLabel.topAnchor.constraint(equalTo: favoriteBooksView.topAnchor, constant: 32),
            favoriteBooksLabel.leadingAnchor.constraint(equalTo: favoriteBooksView.leadingAnchor, constant: 20),
            
            seeAllFavoriteBooksButton.centerYAnchor.constraint(equalTo: favoriteBooksLabel.centerYAnchor),
            seeAllFavoriteBooksButton.trailingAnchor.constraint(equalTo: favoriteBooksView.trailingAnchor, constant: -20),
            
            favoriteBooksCollectionView.topAnchor.constraint(equalTo: favoriteBooksLabel.bottomAnchor, constant: 21),
            favoriteBooksCollectionView.leadingAnchor.constraint(equalTo: favoriteBooksView.leadingAnchor, constant: 20),
            favoriteBooksCollectionView.trailingAnchor.constraint(equalTo: favoriteBooksView.trailingAnchor),
            favoriteBooksCollectionView.heightAnchor.constraint(equalToConstant: 262)
        ])
    }
    
    private func configureFavoriteAuthorsView() {
        
        favoriteAuthorsView.addSubview(favoriteAuthorsLabel)
        favoriteAuthorsView.addSubview(seeAllFavoriteAuthorsButton)
        favoriteAuthorsView.addSubview(favoriteAuthorsCollectionView)
        
        scrollView.addSubview(favoriteAuthorsView)

        NSLayoutConstraint.activate([
            favoriteAuthorsView.topAnchor.constraint(equalTo: favoriteBooksView.bottomAnchor),
            favoriteAuthorsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            favoriteAuthorsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            favoriteAuthorsView.heightAnchor.constraint(equalToConstant: 175),

            favoriteAuthorsLabel.topAnchor.constraint(equalTo: favoriteAuthorsView.topAnchor, constant: 32),
            favoriteAuthorsLabel.leadingAnchor.constraint(equalTo: favoriteAuthorsView.leadingAnchor, constant: 20),

            seeAllFavoriteAuthorsButton.centerYAnchor.constraint(equalTo: favoriteAuthorsLabel.centerYAnchor),
            seeAllFavoriteAuthorsButton.trailingAnchor.constraint(equalTo: favoriteAuthorsView.trailingAnchor, constant: -20),

            favoriteAuthorsCollectionView.topAnchor.constraint(equalTo: favoriteAuthorsLabel.bottomAnchor, constant: 21),
            favoriteAuthorsCollectionView.leadingAnchor.constraint(equalTo: favoriteAuthorsView.leadingAnchor, constant: 20),
            favoriteAuthorsCollectionView.trailingAnchor.constraint(equalTo: favoriteAuthorsView.trailingAnchor),
            favoriteAuthorsCollectionView.heightAnchor.constraint(equalToConstant: 69),
        ])
    }
    
    func configureLibraryView() {
        
        libraryView.addSubview(librayTitleLabel)
        libraryView.addSubview(categoryMenuCollectionView)
        libraryView.addSubview(libraryBooksTableView)
        
        scrollView.addSubview(libraryView)
        
        NSLayoutConstraint.activate([
            libraryView.topAnchor.constraint(equalTo: favoriteAuthorsView.bottomAnchor),
            libraryView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            libraryView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            librayTitleLabel.topAnchor.constraint(equalTo: libraryView.topAnchor),
            librayTitleLabel.leadingAnchor.constraint(equalTo: libraryView.leadingAnchor, constant: 20),

            categoryMenuCollectionView.topAnchor.constraint(equalTo: librayTitleLabel.bottomAnchor, constant: 21),
            categoryMenuCollectionView.leadingAnchor.constraint(equalTo: libraryView.leadingAnchor, constant: 20),
            categoryMenuCollectionView.trailingAnchor.constraint(equalTo: libraryView.trailingAnchor),
            categoryMenuCollectionView.heightAnchor.constraint(equalToConstant: 32),
            
            libraryBooksTableView.topAnchor.constraint(equalTo: categoryMenuCollectionView.bottomAnchor, constant: 20),
            libraryBooksTableView.leadingAnchor.constraint(equalTo: libraryView.leadingAnchor),
            libraryBooksTableView.trailingAnchor.constraint(equalTo: libraryView.trailingAnchor),
        ])
    }
    
    func configureMyBooksCollectionViews(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        favoriteBooksCollectionView.delegate = delegate
        favoriteBooksCollectionView.dataSource = dataSource
        
        favoriteAuthorsCollectionView.delegate = delegate
        favoriteAuthorsCollectionView.dataSource = dataSource
        
        categoryMenuCollectionView.delegate = delegate
        categoryMenuCollectionView.dataSource = dataSource
    }
    
    func configureLibraryBooksTableView(delegate: UITableViewDelegate,
                                        dataSource: UITableViewDataSource) {
        
        libraryBooksTableView.delegate = delegate
        libraryBooksTableView.dataSource = dataSource
    }
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemGreen
    }
    
    private func didTapSeeAllFavoriteBooksButton() {
        
        print("SEE ALL BOOKS")
    }
    
    private func didTapSeeAllFavoriteAuthorsButton() {
        
        print("SEE ALL AUTHORS")
    }
}
