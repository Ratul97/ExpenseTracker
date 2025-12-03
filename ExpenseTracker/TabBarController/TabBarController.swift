//
//  TabBarController.swift
//  ExpenseTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 4/12/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                    
        
    }
    
    private func setupTabBar() {
        let homeNavController = setupNavigationBar("Home", UIImage(systemName: "house")!, HomeViewController())
        let settingsNavController = setupNavigationBar("Settings", UIImage(systemName: "gearshape")!, SettingsViewController())
        let statisticsNavController = setupNavigationBar("Statistics", UIImage(systemName: "house")!, StatisticsViewController())
        let walletNavController = setupNavigationBar("Wallet", UIImage(systemName: "dollarsign.circle")!, WalletViewController())
        
        self.setViewControllers([homeNavController, settingsNavController, statisticsNavController, walletNavController], animated: true)
    }
    
    private func setupNavigationBar(_ title: String, _ image: UIImage, _ viewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.viewControllers.first?.navigationItem.title = title
        return navController
    }
}
