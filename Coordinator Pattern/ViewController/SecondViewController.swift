//
//  SecondViewController.swift
//  Coordinator Pattern
//
//  Created by Muhamad jakfar S on 23/10/22.
//

import UIKit

public protocol SecondViewControllerDelegate: AnyObject {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate?

    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("To Next Page", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SecondVC"
        view.backgroundColor = .lightGray
        
//        let backButton = UIBarButtonItem(title: "Back",
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(navigateBackToFirstPage))
//        navigationItem.leftBarButtonItem = backButton
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])

        button.addTarget(self, action: #selector(navigateToNextPage), for: .touchUpInside)
    }
    
    @objc func navigateBackToFirstPage(sender: UIButton) {
        delegate?.navigateToFirstPage()
    }
    
    @objc func navigateToNextPage(sender: UIButton) {
        delegate?.navigateToThirdPage()
    }
    
    deinit {
        debugPrint(#function, String(describing: self))
    }
}
