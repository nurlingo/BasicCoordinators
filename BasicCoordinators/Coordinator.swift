//
//  Coordinator.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
