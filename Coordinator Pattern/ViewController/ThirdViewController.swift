//
//  ThirdViewController.swift
//  Coordinator Pattern
//
//  Created by Muhamad jakfar S on 23/10/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    public weak var delegate: SecondViewControllerDelegate?
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("navigateToFirstPage", for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ThirdVC"
        view.backgroundColor = .cyan
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])

        button.addTarget(self, action: #selector(navigateToFirstPageAction), for: .touchUpInside)
    }
    
    @objc func navigateToFirstPageAction(sender: UIButton) {
        delegate?.navigateToFirstPage()
    }
    
    deinit {
        debugPrint(#function, String(describing: self))
    }

}
