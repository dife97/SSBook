//
//  SSLabel.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class SSLabel: UILabel {
    
    init(text: String,
         size: CGFloat = 20,
         font: String = "Roboto-Bold",
         colorName: String = "mainBlack") {
        
        super.init(frame: .zero)
        
        configureSSLabel(text: text, size: size, font: font, colorName: colorName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSSLabel(text: String, size: CGFloat, font: String, colorName: String) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.font = UIFont(name: font, size: size)
        self.textColor = UIColor(named: colorName)
    }
}
