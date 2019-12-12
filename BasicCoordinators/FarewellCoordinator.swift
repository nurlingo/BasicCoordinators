//
//  FarewellCoordinator.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import UIKit

class FarewellCoordinator: Coordinator {
    var childCoordinators = [String:Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = FarewellController.instantiate()
        vc.title = "Farewell"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}


