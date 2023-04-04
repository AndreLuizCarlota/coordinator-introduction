//
//  ViewController.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

protocol NavigationViewControllerProtocol: AnyObject {
    func goToSecondView()
    func goToThirdView()
}

class ViewController: UIViewController {

    weak var navigationProtocol: NavigationViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSecondView(_ sender: Any) {
        navigationProtocol?.goToSecondView()
    }

    @IBAction func didTapThirdView(_ sender: Any) {
        navigationProtocol?.goToThirdView()
    }
}

