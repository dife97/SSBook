//
//  SSButton.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class SSButton: UIView {
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var buttonAction: (() -> Void)?
    
    init(title: String,
         titleColorName: String = "mainBlack") {
        
        super.init(frame: .zero)
        
        configureView()
        
        configureSSButton(title: title, titleColorName: titleColorName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.topAnchor.constraint(equalTo: topAnchor),
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSSButton(title: String, titleColorName: String) {
        
        mainButton.setTitle(title, for: .normal)
        mainButton.setTitleColor(UIColor(named: titleColorName), for: .normal)
        mainButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
        
        mainButton.addTarget(self, action: #selector(didTapSSButton), for: .touchUpInside)
    }
    
    @objc func didTapSSButton() {
        
        buttonAction?()
    }
}
