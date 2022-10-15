//
//  HomeViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 15/10/22.
//

import UIKit
import Apollo

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        
        apolloClient.fetch(query: FavoriteBooksQuery()) { result in
            
            guard let data = try? result.get().data else { return }
            
            for item in data.favoriteBooks {
                
                print("Book id = \(item.id) and Book name = \(item.name) and Book Author = \(item.author.name)")
            }
        }
    }
}
