//
//  MainCollectionViewCell.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

protocol DataCollectionProtocol {
    func deleteData(index: Int)
}

class MainCollectionViewCell: UICollectionViewCell {
// MARK: - Public Properties
    var delegate: DataCollectionProtocol?
    var index: IndexPath?
    var isEditing: Bool = false
    
    func custom(name: String, index: IndexPath){
        label.text = name
        self.index = index
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
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Cross"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

// MARK: - Customization
extension MainCollectionViewCell {
    private func constraints(){
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(named: "Gray")
        contentView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        contentView.addSubview(deleteButton)
        deleteButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
        deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11).isActive = true
    }
}

// MARK: - Button Targets Configuration
extension MainCollectionViewCell {
    private func addTargets(){
        deleteButton.addTarget(self, action: #selector(deleteButtonTaped), for: .touchUpInside)
    }
    
    @objc func deleteButtonTaped(){
        guard let indx = self.index else { return }
        delegate?.deleteData(index: indx.row)
    }
}
