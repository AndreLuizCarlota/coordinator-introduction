//
//  Coordinator.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func startCoordinator()
    func removeChildCoordinator(_ child: Coordinator?)
}

extension Coordinator {
    func removeChildCoordinator(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func startCoordinator() {
        let viewController = ViewController.instantiate()
        viewController.navigationProtocol = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension MainCoordinator: NavigationViewControllerProtocol {
    func goToSecondView() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        childCoordinators.append(secondCoordinator)
        secondCoordinator.parentCoordinator = self
        secondCoordinator.startCoordinator()
    }

    func goToThirdView() {
        let viewController = ThirdViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
