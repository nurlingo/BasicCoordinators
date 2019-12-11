//
//  MainCoordinator.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func greet() {
        let vc = GreetingController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func sayFarewell() {
        let vc = FarewellController.instantiate()
        vc.title = "Farewell"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
