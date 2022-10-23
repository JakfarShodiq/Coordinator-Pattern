//
//  Coordinator.swift
//  Coordinator Pattern
//
//  Created by Muhamad jakfar S on 23/10/22.
//

import UIKit

public protocol Coordinator: AnyObject {
    
    var childCoordinator: [Coordinator] { get set }
    
    // All coordinators will be initilised with a navigation controller
    init(navigationController: UINavigationController)
    
    func start()
}
