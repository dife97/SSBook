//
//  BookInfoView.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class BookInfoView: UIView {
    
    //MARK: - Properties
    
    var bookData: BookData
    
    var didTapBackButton: (() -> Void)?
    
    var didTapIsFavoriteButton: (() -> Void)?
    
    //MARK: - UI
    
    //TODO: insert circled background view
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setImage(UIImage(named: "backButtonIcon"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    //TODO: tres pontinhos menuImage
    
    lazy var bookCoverImageView: SSImageView = {
        let imageView = SSImageView(bookImage: bookData.bookCoverImageName)
        
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
    
    private lazy var isFavoriteButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedIsFavoriteButton), for: .touchUpInside)
        
        return button
    }()
    
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

        let attributedString = NSAttributedString(string: bookData.bookDescriptionText, attributes: attributes)
        
        textView.attributedText = attributedString
        textView.backgroundColor = .white

        return textView
    }()
    
    //TODO: margin view of height 32
    
    //MARK: - Initializers
    
    init(bookData: BookData) {
        self.bookData = bookData
        
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureBookCoverImageView()
        
        configureBackButton()
        
        configureBookInfoContainerView()
    }
    
    private func configureBackButton() {
        
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 31),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 14),
            backButton.widthAnchor.constraint(equalToConstant: 16)
        ])
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
        bookInfoContainerView.addSubview(isFavoriteButton)
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
            
            isFavoriteButton.topAnchor.constraint(equalTo: bookInfoContainerView.topAnchor, constant: 35),
            isFavoriteButton.trailingAnchor.constraint(equalTo: bookInfoContainerView.trailingAnchor, constant: -20),
            isFavoriteButton.heightAnchor.constraint(equalToConstant: 18.35),
            isFavoriteButton.widthAnchor.constraint(equalToConstant: 20),
            
            bookAuthorLabel.topAnchor.constraint(equalTo: booktTitleLabel.bottomAnchor, constant: 8),
            bookAuthorLabel.leadingAnchor.constraint(equalTo: booktTitleLabel.leadingAnchor),
            
            bookDescriptionTextView.topAnchor.constraint(equalTo: bookAuthorLabel.bottomAnchor, constant: 20),
            bookDescriptionTextView.leadingAnchor.constraint(equalTo: bookInfoContainerView.leadingAnchor, constant: 16),
            bookDescriptionTextView.trailingAnchor.constraint(equalTo: bookInfoContainerView.trailingAnchor, constant: -16),
            bookDescriptionTextView.bottomAnchor.constraint(equalTo: bookInfoContainerView.bottomAnchor)
        ])
    }
    
    @objc func tappedBackButton() {
        
        didTapBackButton?()
    }
    
    @objc func tappedIsFavoriteButton() {
        
        didTapIsFavoriteButton?()
    }
    
    func setFavoriteButton(to value: Bool) {
        
        if value == true {
            bookData.isFavorite = false
            isFavoriteButton.setImage(UIImage(named: "heartIcon"), for: .normal)
            isFavoriteButton.tintColor = UIColor(named: "mainGray")
        } else {
            bookData.isFavorite = true
            isFavoriteButton.setImage(UIImage(named: "filledHeartIcon"), for: .normal)
            isFavoriteButton.tintColor = UIColor(named: "mainPurple")
        }
    }
}
