//
//  FromViewController2.swift
//  SolarTransition
//
//  Created by Matija Kruljac on 2/1/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SolarTransition

class ToViewController2: UIViewController, SolarTransitionOriginProtocol {
    
    @IBOutlet weak var closeSolarTransitionButton: UIButton!
    
    let navigationService: NavigationService!
    
    var originView: UIView?
    
    init(nibName: String, navigationService: NavigationService) {
        self.navigationService = navigationService
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.navigationService = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 206/255, green: 185/255, blue: 0/255, alpha: 1.0)
        closeSolarTransitionButton.tintColor = UIColor.white
    }
    
    @IBAction func closeSolarTransitionButtonPressed(_ sender: Any) {
        guard let originView = originView else { return }
        let solarTransitionAnimator = SolarTransitionAnimator(
            withDuration: TimeInterval(0.5),
            forTransitionType: .dismissing,
            originView: originView
        )
        solarTransitionAnimator.dismiss(
            viewController: self,
            inNavigationController: navigationService.navigationController
        )
    }
    
}
