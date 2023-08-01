//
//  AddSkillCollectionViewCell.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

protocol AddDataCollectionProtocol {
    func addSkill()
}

class AddSkillCollectionViewCell: UICollectionViewCell {
// MARK: - Public Properties
    var isEditing: Bool = false
    var delegate: AddDataCollectionProtocol?
    var name: String?
    
// MARK: - custom function
    func custom(name: String, index: IndexPath){
        label.text = name
    }
 
// MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraints()
        addTargets()
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
        title.numberOfLines = 0
        title.textColor = .black
        title.textAlignment = NSTextAlignment.center
        return title
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
}

// MARK: - Constraints
extension AddSkillCollectionViewCell {
    private func constraints(){
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(named: "Gray")
        contentView.addSubview(addButton)
        addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        addButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
    }
}

extension AddSkillCollectionViewCell {
    private func addTargets(){
        addButton.addTarget(self, action: #selector(addButtonTaped), for: .touchUpInside)
    }
    
    @objc func addButtonTaped(){
        delegate?.addSkill()
    }
}
