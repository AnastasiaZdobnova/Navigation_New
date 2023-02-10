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
        setTabBarAppearance()
    }
    
// VC
//    private func generateTabBar(){
//        viewControllers = [
//            generateVC(viewController: FeedViewController(), title: "Feed", image: UIImage(systemName: "house.fill")),
//            generateVC(viewController: ProfileViewController(), title: "Profile", image : UIImage(systemName: "person.fill"))
//        ]
//    }
//
//    private func generateVC(viewController: UIViewController, title: //VC String, image: UIImage?) ->UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        return viewController
//    }
    
    //NC
    private func generateTabBar(){
        var feedNC = generateNC(viewController: FeedViewController(), itemName: "Feed", itemImage: UIImage(systemName: "house.fill"))
        var profileNC = generateNC(viewController: ProfileViewController(), itemName: "Profile", itemImage : UIImage(systemName: "person.fill"))
        
            viewControllers = [feedNC,profileNC]
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

    private func setTabBarAppearance(){

        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height),
            cornerRadius: height/2)
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width/5
        tabBar.itemPositioning = .centered

        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight

    }
    
    
    
}

