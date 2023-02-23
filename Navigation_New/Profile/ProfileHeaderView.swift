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
        label.translatesAutoresizingMaskIntoConstraints = false
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileStatusTextField : UITextField = {
        let profileUITextField = UITextField()
        profileUITextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileUITextField.text = "Waiting for something..."
        profileUITextField.textColor = .gray
        profileUITextField.textAlignment = .left
        profileUITextField.translatesAutoresizingMaskIntoConstraints = false
        return profileUITextField
    }()
    
    private lazy var profileEditStatusTextField : UITextField = {
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
    
    private lazy var profileButton : UIButton = {
        let profileButton = UIButton()
        //        profileButton.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(profileStatusTextField)
        addSubview(profileButton)
        addSubview(profileEditStatusTextField)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),//по X
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),//по Y
            profileImageView.widthAnchor.constraint(equalToConstant: 100),//ширина
            profileImageView.heightAnchor.constraint(equalToConstant: 100),//высота
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 36), // расстояние от изображения
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 36),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileButton.heightAnchor.constraint(equalToConstant: 50),//высота
            
            profileStatusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            profileStatusTextField.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -60),
            
            profileEditStatusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            profileEditStatusTextField.heightAnchor.constraint(equalToConstant: 40),
            profileEditStatusTextField.topAnchor.constraint(equalTo: profileStatusTextField.bottomAnchor, constant: 10),
            profileEditStatusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            
            
        ])
        
    }
    private var statusText = ""
    
    @objc func buttonPressed() {
        print(statusText)
        profileStatusTextField.text = statusText
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


