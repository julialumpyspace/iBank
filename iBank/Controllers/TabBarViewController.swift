//
//  TabBarViewController.swift
//  iBank
//
//  Created by Юлія Воробей on 22.04.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.tabBar.tintColor = UIColor(named: "Maize")
        self.tabBar.unselectedItemTintColor = UIColor(named: "BattleshipGray")
        
        UITabBar.appearance().isTranslucent = false
        UINavigationBar.appearance().isTranslucent = false

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "Night")
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
            
            
            let appearance1 = UINavigationBarAppearance()
            appearance1.configureWithOpaqueBackground()
            appearance1.backgroundColor = UIColor(named: "Night")
            UINavigationBar.appearance().standardAppearance = appearance1
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
            
        }
        
    }
    
    
    private func setupTabs() {
        let views = self.getTabViews()
        self.setViewControllers(views, animated: false)
    }

    private func setupNavBar(title: String?, nav: UINavigationController) {
        if title != nil {
            nav.viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward")!, title: title!, target: nil, action: nil)
        }
    }
    
    private func getTabViews() -> [UINavigationController] {
        let home = self.createNav(
            with: nil,
            and: UIImage(systemName: "house")!,
            vc: HomeController())
        
        
        let cards = self.createNav(
            with: "My cards",
            and: UIImage(systemName: "creditcard")!,
            vc: MyCardsViewController())
        
        
        let recent = self.createNav(
            with: "Recent Transactions",
            and: UIImage(systemName: "wallet.pass")!,
            vc: RecentTransactionsViewController())
        
        let transfer = self.createNav(
            with: "Transfer money",
            and: UIImage(systemName: "banknote")!,
            vc: TransferViewController())
        
        let account = self.createNav(
            with: "Account",
            and: UIImage(systemName: "person")!,
            vc: AccountViewController())
        
        return [home, cards, recent, transfer, account]
    }
    
    private func createNav(with title: String?, and image: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        
        setupNavBar(title: title, nav: nav)
        return nav
    }
    
    
}


extension UIBarButtonItem {
    convenience init(image :UIImage, title :String, target: Any?, action: Selector?) {
        let button = UIButton(type: .custom)
        button.tintColor = UIColor(named: "Isabelline")

        var config = UIButton.Configuration.plain()
        config.image = image
        config.title = title
        config.imagePadding = 25
        button.configuration = config

        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }

        self.init(customView: button)
    }
}
