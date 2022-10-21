//
//  HomeService.swift
//  SSBook
//
//  Created by Diego Ferreira on 20/10/22.
//

import Foundation

struct HomeService {
    
    func fetchFavoriteBooks(onComplete: @escaping (Result<[BookModel]?, NSError>) -> Void) {
        
        apolloClient.fetch(query: FavoriteBooksQuery()) { result in
            
            var favoriteBooks = [BookModel]()
            
            switch result {
                
            case .success(_):
                
                guard let data = try? result.get().data else {
                    print("[HomeService] Did fail to retrieve data. Will return from getFavoriteBooks()")
                    
                    return
                }
                
                for book in  data.favoriteBooks {
                    
                    if book.isFavorite {
                        favoriteBooks.append(BookModel(
                            coverImage: book.cover,
                            name: book.name,
                            author: book.author.name,
                            description: book.description,
                            isFavorite: book.isFavorite
                        ))
                    }
                }
                
                DispatchQueue.main.async {
                    
                    onComplete(.success(favoriteBooks))
                }
                
            case .failure(let error as NSError):
                
                print("[HomeService] Failed to fetch favorite books with error: \(error.code) - \(error.localizedDescription).")
                
                DispatchQueue.main.async {
                    
                    onComplete(.failure(error))
                }
            }
        }
    }
    
    func fetchFavoriteAuthors(onComplete: @escaping (Result<[AuthorModel]?, NSError>) -> Void) {
        
        apolloClient.fetch(query: FavoriteAuthorsQuery()) { result in

            var favoriteAuthors = [AuthorModel]()
            
            switch result {
                
            case .success(_):
                
                guard let data = try? result.get().data else {
                    print("[HomeService] Did fail to retrieve data. Will return from getFavoriteAuthors()")
                    
                    return
                }

                for author in data.favoriteAuthors {

                    if author.isFavorite {
                        favoriteAuthors.append(AuthorModel(
                            image: author.picture,
                            name: author.name,
                            booksCount: author.booksCount)
                        )
                    }
                }
                
                DispatchQueue.main.async {
                    
                    onComplete(.success(favoriteAuthors))
                }
                
            case .failure(let error as NSError):
                
                print("[HomeService] Failed to fetch favorite authors with error: \(error.code) - \(error.localizedDescription).")
                
                DispatchQueue.main.async {
                    
                    onComplete(.failure(error))
                }
            }
        }
    }
}
