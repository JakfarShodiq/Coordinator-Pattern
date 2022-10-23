//
//  FirstViewController.swift
//  Coordinator Pattern
//
//  Created by Muhamad jakfar S on 23/10/22.
//

import UIKit

public protocol FirstViewControllerDelegate: AnyObject {
    func navigateToNextPage()
}

class FirstViewController: UIViewController {
    
    weak var delegate: FirstViewControllerDelegate?
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("navigateToNextPage", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstVC"
        view.backgroundColor = .orange
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])

        button.addTarget(self, action: #selector(navigateToNextPage), for: .touchUpInside)
    }
    
    @objc func navigateToNextPage(sender: UIButton) {
        delegate?.navigateToNextPage()
    }
    
    deinit {
        debugPrint(#function, String(describing: self))
    }
    
}
