//
//  LibraryBooksTableViewCell.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class LibraryBooksTableViewCell: UITableViewCell {
    
    static let identifier = "LibraryBooksTableViewCell"
    
    lazy var bookCoverImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dummyBookCover")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    lazy var booktTitleLabel: SSLabel = {
        let label = SSLabel(
            text: "O duque e eu (Os Bridgertons não sei o que..",
            size: 16)
        
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        contentView.addSubview(bookCoverImageView)
        contentView.addSubview(booktTitleLabel)
        contentView.addSubview(bookAuthorLabel)
        
        NSLayoutConstraint.activate([
            bookCoverImageView.topAnchor.constraint(equalTo: topAnchor),
            bookCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bookCoverImageView.heightAnchor.constraint(equalToConstant: 70),
            bookCoverImageView.widthAnchor.constraint(equalToConstant: 48),
            
            booktTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            booktTitleLabel.leadingAnchor.constraint(equalTo: bookCoverImageView.trailingAnchor, constant: 10),
            booktTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            bookAuthorLabel.topAnchor.constraint(equalTo: booktTitleLabel.bottomAnchor, constant: 6),
            bookAuthorLabel.leadingAnchor.constraint(equalTo: bookCoverImageView.trailingAnchor, constant: 10)
        ])
    }
}
