//
//  FarewellCoordinator.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import UIKit

class FarewellCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
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
    
    func didFinishSayingFarewell() {
        parentCoordinator?.childDidFinish(self)
    }
    
}


