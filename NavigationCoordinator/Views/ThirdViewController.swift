//
//  ThirdViewController.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

class ThirdViewController: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.text = "ThirdView"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let navigationBar: NavigationBarView = {
        let navigation = NavigationBarView()
        navigation.translatesAutoresizingMaskIntoConstraints = false

        return navigation
    }()

    override func viewDidLoad() {
        setupView()
        setupConstraints()

        navigationBar.delegate = self
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(navigationBar)
        view.addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ThirdViewController: NavigationBarViewProtocol {
    func buttonBackAction() {
        navigationController?.popViewController(animated: true)
    }
}
