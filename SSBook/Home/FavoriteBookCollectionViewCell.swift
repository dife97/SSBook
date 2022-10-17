//
//  FavoriteBookCollectionViewCell.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class FavoriteBookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteBookCollectionViewCell"
    
    lazy var coverImageView: UIImageView = {
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
    
    lazy var booktAuthorLabel: SSLabel = {
        let label = SSLabel(
            text: "Julia Quinn",
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
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(booktTitleLabel)
        contentView.addSubview(booktAuthorLabel)
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 198),
            coverImageView.widthAnchor.constraint(equalToConstant: 136),
            
            booktTitleLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 10),
            booktTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            booktTitleLabel.widthAnchor.constraint(equalToConstant: 136),
            
            booktAuthorLabel.topAnchor.constraint(equalTo: booktTitleLabel.bottomAnchor, constant: 2),
            booktAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            booktAuthorLabel.widthAnchor.constraint(equalToConstant: 136)
        ])
    }
}
