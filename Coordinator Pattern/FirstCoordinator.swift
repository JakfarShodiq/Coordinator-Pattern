//
//  FirstCoordinator.swift
//  Coordinator Pattern
//
//  Created by Muhamad jakfar S on 23/10/22.
//

import UIKit

class FirstCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController: FirstViewController = FirstViewController()
        firstViewController.delegate = self
        self.navigationController.viewControllers = [firstViewController]
    }
}

extension FirstCoordinator: FirstViewControllerDelegate {
    func navigateToNextPage() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        secondCoordinator.delegate = self
        childCoordinator.append(secondCoordinator)
        secondCoordinator.start()
    }
}

extension FirstCoordinator: BackFirstViewControllerDelegate {
    func navigateBactToFirstPage(newOrderCoordinator: SecondCoordinator) {
        navigationController.popViewController(animated: true)
        childCoordinator.removeLast()
    }
}
