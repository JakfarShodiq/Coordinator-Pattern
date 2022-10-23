//
//  SecondCoordinator.swift
//  Coordinator Pattern
//
//  Created by Muhamad jakfar S on 23/10/22.
//

import UIKit

protocol BackFirstViewControllerDelegate: AnyObject {
    func navigateBactToFirstPage(newOrderCoordinator: SecondCoordinator)
}

class SecondCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    unowned let navigationController: UINavigationController
    
    // we use this delefate to keep a reference to the paren coordinator
    weak var delegate: BackFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController: SecondViewController = SecondViewController()
        secondViewController.delegate = self
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension SecondCoordinator: SecondViewControllerDelegate {
    func navigateToThirdPage() {
        let thirdVC = ThirdViewController()
        thirdVC.delegate = self
        self.navigationController.pushViewController(thirdVC, animated: true)
    }
    
    func navigateToFirstPage() {
        self.delegate?.navigateBactToFirstPage(newOrderCoordinator: self)
    }
}
