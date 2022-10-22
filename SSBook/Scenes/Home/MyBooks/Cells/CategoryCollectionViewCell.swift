//
//  CategoryCollectionViewCell.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"

    lazy var categoryLabel: SSLabel = {
        let label = SSLabel(
            text: "",
            size: 14,
            font: "Roboto-Medium")

        label.numberOfLines = 0
        label.textAlignment = .center

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
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 14 /// figma was 16 points, but it was resulting in a not perfect rounded result.
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor(named: "grayBorderColor")?.cgColor
        contentView.layer.borderWidth = 1
        
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }
    
    func configure(with category: String) {
        
        categoryLabel.text = category
    }
}
