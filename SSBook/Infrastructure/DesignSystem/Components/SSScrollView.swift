//
//  SSScrollView.swift
//  SSBook
//
//  Created by Diego Ferreira on 18/10/22.
//

import UIKit

class SSScrollView: UIScrollView {
    
    init(backgroundColorName: String) {
        
        super.init(frame: .zero)
        
        configureSSScrollView(backgroundColorName: backgroundColorName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSSScrollView(backgroundColorName: String) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor(named: backgroundColorName)
    }
}


