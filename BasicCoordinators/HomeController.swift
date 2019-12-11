//
//  HomeController.swift
//  BasicCoordinators
//
//  Created by Nursultan on 12.12.2019.
//  Copyright © 2019 Nursultan Askarbekuly. All rights reserved.
//

import UIKit

class HomeController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    @IBAction func greetTapped(_ sender: Any) {
        coordinator?.greet()
    }
    
    @IBAction func farewellTapped(_ sender: Any) {
        coordinator?.sayFarewell()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

