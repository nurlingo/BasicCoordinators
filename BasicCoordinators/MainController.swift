//
//  HomeController.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import UIKit

class MainController: UIViewController, Storyboarded {

    weak var coordinator: Coordinator?
    
    @IBAction func greetTapped(_ sender: Any) {
        guard let coordinator = coordinator as? MainCoordinator else { return }
        coordinator.greet()
    }
    
    @IBAction func farewellTapped(_ sender: Any) {
        guard let coordinator = coordinator as? MainCoordinator else { return }
        coordinator.sayFarewell()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

