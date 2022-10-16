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
        
        view.backgroundColor = .systemMint
        
        return view
    }()
    
    lazy var topButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        
        return button
    }()
    
    lazy var bottomButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        
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
        
        containerView.addSubview(topButton)
        containerView.addSubview(bottomButton)
        
        NSLayoutConstraint.activate([
            topButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            topButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            topButton.heightAnchor.constraint(equalToConstant: 1000),
            topButton.widthAnchor.constraint(equalToConstant: 100),
            
            bottomButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 60),
            bottomButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            bottomButton.heightAnchor.constraint(equalToConstant: 100),
            bottomButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemGreen
    }
}
