//
//  NavigationService.swift
//  SolarTransition
//
//  Created by Matija Kruljac on 1/29/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class NavigationService {
    
    let navigationController = UINavigationController()
    
    func pushInitialViewControllerIn(window: UIWindow) {
        let contentViewController = ContentViewController(
            nibName: "ContentViewController",
            navigationService: self
        )
        navigationController.viewControllers = [contentViewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func pushFromViewController() {
        let fromViewController = FromViewController(nibName: "FromViewController", navigationService: self)
        navigationController.pushViewController(fromViewController, animated: true)
    }
    
}
