//
//  FeedViewController.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 09.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPurple
        layout()
        
    }
    
    private let feedUIStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
   
    @objc func handleButtonTapped(){
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
        postVC.post = post

    }
    private lazy var firstFeedButton : UIButton = {
        let firstFeedButton = UIButton()
        firstFeedButton.setTitle("New post", for: .normal)
        firstFeedButton.setTitleColor(.white, for: .normal)
        firstFeedButton.backgroundColor = .lightGray
        firstFeedButton.layer.cornerRadius = 10
        firstFeedButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return firstFeedButton
    }()
    
    private lazy var secondFeedButton : UIButton = {
        let secondFeedButton = UIButton()
        secondFeedButton.setTitle("New post", for: .normal)
        secondFeedButton.setTitleColor(.white, for: .normal)
        secondFeedButton.backgroundColor = .lightGray
        secondFeedButton.layer.cornerRadius = 10
        secondFeedButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return secondFeedButton
    }()
    
    
    let post = Post(title: "New Title")
    
    private func layout(){
        view.addSubview(feedUIStackView)
        feedUIStackView.addArrangedSubview(firstFeedButton)
        feedUIStackView.addArrangedSubview(secondFeedButton)
        
        NSLayoutConstraint.activate([
            feedUIStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedUIStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            feedUIStackView.heightAnchor.constraint(equalToConstant: 300),
            feedUIStackView.widthAnchor.constraint(equalToConstant: 400)
        
        
        
        ])
    }
}

struct Post {
    let title: String
}


