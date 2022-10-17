//
//  CategoryCollectionViewCell.swift
//  SSBook
//
//  Created by Diego Ferreira on 17/10/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    lazy var outterView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor(named: "grayBorderColor")?.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()

    lazy var categoryLabel: SSLabel = {
        let label = SSLabel(
            text: "Romance",
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
        
        contentView.addSubview(outterView)
        
        outterView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            outterView.topAnchor.constraint(equalTo: topAnchor),
            outterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            outterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            outterView.bottomAnchor.constraint(equalTo: bottomAnchor),

//            categoryLabel.centerXAnchor.constraint(equalTo: outterView.centerXAnchor),
            categoryLabel.topAnchor.constraint(equalTo: outterView.topAnchor, constant: 6),
            categoryLabel.leadingAnchor.constraint(equalTo: outterView.leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: outterView.trailingAnchor, constant: -16),
            categoryLabel.bottomAnchor.constraint(equalTo: outterView.bottomAnchor, constant: -6),
//            categoryLabel.centerYAnchor.constraint(equalTo: outterView.centerYAnchor),
//            categoryLabel.heightAnchor.constraint(equalToConstant: 20),
//            categoryLabel.trailingAnchor.constraint(equalTo: outterView.trailingAnchor, constant: -29)
        ])
    }
}
