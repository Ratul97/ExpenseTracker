//
//  TabBarController.swift
//  ExpenseTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 4/12/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    private var centerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        setupTabBarAppearance()
        setupTabBar()
        setupCenterButton()
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .tertiarySystemBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        centerButton.center = CGPoint(
            x: view.bounds.midX,
            y: tabBar.frame.origin.y
        )
    }
    
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .tertiarySystemBackground
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .orange
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.orange ]
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .label


        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
    }
    
    private func setupTabBar() {
        let homeNavController = setupNavigationBar("Home", UIImage(systemName: "house")!, HomeViewController())
        let statisticsNavController = setupNavigationBar("Statistics", UIImage(systemName: "chart.bar.fill")!, StatisticsViewController())
        let walletNavController = setupNavigationBar("Wallet", UIImage(systemName: "dollarsign.circle")!, WalletViewController())
        let settingsNavController = setupNavigationBar("Settings", UIImage(systemName: "gearshape")!, SettingsViewController())
        
        self.setViewControllers([homeNavController, statisticsNavController, UIViewController(), walletNavController, settingsNavController], animated: true)
        
        viewControllers?[2].tabBarItem.isEnabled = false
        viewControllers?[2].tabBarItem.image = nil
        viewControllers?[2].tabBarItem.title = nil
    }
    
    private func setupNavigationBar(_ title: String, _ image: UIImage, _ viewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.viewControllers.first?.navigationItem.title = title
        return navController
    }
    
    private func setupCenterButton() {
        let size: CGFloat = 64

        centerButton.frame = CGRect(x: 0, y: 0, width: size, height: size)
        centerButton.layer.cornerRadius = size / 2
        centerButton.backgroundColor = .systemOrange
        centerButton.layer.masksToBounds = false

        let img = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .bold))
        centerButton.setImage(img, for: .normal)
        centerButton.tintColor = .white

        view.addSubview(centerButton)
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.firstIndex(where: { $0 === viewController }) else { return false }
        
        if index == 2 {
            return false
        }
        
        return true
    }
}
