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
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.textColor = .black
            label.numberOfLines = 1
            label.textAlignment = .left
            label.text = "John Smith"
            return label
        }()
   
    
    private let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "image")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.backgroundColor = .white
            imageView.layer.borderColor = UIColor.systemGray.cgColor
            imageView.layer.borderWidth = 1
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
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            profileImageView.widthAnchor.constraint(equalToConstant: 64),
            profileImageView.heightAnchor.constraint(equalToConstant: 64),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//            bioLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
//            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
//            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
