//
//  SecondCoordinator.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

class SecondCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("Finish CoordinatorSecondViewController")
    }

    func startCoordinator() {
        let viewController = SecondViewController()
        viewController.delegateCoordinate = self
        viewController.navigationProtocol = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SecondCoordinator: NavigationSecondViewControllerProtocol {
    func goToFourthView() {
        let viewController = FourthViewController()
        viewController.delegateCoordinate = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func back() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}
