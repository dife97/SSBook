//
//  MyBooksView.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class MyBooksView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGreen

        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "mainBackground")
        
        return view
    }()
    
    lazy var favoriteBooksView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let favoriteBooksLabel = SSLabel(text: "Livros favoritos")
    
    lazy var seeAllFavoriteBooksButton: SSButton = {
        let button = SSButton(title: "ver todos", titleColorName: "mainPurple")

        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonAction = { self.didTapSeeAllFavoriteBooksButton() }

        return button
    }()

    
    /*
     favoriteBooksView
        - favoriteBooksLabel
        - seeAllFavoriteBooksButton
        - favoriteBooksCollectionView
                - favoriteBookCollectionViewCell
                        - bookCoverImageView
                        - bookTitleLabel
                        - authorLabel
     
     */
    
    /*
     favoriteAuthorsView
         - favoriteAuthorsLabel
         - seeAllFavoriteAuthorsButton
         - favoriteAuthorsCollectionView
                 - favoriteAurthorCollectionViewCell
                         - authorImageView
                         - authorNameLabel
                         - booksCountLabel
     
     */
    
    /*
     libraryView
        - categoryMenuCollectionView
                - categoryCollectionViewCell
        - libraryBooksTableView
                - libraryBooksTableViewCell
                         - bookCoverImageView
                         - bookTitleLabel
                         - authorLabel
     
     */
    
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
        
        scrollView.addSubview(favoriteBooksView)
        
        NSLayoutConstraint.activate([
            favoriteBooksView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            favoriteBooksView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            favoriteBooksView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            favoriteBooksView.heightAnchor.constraint(equalToConstant: 300),
            
            favoriteBooksLabel.topAnchor.constraint(equalTo: favoriteBooksView.topAnchor, constant: 32),
            favoriteBooksLabel.leadingAnchor.constraint(equalTo: favoriteBooksView.leadingAnchor, constant: 20),
            
            seeAllFavoriteBooksButton.centerYAnchor.constraint(equalTo: favoriteBooksLabel.centerYAnchor),
            seeAllFavoriteBooksButton.trailingAnchor.constraint(equalTo: favoriteBooksView.trailingAnchor, constant: -20)
        ])
    }
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemGreen
    }
    
    @objc func didTapSeeAllFavoriteBooksButton() {
        
        print("SEE ALL")
    }
}
