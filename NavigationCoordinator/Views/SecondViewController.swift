//
//  SecondViewController.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

protocol NavigationSecondViewControllerProtocol: AnyObject {
    func goToFourthView()
    func back()
}

class SecondViewController: UIViewController {

    weak var delegateCoordinate: SecondCoordinator?
    weak var navigationProtocol: NavigationSecondViewControllerProtocol?

    let label: UILabel = {
        let label = UILabel()
        label.text = "SecondView"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FourthView", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
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
        view.addSubview(button)

        button.addTarget(self, action: #selector(didTapFouthView), for: .touchDown)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30.0),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }


    @objc func didTapFouthView() {
        navigationProtocol?.goToFourthView()
    }
}

extension SecondViewController: NavigationBarViewProtocol {
    func buttonBackAction() {
        navigationController?.popViewController(animated: true)
        navigationProtocol?.back()
    }
}
