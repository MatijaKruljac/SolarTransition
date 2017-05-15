//
//  DetailsViewController.swift
//  SolarTransition
//
//  Created by Matija Kruljac on 1/29/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SolarTransition

class FromViewController: UIViewController {
    
    @IBOutlet weak var startSolarTransitionButton: UIButton!
    @IBOutlet weak var startSolarTransitionButton2: UIButton!
    
    let navigationService: NavigationService!
    
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
        startSolarTransitionButton.backgroundColor = UIColor(red: 0/255, green: 139/255, blue: 204/255, alpha: 1.0)
        startSolarTransitionButton.tintColor = UIColor.white
        startSolarTransitionButton.layer.cornerRadius = startSolarTransitionButton.frame.width / 2
        
        startSolarTransitionButton2.backgroundColor = UIColor(red: 206/255, green: 185/255, blue: 0/255, alpha: 1.0)
        startSolarTransitionButton2.tintColor = UIColor.white
        startSolarTransitionButton2.layer.cornerRadius = startSolarTransitionButton.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "FromViewController"
    }

    @IBAction func startSolarTransitionButtonPressed(_ sender: Any) {
        let solarTransitionAnimator = SolarTransitionAnimator(
            withDuration: TimeInterval(0.3),
            forTransitionType: .presenting,
            originView: startSolarTransitionButton
        )
        let toViewController = ToViewController(
            nibName: "ToViewController",
            navigationService: navigationService
        )
        toViewController.originView = startSolarTransitionButton
        solarTransitionAnimator.present(
            viewController: toViewController,
            inNavigationController: navigationService.navigationController
        )
    }
    
    @IBAction func startSolarTransitionButtonPressed2(_ sender: Any) {
        let solarTransitionAnimator = SolarTransitionAnimator(
            withDuration: TimeInterval(0.5),
            forTransitionType: .presenting,
            originView: startSolarTransitionButton2
        )
        let toViewController2 = ToViewController2(
            nibName: "ToViewController2",
            navigationService: navigationService
        )
        toViewController2.originView = startSolarTransitionButton2
        solarTransitionAnimator.present(
            viewController: toViewController2,
            inNavigationController: navigationService.navigationController
        )
    }
}
