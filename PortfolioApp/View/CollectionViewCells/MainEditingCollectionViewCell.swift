//
//  MainEditingCollectionViewCell.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class MainEditingCollectionViewCell: UICollectionViewCell {
    
// MARK: - Public Properties
    var isEditing: Bool = false
    
// MARK: - custom function
    func custom(name: String, index: IndexPath){
        label.text = name
    }
 
// MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraints()
    }
    
// MARK: - Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Private Properties
    let label: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.numberOfLines = 1
        title.textColor = .black
        return title
    }()
    
}

// MARK: - Constraints
extension MainEditingCollectionViewCell {
    private func constraints(){
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(named: "Gray")
        contentView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
    }
}
