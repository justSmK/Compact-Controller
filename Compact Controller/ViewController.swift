//
//  ViewController.swift
//  Compact Controller
//
//  Created by Sergei Semko on 5/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        var configuration = UIButton.Configuration.borderless()
        configuration.buttonSize = .medium
        button.configuration = configuration
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        setConstraints()
    }

    @objc private func buttonTapped() {
        let vc = CompactViewController()
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 300, height: 280)
        
        guard let popoverPresentationController = vc.popoverPresentationController else {
            return
        }
        
        popoverPresentationController.permittedArrowDirections = .up
        popoverPresentationController.sourceView = view
        popoverPresentationController.sourceRect = button.frame
        popoverPresentationController.delegate = self
        
        present(vc, animated: true)
    }

}

extension ViewController {
    private func setConstraints() {
        view.addSubview(button)
        
        let constraints: [NSLayoutConstraint] = [
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
