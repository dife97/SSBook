//
//  BookInfoViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

public struct BookData {
    
    let bookCoverImageName: UIImage?
    let bookTitleText: String
    let authorNameText: String
    let bookDescriptionText: String
    var isFavorite: Bool
}

class BookInfoViewController: UIViewController {
    
    var bookData: BookData
    
    private lazy var bookInfoView: BookInfoView = {
        let view = BookInfoView(bookData: bookData)
        
        view.didTapBackButton = { self.didTapBackButton() }
        view.didTapIsFavoriteButton = { self.toggleFavoriteButton() }
        
        return view
    }()
    
    init(bookData: BookData) {
        self.bookData = bookData
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = bookInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleFavoriteButton()
    }
    
    private func didTapBackButton() {
        
        navigationController?.popViewController(animated: true)
    }
    
    private func toggleFavoriteButton() {
        
        if bookInfoView.bookData.isFavorite {
            bookInfoView.setFavoriteButton(to: false)
        } else {
            bookInfoView.setFavoriteButton(to: true)
        }
    }
}
