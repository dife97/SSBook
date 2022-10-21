//
//  AuthorModel.swift
//  SSBook
//
//  Created by Diego Ferreira on 20/10/22.
//

import UIKit

struct AuthorModel {
    
    let image: String
    let name: String
    let booksCount: Int
}

struct FavoriteAuthorModel {
    
    let image: UIImage?
    let name: String
    let booksCount: Int
}
