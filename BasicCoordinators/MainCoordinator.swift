//
//  MainCoordinator.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = HomeController.instantiate()
        vc.title = "Home"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        
        for (index, coordinator) in
            childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
        
    }
    
    func greet() {
        let child = GreetingCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func sayFarewell() {
        let child = FarewellCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
        
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let childVC = fromViewController as? GreetingController {
            childDidFinish(childVC.coordinator)
        } else if let childVC = fromViewController as? FarewellController {
            childDidFinish(childVC.coordinator)
        }
        
    }

}
