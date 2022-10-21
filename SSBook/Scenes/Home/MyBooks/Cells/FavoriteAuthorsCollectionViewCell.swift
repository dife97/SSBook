//
//  FavoriteAuthorsCollectionViewCell.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class FavoriteAuthorsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteAuthorsCollectionViewCell"
    
    lazy var outterView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor(named: "grayBorderColor")?.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    private let authorImageView = SSImageView(imageName: "randomAuthor")

    private lazy var authorTitleLabel: SSLabel = {
        let label = SSLabel(
            text: "-",
            size: 16)

        label.numberOfLines = 1

        return label
    }()

    private lazy var booksCountLabel: SSLabel = {
        let label = SSLabel(
            text: "-",
            size: 14,
            font: "Roboto-Regular"
        )

        label.numberOfLines = 0

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        contentView.addSubview(outterView)
        
        outterView.addSubview(authorImageView)
        outterView.addSubview(authorTitleLabel)
        outterView.addSubview(booksCountLabel)
        
        NSLayoutConstraint.activate([
            outterView.topAnchor.constraint(equalTo: topAnchor),
            outterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            outterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            outterView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            authorImageView.topAnchor.constraint(equalTo: topAnchor),
            authorImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            authorImageView.heightAnchor.constraint(equalToConstant: 67),
            authorImageView.widthAnchor.constraint(equalToConstant: 63),

            authorTitleLabel.topAnchor.constraint(equalTo: outterView.topAnchor, constant: 15),
            authorTitleLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 20),
            authorTitleLabel.trailingAnchor.constraint(equalTo: outterView.trailingAnchor, constant: -8),

            booksCountLabel.topAnchor.constraint(equalTo: authorTitleLabel.bottomAnchor, constant: 5),
            booksCountLabel.leadingAnchor.constraint(equalTo: authorTitleLabel.leadingAnchor),
            booksCountLabel.trailingAnchor.constraint(equalTo: authorTitleLabel.trailingAnchor)
        ])
    }
    
    func configure(with author: FavoriteAuthorModel) {
        
        authorImageView.image = author.image
        
        authorTitleLabel.text = author.name
        
        if author.booksCount == 1 {
            booksCountLabel.text = "\(author.booksCount) livro"
        } else if author.booksCount > 1 {
            booksCountLabel.text = "\(author.booksCount) livros"
        }
    }
}
