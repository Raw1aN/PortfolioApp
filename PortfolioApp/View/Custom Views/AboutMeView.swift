//
//  AboutMeView.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class AboutMeView: UIView {
    
// MARK: - Init
    init(){
        super.init(frame: .zero)
        initialize()
    }
        
// MARK: - Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
// MARK: - Private Properties
    private let aboutLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        title.numberOfLines = 1
        title.textColor = .black
        title.text = "О себе"
        return title
    }()
    
    private let aboutInfromation: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.numberOfLines = 0
        title.textColor = .black
        title.text = "Пробовал себя в качестве .Net разработчика, но понял, что мобильная разработка на языке Swift больше мне интересна. Проходил несколько стажировок и параллельно с этим занимался домашними проектами. Имею опыт работы с актуальными архитектурами (MVVM + Coordinator/Router), верстка кодом (SnapKit).Работал с фреймворками для работы с базами данных (Realm, Core Data). Имею опыт работы с GCD."
        return title
    }()
}

extension AboutMeView {
    
// MARK: - Initialize Func
    func initialize(){
        addSubview(aboutLabel)
        aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        aboutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        addSubview(aboutInfromation)
        aboutInfromation.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8).isActive = true
        aboutInfromation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        aboutInfromation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
}
