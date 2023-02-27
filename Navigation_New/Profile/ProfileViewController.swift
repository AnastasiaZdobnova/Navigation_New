//
//  ProfileViewController.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 21.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    
    let profileHeaderView = ProfileHeaderView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        navigationItem.title = "Profile"
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        layout()
        // Do any additional setup after loading the view.
        
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 200),
            
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private lazy var newButton : UIButton = {
        let profileButton = UIButton()
        profileButton.setTitle("New Button", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = .blue
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowOpacity = 0.7
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
//        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return profileButton
    }()
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
