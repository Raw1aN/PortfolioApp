//
//  MainViewController.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {

// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        delegates()
        viewControllerConfiguration()
        scrollViewConstraints()
        informationViewConstraints()
        editViewConstraints()
        collectionViewConstraints()
        aboutMeViewConstraints()
        topViewConstraints()
        addAlertTextFieldAction()
    }

// MARK: - Private Properties
    private let viewModel = MainViewModel()
    
    private let informationView = {
        let view = InformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let editView = {
        let view = EditView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collectionView: MainCollectionView = {
        let layout = ExperienceFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let cv = MainCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(MainEditingCollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        cv.register(AddSkillCollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    private let aboutMeView = {
        let view = AboutMeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Gray")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let alertController: UIAlertController = {
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка, которым вы владеете", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Введите название"
            field.returnKeyType = .continue
        }
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        return alert
    }()
    
}

// MARK: - Constraints
extension MainViewController {
    func scrollViewConstraints() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func informationViewConstraints() {
        scrollView.addSubview(informationView)
        informationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24).isActive = true
        informationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        informationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        informationView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        informationView.heightAnchor.constraint(equalToConstant: 244).isActive = true
    }
    
    func topViewConstraints() {
        scrollView.addSubview(topView)
        topView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        topView.bottomAnchor.constraint(equalTo: informationView.topAnchor, constant: 0).isActive = true
    }
    
    func editViewConstraints() {
        scrollView.addSubview(editView)
        editView.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 20).isActive = true
        editView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        editView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
    }
    
    func collectionViewConstraints() {
        scrollView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: editView.bottomAnchor, constant: 16).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
    }

    func aboutMeViewConstraints() {
        scrollView.addSubview(aboutMeView)
        aboutMeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        aboutMeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        aboutMeView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24).isActive = true
        aboutMeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        aboutMeView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
}

// MARK: - Customization
extension MainViewController {
    func viewControllerConfiguration(){
        view.backgroundColor = UIColor(named: "Gray")
        title = "Профиль"
    }
}

// MARK: - Delegates
extension MainViewController{
    func delegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (isEditing==true){
            return viewModel.skills.count+1
        }
        else{
            return viewModel.skills.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isEditing==true {
            if viewModel.skills.count==indexPath.row {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! AddSkillCollectionViewCell
                cell.custom(name: "+",index: indexPath)
                cell.isEditing = isEditing
                cell.delegate = self
                return cell
            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
            cell.custom(name: viewModel.skills[indexPath.row],index: indexPath)
            cell.delegate = self
            cell.isEditing = isEditing
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! MainEditingCollectionViewCell
            cell.custom(name: viewModel.skills[indexPath.row], index: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if viewModel.skills.count==indexPath.row {
            let item = "+"
            var itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
            ])
            itemSize.width += 43.5
            itemSize.height += 27.30
            return itemSize
        }
        else {
            let item = viewModel.skills[indexPath.row]
            var itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
            ])
            if (isEditing==true){
                itemSize.width += 67.5
            }
            else {
                itemSize.width += 43.5
            }
            itemSize.height += 27.30
            if (itemSize.width > collectionView.frame.size.width){
                itemSize.width=collectionView.frame.size.width
            }
            return itemSize
        }
    }
}

// MARK: - Targets Buttons Configuration
extension MainViewController {
    func addTargets(){
        editView.editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
    }
    
    @objc func editTapped() {
        if isEditing==false{
            isEditing=true
        }
        else {
            isEditing=false
        }
        editView.isEditing = isEditing
        collectionView.reloadData()
    }
}

// MARK: - Custom Protocols
extension MainViewController: DataCollectionProtocol, AddDataCollectionProtocol {
    func addSkill() {
        present(alertController, animated: true)
    }
    
    func deleteData(index: Int) {
        viewModel.deleteSkill(index: index)
        collectionView.reloadData()
    }
}

// MARK: - Add action to UIAlertController
extension MainViewController {
    func addAlertTextFieldAction(){
        alertController.addAction(UIAlertAction(title: "Добавить", style: .default,handler: { _ in
            guard let skillArray = self.alertController.textFields else { return }
            guard let skillName = skillArray[0].text else { return }
            self.viewModel.addSkill(name: skillName)
            self.collectionView.reloadData()
        }))
    }
}
