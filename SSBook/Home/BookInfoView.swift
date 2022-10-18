//
//  BookInfoView.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class BookInfoView: UIView {
    
    //MARK: - Properties
    let bookCoverImageName: String
    let bookTitleText: String
    let authorNameText: String
    let bookDescriptionText: String
    let isFavorite: Bool
    
    //MARK: - UI
    
    // back button
    // tres pontinhos menuImage
    
    private lazy var bookCoverImageView: SSImageView = {
        let imageView = SSImageView(imageName: bookCoverImageName)
        
        imageView.layer.cornerRadius = 0
        
        return imageView
    }()
    
    let bookInfoContainerView = SSView(backgroundColor: .white)
    
    lazy var booktTitleLabel: SSLabel = {
        let label = SSLabel(text: "O duque e eu (Os Bridgertons não sei o que..")
        
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var bookAuthorLabel: SSLabel = {
        let label = SSLabel(
            text: "Julia Quinn",
            size: 14,
            font: "Roboto-Regular"
        )
        
        label.numberOfLines = 0
        
        return label
    }()
    
    let isFavoriteIcon = SSImageView(systemImageName: "heart.fill")
    
    private lazy var bookDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        let attributes: [NSAttributedString.Key:Any] = [
            .font: UIFont(name: "Roboto-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor(named: "mainBlack") ?? UIColor.black,
            .paragraphStyle: paragraphStyle
        ]

        let attributedString = NSAttributedString(string: bookDescriptionText, attributes: attributes)
        
        textView.attributedText = attributedString
        textView.backgroundColor = .white

        return textView
    }()
    
    //MARK: - Initializers
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
        
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureBookCoverImageView()
        
        configureBookInfoContainerView()
    }
    
    private func configureBookCoverImageView() {
        
        addSubview(bookCoverImageView)
        
        NSLayoutConstraint.activate([
            bookCoverImageView.topAnchor.constraint(equalTo: topAnchor),
            bookCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookCoverImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookCoverImageView.heightAnchor.constraint(equalToConstant: 519)
        ])
    }
    
    private func configureBookInfoContainerView() {
        
        addSubview(bookInfoContainerView)
        
        bookInfoContainerView.addSubview(booktTitleLabel)
        bookInfoContainerView.addSubview(isFavoriteIcon)
        bookInfoContainerView.addSubview(bookAuthorLabel)
        bookInfoContainerView.addSubview(bookDescriptionTextView)
        
        NSLayoutConstraint.activate([
            bookInfoContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 285),
            bookInfoContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookInfoContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookInfoContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            booktTitleLabel.topAnchor.constraint(equalTo: bookInfoContainerView.topAnchor, constant: 32),
            booktTitleLabel.leadingAnchor.constraint(equalTo: bookInfoContainerView.leadingAnchor, constant: 20),
            booktTitleLabel.trailingAnchor.constraint(equalTo: bookInfoContainerView.trailingAnchor, constant: -64),
            
            isFavoriteIcon.topAnchor.constraint(equalTo: booktTitleLabel.topAnchor),
            isFavoriteIcon.trailingAnchor.constraint(equalTo: bookInfoContainerView.trailingAnchor, constant: -20),
            isFavoriteIcon.heightAnchor.constraint(equalToConstant: 18.35),
            isFavoriteIcon.widthAnchor.constraint(equalToConstant: 20),
            
            bookAuthorLabel.topAnchor.constraint(equalTo: booktTitleLabel.bottomAnchor, constant: 8),
            bookAuthorLabel.leadingAnchor.constraint(equalTo: booktTitleLabel.leadingAnchor),
            
            bookDescriptionTextView.topAnchor.constraint(equalTo: bookAuthorLabel.bottomAnchor, constant: 20),
            bookDescriptionTextView.leadingAnchor.constraint(equalTo: bookInfoContainerView.leadingAnchor, constant: 16),
            bookDescriptionTextView.trailingAnchor.constraint(equalTo: bookInfoContainerView.trailingAnchor, constant: -16),
            bookDescriptionTextView.bottomAnchor.constraint(equalTo: bookInfoContainerView.bottomAnchor)
        ])
    }
}
