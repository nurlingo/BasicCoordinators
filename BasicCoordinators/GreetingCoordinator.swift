//
//  GreetingCoordinator.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import UIKit

class GreetingCoordinator: Coordinator {
    var childCoordinators = [String:Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = GreetingController.instantiate()
        vc.title = "Greeting"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
