//
//  DummyViewController.swift
//  SSBook
//
//  Created by Diego Ferreira on 16/10/22.
//

import UIKit

class DummyViewController: UIViewController {
    
    init(title: String?, tabBarItem: UITabBarItem?) {
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
        self.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "mainBackground")
    }
}
