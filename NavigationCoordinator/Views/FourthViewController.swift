//
//  FourthViewController.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

class FourthViewController: UIViewController {

    weak var delegateCoordinate: SecondCoordinator?

    let label: UILabel = {
        let label = UILabel()
        label.text = "FourthView"
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

extension FourthViewController: NavigationBarViewProtocol {
    func buttonBackAction() {
        delegateCoordinate?.back()
//        navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
}
