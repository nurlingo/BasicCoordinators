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
    
    var childCoordinators = [String:Coordinator]()
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
    
    func childDidFinish(_ childId: String) {
        childCoordinators.removeValue(forKey: childId)
    }
    
    func greet() {
        let child = GreetingCoordinator(navigationController: navigationController)
        childCoordinators[String(describing: child.self)] = child
        child.start()
    }
    
    func sayFarewell() {
        let child = FarewellCoordinator(navigationController: navigationController)
        childCoordinators[String(describing: child.self)] = child
        child.start()
    }
        
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        guard let childVC = fromViewController as? Storyboarded, let coordinator = childVC.coordinator else { return }
        
        childDidFinish(String(describing: coordinator))
        
    }

}
