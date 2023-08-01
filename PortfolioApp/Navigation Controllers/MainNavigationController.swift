//
//  MainNavigationController.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class MainNavigationController: UINavigationController {
    
// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar()
    }
}

// MARK: - Customization
extension MainNavigationController{
    func customNavBar(){
        navigationBar.tintColor = UIColor(named: "Gray")
    }
}
