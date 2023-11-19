//
//  ViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 26.10.2023.
//

import UIKit

class MainMenuViewController: UIViewController {
    private enum Constants {
        static let buttonHeight: CGFloat = 50
        static let buttonWidth: CGFloat = 320
        static let titleTextFontSize: CGFloat = 20
        static let marginFromEdges: CGFloat = 16
        }

        private var createLobbyButton: UIButton = {
            let button = UIButton()
            button.setTitle("Создать лобби", for: .normal)
            return button
        }()
        private var enterLobbyButton: UIButton = {
            let button = UIButton()
            button.setTitle("Присоединиться к лобби", for: .normal)
            return button
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            configurePlacements()
            configureColors()
            configureForms()
            configureFunctionality()
        }
        func configurePlacements() {
            view.addSubview(createLobbyButton)
            createLobbyButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(enterLobbyButton)
            enterLobbyButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                createLobbyButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
                createLobbyButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
                createLobbyButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                createLobbyButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                enterLobbyButton.topAnchor.constraint(equalTo: createLobbyButton.bottomAnchor, constant: 30),
                enterLobbyButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
                enterLobbyButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
                enterLobbyButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
        }
        func configureColors() {
            view.backgroundColor = UIColor(named: "swipeMovieWhite")
            createLobbyButton.setTitleColor(.white, for: .normal)
            createLobbyButton.backgroundColor = UIColor(named: "swipeMovieBlue")
            enterLobbyButton.setTitleColor(.white, for: .normal)
            enterLobbyButton.backgroundColor = UIColor(named: "swipeMovieBlue")
        }
        func configureForms() {
            createLobbyButton.layer.cornerRadius = Constants.buttonHeight / 2.0
            enterLobbyButton.layer.cornerRadius = Constants.buttonHeight / 2.0
        }
        func configureFunctionality() {
            createLobbyButton.addTarget(self, action: #selector(createLobbyButtonDidTapped), for: .touchUpInside)
            enterLobbyButton.addTarget(self, action: #selector(enterLobbyButtonDidTapped), for: .touchUpInside)
        }
        @objc func createLobbyButtonDidTapped () {
            let controller = CreateLobbyController()
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
        }
        @objc func enterLobbyButtonDidTapped () {
            let controller = EnterLobbyController()
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
        }

}
