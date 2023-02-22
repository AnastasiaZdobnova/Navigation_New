//
//  ProfileHeaderView.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 21.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
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
    
    private let profileUITextField : UITextField = {
        let profileUITextField = UITextField()
        profileUITextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileUITextField.text = "Waiting for something..."
        profileUITextField.textColor = .gray
        profileUITextField.textAlignment = .left
        return profileUITextField
    }()
    
    private let profileButton : UIButton = {
        let profileButton = UIButton()
        //        profileButton.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileButton.setTitle("Show status", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = .blue
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowOpacity = 0.7
        
        return profileButton
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
        addSubview(profileUITextField)
        addSubview(profileButton)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileUITextField.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),//по X
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),//по Y
            profileImageView.widthAnchor.constraint(equalToConstant: 100),//ширина
            profileImageView.heightAnchor.constraint(equalToConstant: 100),//высота
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 36), // расстояние от изображения
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileButton.heightAnchor.constraint(equalToConstant: 50),//высота
            
            profileUITextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            profileUITextField.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -34),
            
            
            
        ])
    }
}
