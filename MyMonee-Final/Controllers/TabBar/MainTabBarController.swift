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

        // Home Tab Bar
        let home = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: nil)
        let homeTab = UINavigationController(rootViewController: home)
        homeTab.setNavigationBarHidden(true, animated: false)
        let homeImage = UIImage(named: "Home")?.withRenderingMode(.alwaysOriginal) //withRenderingMode: apabila melakukan perubahan warna maka icon juga ikut berubah
        let homeImageSelected = UIImage(named: "Home_Selected")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(named: "TabBarSelected") ?? UIColor.black)
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImageSelected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBarSelected") ?? UIColor.black], for: .selected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBar") ?? UIColor.lightGray], for: .normal)
        homeTab.tabBarItem.tag = 0
        
        // Impian Tab Bar
        let impian = ImpianViewControllerNew(nibName: String(describing: ImpianViewControllerNew.self), bundle: nil)
        let impianTab = UINavigationController(rootViewController: impian)
        impianTab.setNavigationBarHidden(true, animated: false)
        let impianImage = UIImage(named: "Impian")?.withRenderingMode(.alwaysOriginal) //withRenderingMode: apabila melakukan perubahan warna maka icon juga ikut berubah
        let impianImageSelected = UIImage(named: "Impian_Selected")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(named: "TabBarSelected") ?? UIColor.black)
        impianTab.tabBarItem = UITabBarItem(title: "Impian", image: impianImage, selectedImage: impianImageSelected)
        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBarSelected") ?? UIColor.black], for: .selected)
        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBar") ?? UIColor.lightGray], for: .normal)
        impianTab.tabBarItem.tag = 1
        
        // Profile Tab Bar
        let profile = ProfileViewController(nibName: String(describing: ProfileViewController.self), bundle: nil)
        let profileTab = UINavigationController(rootViewController: profile)
        profileTab.setNavigationBarHidden(true, animated: false)
        let profileImage = UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal) //withRenderingMode: apabila melakukan perubahan warna maka icon juga ikut berubah
        let profileImageSelected = UIImage(named: "Profile_Selected")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(named: "TabBarSelected") ?? UIColor.black)
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, selectedImage: profileImageSelected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBarSelected") ?? UIColor.black], for: .selected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(named: "TabBar") ?? UIColor.lightGray], for: .normal)
        profileTab.tabBarItem.tag = 1
        
//        let impian = MainViewController(nibName: String(describing: MainViewController.self), bundle: nil)
//        let impianTab = UINavigationController(rootViewController: impian)
//        let impianImage = UIImage(named: "Impian")?.withRenderingMode(.alwaysOriginal)
//        let impianImageSelected = UIImage(named: "Impian_Selected")?.withRenderingMode(.alwaysOriginal)
//        impianTab.tabBarItem = UITabBarItem(title: "Impian", image: impianImage, selectedImage: impianImageSelected)
//        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)
//        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.lightGray], for: .normal)
//        impianTab.tabBarItem.tag = 1
//
//        let profile = MainViewController(nibName: String(describing: MainViewController.self), bundle: nil)
//        let profileTab = UINavigationController(rootViewController: profile)
//        let profileImage = UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal)
//        let profileImageSelected = UIImage(named: "Profile_Selected")?.withRenderingMode(.alwaysOriginal)
//        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, selectedImage: profileImageSelected)
//        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)
//        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.lightGray], for: .normal)
//        profileTab.tabBarItem.tag = 2
        
//        self.viewControllers = [homeTab,impianTab,profileTab]
        
        
//        self.tabBar.barTintColor = .white
        self.viewControllers = [homeTab,impianTab,profileTab]
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
