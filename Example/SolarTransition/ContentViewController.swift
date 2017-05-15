//
//  ViewController.swift
//  SolarTransition
//
//  Created by Matija Kruljac on 01/29/2017.
//  Copyright (c) 2017 Matija Kruljac. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var detailsViewControllerButton: UIButton!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "SolarTransition"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
    }
    
    @IBAction func detailsViewControllerButtonPressed(_ sender: Any) {
        navigationService.pushFromViewController()
    }
    
}

