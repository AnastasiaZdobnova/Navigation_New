//
//  ViewController.swift
//  Navigation_New
//
//  Created by Анастасия Здобнова on 09.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        
        //setTabBarAppearance()
    }
    
    //NC
    private func generateTabBar(){
        let feedNC = generateNC(viewController: FeedViewController(), itemName: "Feed", itemImage: UIImage(systemName: "house.fill"))
        let profileNC = generateNC(viewController: LogInViewController(), itemName: "Profile", itemImage : UIImage(systemName: "person.fill"))
        
        viewControllers = [feedNC,profileNC]
        
        // Установка цвета таббара
        tabBar.tintColor = UIColor.white
        tabBar.backgroundColor = .darkGray
        tabBar.unselectedItemTintColor = .lightGray
    }
        //NC
    private func generateNC(viewController: UIViewController, itemName: String, itemImage: UIImage?) ->UINavigationController {
        let item = UITabBarItem(
            title: itemName,
            image: itemImage,
            tag: 0)
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        
        return navController
       }
    
}

