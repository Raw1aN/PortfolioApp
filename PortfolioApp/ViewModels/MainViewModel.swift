//
//  MainViewModel.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import Foundation

class MainViewModel {
    
// MARK: - Public Properties
    var skills = ["GCD","UIKit","MVVM","MVP","MVC","CocoaPods","SwifLint","SnapKit","Networking","Realm","Autolayout"]
    
// MARK: - View Model functions
    func deleteSkill(index: Int) {
        skills.remove(at: index)
    }
    
    func addSkill(name: String) {
        skills.append(name)
    }
}
