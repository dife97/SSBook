//
//  BookModel.swift
//  SSBook
//
//  Created by Diego Ferreira on 20/10/22.
//

import UIKit

struct BookModel {
    
    let coverImage: String
    let name: String
    let author: String
    let description: String
    let isFavorite: Bool
}

struct FavoriteBookModel {
    
    let coverImage: UIImage?
    let name: String
    let author: String
    let description: String
    let isFavorite: Bool
}
