//
//  HomeView.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class HomeView: UIView {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageview = UIImageView()
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "logo")
        
        return imageview
    }()
    
    private lazy var userPictureImageView: UIImageView = {
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = imageview.bounds.size.width * 0.5
        imageview.clipsToBounds = true
        imageview.contentMode = .scaleAspectFit
        imageview.tintColor = UIColor(named: "mainGray")
        imageview.image = UIImage(systemName: "person.circle.fill")
        
        return imageview
    }()
    
    private lazy var myBookTitleButton: SSButton = {
        let button = SSButton(title: "Meus livros")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonAction = { self.didTapMyBooksButton() }
        
        return button
    }()
    
    private lazy var borrowedBooksTitleButton: SSButton = {
        let button = SSButton(title: "Emprestados")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonAction = { self.didTapBorrowedBooksButton() }
        
        return button
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "mainPurple")
        view.layer.cornerRadius = 2
        
        return view
    }()
    
    lazy var myBooksView: MyBooksView = {
        let view = MyBooksView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureHeaderView()
        
        configureTitleLabels()
        
        configureUnderlineView()
        
        configureMyBooksView()
    }
    
    private func configureHeaderView() {
        
        addSubview(headerView)
        
        headerView.addSubview(logoImageView)
        headerView.addSubview(userPictureImageView)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 168),
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            logoImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 44),
            logoImageView.widthAnchor.constraint(equalToConstant: 78),
            
            userPictureImageView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            userPictureImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            userPictureImageView.heightAnchor.constraint(equalToConstant: 32),
            userPictureImageView.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func configureTitleLabels() {
        
        headerView.addSubview(myBookTitleButton)
        headerView.addSubview(borrowedBooksTitleButton)
        
        NSLayoutConstraint.activate([
            myBookTitleButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 22),
            myBookTitleButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 31),
            
            borrowedBooksTitleButton.bottomAnchor.constraint(equalTo: myBookTitleButton.bottomAnchor),
            borrowedBooksTitleButton.leadingAnchor.constraint(equalTo: myBookTitleButton.trailingAnchor, constant: 40)
        ])
    }
    
    private func configureUnderlineView() {
        
        headerView.addSubview(underlineView)
        
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalTo: myBookTitleButton.bottomAnchor, constant: 12),
            underlineView.centerXAnchor.constraint(equalTo: myBookTitleButton.centerXAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            underlineView.widthAnchor.constraint(equalToConstant: 94)
        ])
    }
    
    private func configureMyBooksView() {
        
        addSubview(myBooksView)
        
        NSLayoutConstraint.activate([
            myBooksView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            myBooksView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myBooksView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myBooksView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func didTapMyBooksButton() {
        
        print("MY BOOKS")
    }
    
    private func didTapBorrowedBooksButton() {
        
        print("BORROWED")
    }
}
