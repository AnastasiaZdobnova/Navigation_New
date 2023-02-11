//
//  PostViewController.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 10.02.2023.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        navigationItem.title = post.title
        let barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(handleButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    var post = Post(title: "Some Post Title")
    @objc func handleButton() {
            // Добавьте код, который выполняется при нажатии на кнопку
        let infoVC = InfoViewController()
            present(infoVC, animated: true, completion: nil)
        }

}
