//
//  BookInfoViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class BookInfoViewController: UIViewController {
    
    let bookCoverImageName: String
    let bookTitleText: String
    let authorNameText: String
    let bookDescriptionText: String
    let isFavorite: Bool
    
    init(bookCoverImageName: String,
         bookTitleText: String,
         authorNameText: String,
         bookDescriptionText: String,
         isFavorite: Bool) {
        
        self.bookCoverImageName = bookCoverImageName
        self.bookTitleText = bookTitleText
        self.authorNameText = authorNameText
        self.bookDescriptionText = bookDescriptionText
        self.isFavorite = isFavorite
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bookInfoView: BookInfoView = {
        let view = BookInfoView(
            bookCoverImageName: bookCoverImageName,
            bookTitleText: bookTitleText,
            authorNameText: authorNameText,
            bookDescriptionText: bookDescriptionText,
            isFavorite: isFavorite
        )
        
        return view
    }()
    
    // load view calling configureView(with: bookInfoViewConfiguration)
    override func loadView() {
        
        view = bookInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
