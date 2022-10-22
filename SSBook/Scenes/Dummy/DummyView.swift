//
//  DummyView.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class DummyView: UIView {
    
    private lazy var dummyLabel: SSLabel = {
        let label = SSLabel(text: "Tela demonstrativa", size: 18)
        
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureEmptyLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureEmptyLabel() {

        addSubview(dummyLabel)
        
        NSLayoutConstraint.activate([
            dummyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dummyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dummyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dummyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
