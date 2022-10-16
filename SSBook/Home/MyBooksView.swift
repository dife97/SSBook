//
//  MyBooksView.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class MyBooksView: UIView {
    
    /*
     homeScrollView
     
     */
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
