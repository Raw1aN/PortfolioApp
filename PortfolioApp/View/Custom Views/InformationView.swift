//
//  InformationView.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class InformationView: UIView {
    
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
    private let image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ProfilePhoto"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textAlignment = NSTextAlignment.center
        title.numberOfLines = 2
        title.textColor = .black
        title.text = "Щукин Алексей Андреевич"
        return title
    }()
    
    private let experienceLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.textAlignment = NSTextAlignment.center
        title.numberOfLines = 2
        title.textColor = .gray
        title.text = "Junior IOS-разработчик, опыт пол года"
        return title
    }()
    
    private let locationImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Location"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let locationLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.textAlignment = NSTextAlignment.center
        title.numberOfLines = 1
        title.textColor = .gray
        title.text = "Казань"
        return title
    }()
}

extension InformationView {
    
// MARK: - Initialize Func
    func initialize(){
        backgroundColor = UIColor(named: "Gray")
        addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -51).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51).isActive = true
        addSubview(experienceLabel)
        experienceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        experienceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51).isActive = true
        experienceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -51).isActive = true
        let locationStackView = UIStackView(arrangedSubviews: [locationImage,locationLabel])
        locationStackView.spacing = 4
        locationStackView.alignment = .leading
        locationStackView.axis = .horizontal
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationStackView)
        locationStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        locationStackView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 0).isActive = true
    }
}
