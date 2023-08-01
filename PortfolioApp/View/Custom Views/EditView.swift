//
//  EditView.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class EditView: UIView {
// MARK: - Init
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
// MARK: - Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    var isEditing: Bool = false {
        didSet {
            if isEditing==true{
                editButton.setImage(UIImage(named: "Done"), for: .normal)
            }
            else{
                editButton.setImage(UIImage(named: "Pen"), for: .normal)
            }
        }
    }
// MARK: - Private Properties
    private let locationLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        title.textAlignment = NSTextAlignment.center
        title.numberOfLines = 1
        title.textColor = .black
        title.text = "Мои навыки"
        return title
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        let image = UIImageView(image: UIImage(named: "Pen"))
        button.setImage(UIImage(named: "Pen"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

extension EditView {
    
// MARK: - Initialize Func
    func initialize(){
        backgroundColor = .white
        addSubview(locationLabel)
        locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        locationLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        addSubview(editButton)
        editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        editButton.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        editButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
