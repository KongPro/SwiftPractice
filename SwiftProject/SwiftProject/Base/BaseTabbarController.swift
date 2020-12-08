//
//  BaseTabbarController.swift
//  SwiftProject
//
//  Created by KONG on 2020/12/8.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nav1 : UINavigationController = UINavigationController(rootViewController: KHomeViewController())
        nav1.title = "item1"
        let nav2 : UINavigationController = UINavigationController(rootViewController: KTimeLineViewController())
        nav2.title = "item2"
        let nav3 : UINavigationController = UINavigationController(rootViewController: KCollegeViewController())
        nav3.title = "item3"
        let nav4 : UINavigationController = UINavigationController(rootViewController: KProfileViewController())
        nav4.title = "item4"
        
        self.addChild(nav1);
        self.addChild(nav2);
        self.addChild(nav3);
        self.addChild(nav4);
    }

}
