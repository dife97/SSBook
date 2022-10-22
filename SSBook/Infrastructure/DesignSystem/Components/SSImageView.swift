//
//  SSImageView.swift
//  SSBook
//
//  Created by Diego Ferreira on 18/10/22.
//

import UIKit

class SSImageView: UIImageView {
    
    init(imageName: String) {
        super.init(frame: .zero)

        configureSSImage(imageName: imageName)
    }
    
    init(systemImageName: String) {
        super.init(frame: .zero)

        configureSSImage(systemImageName: systemImageName)
    }
    
    init(bookImage: UIImage?) {
        super.init(frame: .zero)

        configureSSImage(bookImage: bookImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSSImage(imageName: String) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentMode = .scaleAspectFill
        layer.cornerRadius = 8
        layer.masksToBounds = true
        image = UIImage(named: imageName)
    }
    
    private func configureSSImage(systemImageName: String) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentMode = .scaleAspectFill
        image = UIImage(systemName: systemImageName)
    }
    
    private func configureSSImage(bookImage: UIImage?) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentMode = .scaleAspectFill
        image = bookImage
    }
}
