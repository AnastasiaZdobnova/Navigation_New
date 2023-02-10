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
        myButton()
        
    }
   
    func myButton(){
        let button = UIButton(frame: CGRect(x: 100, y: 150, width: 200,  height: 70))
        button.layer.cornerRadius = 10
        view.addSubview(button)
        button.setTitle("New post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .mainWhite
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    }
    
    @objc func handleButtonTapped(){
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}
