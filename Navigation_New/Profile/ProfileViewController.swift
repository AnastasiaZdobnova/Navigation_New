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
        //view.addSubview(profileHeaderView)
        navigationItem.title = "Profile"
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillLayoutSubviews(){
      
        self.view.addSubview(profileHeaderView)
        //profileHeaderView.frame = view.bounds
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
