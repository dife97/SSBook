//
//  SSView.swift
//  SSBook
//
//  Created by Diego Ferreira on 18/10/22.
//

import UIKit

class SSView: UIView {
    
    init(backgroundColorName: String) {
        
        super.init(frame: .zero)
        
        configureSSView(backgroundColorName: backgroundColorName)
    }
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        configureSSView(backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSSView(backgroundColorName: String) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor(named: backgroundColorName)
    }
    
    private func configureSSView(backgroundColor: UIColor) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = backgroundColor
    }
}

