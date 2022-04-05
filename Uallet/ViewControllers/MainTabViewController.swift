//
//  MainTabViewController.swift
//  Uallet
//
//  Created by Lucia Baez on 30/03/2022.
//

import UIKit

class MainTabViewController: UITabBarController { //hereda de tab bar controller (el tab bar hereda de view controller)

    override func loadView() {  //nosotros cargamos la vista, al implementar el metodo sobreescribimos un XIB
        super.loadView()
        
        let homeVC = HomeViewController()
        homeVC.title = "Home"
        let homeIcono = UIImage(systemName: "house.fill")
        let homeNavigationVC = UINavigationController(rootViewController: homeVC)
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: homeIcono, selectedImage: nil)

        let dashboardVC = DashboardViewController()
        dashboardVC.title = "Dashboard"
        let dashboardNavigationVC = UINavigationController(rootViewController: dashboardVC)
        let dashboardIcono = UIImage(systemName: "chart.pie.fill")
        dashboardVC.tabBarItem = UITabBarItem(title: "Dashboard", image: dashboardIcono, selectedImage: nil)
        
        let infoVC = InfoViewController()
        infoVC.title = "Info"
        let infoNavigationVC = UINavigationController(rootViewController: infoVC)
        let infoIcono = UIImage(systemName: "info.circle.fill")
        infoVC.tabBarItem = UITabBarItem(title: "Info", image: infoIcono, selectedImage: nil)
        
        let walletsVC = WalletsViewController()
        walletsVC.title = "Wallets"
        let walletsNavigationVC = UINavigationController(rootViewController: walletsVC)
        let walletsIcono = UIImage(systemName: "dollarsign.circle.fill")
        walletsVC.tabBarItem = UITabBarItem(title: "Wallets", image: walletsIcono, selectedImage: nil)
        
        self.viewControllers = [homeNavigationVC, dashboardNavigationVC, infoNavigationVC, walletsNavigationVC]
        self.tabBar.tintColor = UIColor(named: "TintaTabs") //del assets que creamos sacamos el color TintaTabs
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
}

  

