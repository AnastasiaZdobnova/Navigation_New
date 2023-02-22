//
//  ProfileHeaderView.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 21.02.2023.
//

import UIKit

//добавляем изображение




class ProfileHeaderView: UIView {
    // Создаем экземпляр UILabel
    private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.numberOfLines = 1 // текст внутри label отображается только в одну строку. Если текст не помещается в одну строку, то он будет обрезан и заменен троеточием.
            label.textAlignment = .left // выравнивание
            label.text = "John Smith"
            return label
        }()
   
    
    private let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "image")
            imageView.contentMode = .scaleAspectFill// режим заполнения (fill) содержимого UIImageView путем масштабирования и обрезания краев изображения, чтобы оно заполняло все доступное место, сохраняя при этом пропорции.
            imageView.clipsToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor // цвет рамки
            imageView.layer.borderWidth = 3 // ширина рамки
            imageView.layer.cornerRadius = 50 //скругление
            return imageView
        }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),//по X
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),//по Y
            profileImageView.widthAnchor.constraint(equalToConstant: 100),//ширина
            profileImageView.heightAnchor.constraint(equalToConstant: 100),//высота
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 36), // расстояние от изображения
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 11), //27-16
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//            bioLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
//            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
//            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
