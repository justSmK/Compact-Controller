//
//  CompactViewController.swift
//  Compact Controller
//
//  Created by Sergei Semko on 5/14/23.
//

import Foundation
import UIKit

class CompactViewController: UIViewController {
    
    private let width = 300
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "280pt", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "150pt", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setConstraints()
    }
    
    @objc private func buttonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func segmentedControlTapped(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            preferredContentSize = CGSize(width: width, height: 280)
        case 1:
            preferredContentSize = CGSize(width: width, height: 150)
        default:
            return
        }
    }
    
}

extension CompactViewController {
    private func setConstraints() {
        view.addSubview(button)
        
        let constraintsButton: [NSLayoutConstraint] = [
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraintsButton)
        
        
        view.addSubview(segmentedControl)
        
        let constraintsSegmentedControl: [NSLayoutConstraint] = [
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraintsSegmentedControl)
    }
}
