//
//  ProfileHeaderView.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 21.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1 // текст внутри label отображается только в одну строку. Если текст не помещается в одну строку, то он будет обрезан и заменен троеточием.
        label.textAlignment = .left // выравнивание
        label.text = "John Smith"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill// режим заполнения (fill) содержимого UIImageView путем масштабирования и обрезания краев изображения, чтобы оно заполняло все доступное место, сохраняя при этом пропорции.
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor // цвет рамки
        imageView.layer.borderWidth = 3 // ширина рамки
        imageView.layer.cornerRadius = 50 //скругление
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1 // текст внутри label отображается только в одну строку. Если текст не помещается в одну строку, то он будет обрезан и заменен троеточием.
        label.textAlignment = .left // выравнивание
        label.text = "Waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField : UITextField = {
        let profileEditStatusTextField = UITextField()
        profileEditStatusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        profileEditStatusTextField.textColor = .black
        profileEditStatusTextField.backgroundColor = .white
        profileEditStatusTextField.layer.cornerRadius = 12
        profileEditStatusTextField.layer.borderColor = UIColor.black.cgColor
        profileEditStatusTextField.layer.borderWidth = 1
        profileEditStatusTextField.textAlignment = .left
        profileEditStatusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        profileEditStatusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: profileEditStatusTextField.frame.height))
        profileEditStatusTextField.leftViewMode = .always
        
        profileEditStatusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        return profileEditStatusTextField
    }()
    
    private lazy var setStatusButton : UIButton = {
        let profileButton = UIButton()
        profileButton.setTitle("Set status", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = .blue
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowOpacity = 0.7
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
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
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),//по X
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),//по Y
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),//ширина
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),//высота
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 36), // расстояние от изображения
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),//высота
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -60),
            
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            
            
        ])
        
    }
    private var statusText = ""
    
    @objc func buttonPressed() {
        print(statusText)
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let status = textField.text else { return }
        statusText = status
    }
}
extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}


