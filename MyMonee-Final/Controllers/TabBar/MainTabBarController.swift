//
//  MainTabBarController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .white
        var viewControllers:[ViewControllerData] = Array()
        
        // Home Tab Bar
        let home = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: nil)
        viewControllers.append(ViewControllerData(viewController: home, imageNamed: "Home", imageSelectedNamed: "Home_Selected"))
        
        // Impian Tab Bar
        let impian = ImpianViewControllerNew(nibName: String(describing: ImpianViewControllerNew.self), bundle: nil)
        viewControllers.append(ViewControllerData(viewController: impian, imageNamed: "Impian", imageSelectedNamed: "Impian_Selected"))
        
        // Profile Tab Bar
        let profile = ProfileViewController(nibName: String(describing: ProfileViewController.self), bundle: nil)
        viewControllers.append(ViewControllerData(viewController: profile, imageNamed: "Profile", imageSelectedNamed: "Profile_Selected"))
        
        self.viewControllers = createTabBar(viewControllers: viewControllers)
    }
    
    fileprivate func createTabBar(viewControllers:[ViewControllerData]) -> [UINavigationController] {
        var result:[UINavigationController] = Array()
        
        for (index,item) in viewControllers.enumerated() {
            let currentViewControllerTab = UINavigationController(rootViewController: item.viewController)
            currentViewControllerTab.setNavigationBarHidden(true, animated: false)
            let image = UIImage(named: item.imageNamed)?.withRenderingMode(.alwaysOriginal)
            let imageSelected = UIImage(named: item.imageSelectedNamed)?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(named: "TabBarSelected") ?? UIColor.black)
            currentViewControllerTab.tabBarItem = UITabBarItem(title: item.imageNamed, image: image, selectedImage: imageSelected)
            currentViewControllerTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBarSelected")!], for: .selected)
            currentViewControllerTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBar")!], for: .normal)
            currentViewControllerTab.tabBarItem.tag = index
            result.append(currentViewControllerTab)
        }
        return result
    }
}
