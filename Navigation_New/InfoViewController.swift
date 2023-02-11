//
//  InfoViewController.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 11.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemYellow
        myButton()
        
        
        
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Alert Title", message: "Alert Message", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "First Action", style: .default) { (action) in
            print("First Action pressed")
        }
        let secondAction = UIAlertAction(title: "Second Action", style: .default) { (action) in
            print("Second Action pressed")
        }
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        present(alertController, animated: true, completion: nil)
    }
    func myButton(){
        let button = UIButton(frame: CGRect(x: 100, y: 150, width: 200,  height: 70))
        button.layer.cornerRadius = 10
        view.addSubview(button)
        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .mainWhite
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
        
    
    
    
}
