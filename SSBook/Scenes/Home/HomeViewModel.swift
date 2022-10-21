//
//  HomeViewModel.swift
//  SSBook
//
//  Created by Diego Ferreira on 20/10/22.
//

import UIKit
import Apollo

protocol HomeViewModelDelegate: AnyObject {
    
    func didGetFavoriteBooks()
    func didFailToGetFavoriteBooks()
    
    func didGetFavoriteAuthors()
    func didFailToGetFavoriteAuthors()
}

class HomeViewModel {
    
    var favoriteBooks: [FavoriteBookModel] = []
    var favoriteAuthors: [FavoriteAuthorModel] = []
    
    weak var delegate: HomeViewModelDelegate?
    
    private let service = HomeService()
    
    func getFavoriteBooks() {
        
        service.fetchFavoriteBooks { [weak self] response in
            
            guard let self = self else {
                print("[HomeViewMode] There was no reference to self. Will return from getFavoriteBooks")
                
                return
            }
            
            switch response {
                
            case .success(let books):
                
                if let books = books {
                    self.downloadBookImages(of: books)
                }
                
            case .failure(_):
                
                self.delegate?.didFailToGetFavoriteBooks()
            }
        }
    }
    
    func getFavoriteAuthors() {
        
        service.fetchFavoriteAuthors { [weak self] response in
            
            guard let self = self else {
                print("[HomeViewMode] There was no reference to self. Will return from getFavoriteBooks")
                
                return
            }
            
            switch response {

            case .success(let favoriteAuthors):

                if let favoriteAuthors = favoriteAuthors {
                    self.downloadAuthorImages(of: favoriteAuthors)
                }

            case .failure(_):

                self.delegate?.didFailToGetFavoriteAuthors()
            }
        }
    }
    
    private func downloadBookImages(of books: [BookModel]) {
        
        for book in books {
            
            guard let url = URL(string: book.coverImage) else { return }
            
            do {
                let imageData = try Data(contentsOf: url)

                let downloadedImage = UIImage(data: imageData)
                
                favoriteBooks.append(FavoriteBookModel(
                    coverImage: downloadedImage,
                    name: book.name,
                    author: book.author,
                    description: book.description,
                    isFavorite: book.isFavorite)
                )
            } catch {
                print("[HomeViewModel] Failed to download image with error: \(error.localizedDescription)")
                
                DispatchQueue.main.async { [weak self] in
                        
                    self?.delegate?.didFailToGetFavoriteBooks()
                }
            }
        }
        
        DispatchQueue.main.async {
            
            self.delegate?.didGetFavoriteBooks()
        }
    }
    
    private func downloadAuthorImages(of authors: [AuthorModel]) {
        
        for author in authors {
            
            guard let url = URL(string: author.image) else { return }
            
            do {
                let imageData = try Data(contentsOf: url)

                let downloadedImage = UIImage(data: imageData)
                
                favoriteAuthors.append(FavoriteAuthorModel(
                    image: downloadedImage,
                    name: author.name,
                    booksCount: author.booksCount
                ))
            } catch {
                print("[HomeViewModel] Failed to download image with error: \(error.localizedDescription)")
                
                DispatchQueue.main.async {
                        
                    self.delegate?.didFailToGetFavoriteBooks()
                }
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            
            self?.delegate?.didGetFavoriteAuthors()
        }
    }
}
