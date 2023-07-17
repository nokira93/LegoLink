//
//  TabBarController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 06/07/2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.tabBar.backgroundColor = Colors.backgroundTaBarColor
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .white

    }
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: SetsViewController())
        let scanner = self.createNav(with: "Scanner", and: UIImage(systemName: "barcode.viewfinder"), vc: ScanerViewController())
        let personal = self.createNav(with: "Personal Info", and: UIImage(systemName: "person"), vc: PersonalViewController())
        let map = self.createNav(with: "Near Shop", and: UIImage(systemName: "map"), vc: MapViewController())
        self.setViewControllers([home, scanner, map, personal], animated: true)
    }
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: nil, action: nil)
        return nav
    }
}
