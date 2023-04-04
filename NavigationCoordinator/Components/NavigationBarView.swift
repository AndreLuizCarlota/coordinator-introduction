//
//  NavigationBarView.swift
//  NavigationCoordinator
//
//  Created by Andre Luiz Carlota on 3/28/23.
//

import UIKit

protocol NavigationBarViewProtocol: AnyObject {
    func buttonBackAction()
}

class NavigationBarView: UIView {
    weak var delegate: NavigationBarViewProtocol?

    let buttonBack: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.imagePadding = 5

        let button = UIButton(configuration: buttonConfig)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)

        return button
    }()

    let textTitle: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(textTitle)
        addSubview(buttonBack)

        buttonBack.addTarget(self, action: #selector(setButtonBackAction), for: .touchDown)
    }

    private func setupConstraints() {
        guard let superview = superview else { return }

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: superview.widthAnchor),
            heightAnchor.constraint(equalToConstant: 50.0),
            buttonBack.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            textTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            textTitle.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    override func layoutSubviews() {
        setupConstraints()
    }

    @objc func setButtonBackAction() {
        delegate?.buttonBackAction()
    }
}
