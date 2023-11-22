//
//  ViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 26.10.2023.
//

import UIKit

class MainMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        setUpWhiteView()
        setUpWelcomeLabel()
        setUpTimeLabel()
        setUpJoinButton()
        setUpJoinDescription()
        setUpCreateButton()
        setUpCreateDiscription()
    }
    
    let whiteView: UIView = {
        let whiteView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.backgroundColor = UIColor(named: "swipeMovieWhite")
        whiteView.clipsToBounds = true
        whiteView.layer.cornerRadius = 40
        whiteView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return whiteView
    }()
    
    func setUpWhiteView() {
        self.view.addSubview(whiteView)
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 242),
            whiteView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            whiteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            whiteView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
    let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textColor = UIColor(named: "swipeMovieWhite")
        welcomeLabel.text = "Добро пожаловать в SwipeMovie!"
        return welcomeLabel
    }()
    
    func setUpWelcomeLabel() {
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 89),
            welcomeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -38),
            welcomeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 38)
        ])
    }
    
    let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 43, weight: .medium)
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .center
        timeLabel.textColor = UIColor(named: "swipeMovieBlack")
        timeLabel.text = "Настало время выбрать фильм"
        return timeLabel
    }()
    
    func setUpTimeLabel() {
        view.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 48),
            timeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -41),
            timeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 41)
        ])
    }
    
    func configureMainButton(title: String) -> UIButton {
        var mainButton = UIButton()
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.setTitle(title, for: .normal)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        mainButton.tintColor = UIColor(named: "swipeMovieWhite")
        mainButton.backgroundColor = UIColor(named: "swipeMovieBlue")
        mainButton.layer.cornerRadius = 20
        return mainButton
    }
    
    lazy var joinLobbyButton: UIButton = {
        let joinButton = self.configureMainButton(title: "Присоединиться к лобби")
        joinButton.addTarget(self, action: #selector(joinButtonDidTapped), for: .allTouchEvents)
        return joinButton
    }()
    
    @objc
    func joinButtonDidTapped() {
        //
    }
    
    lazy var createLobbyButton: UIButton = {
        let createLobbyButton = self.configureMainButton(title: "Cоздать")
        createLobbyButton.addTarget(self, action: #selector(createLobbyButtonDidTapped), for: .allTouchEvents)
        return createLobbyButton
    }()
    
    @objc
    func createLobbyButtonDidTapped() {
        //
    }
    
    func setUpJoinButton() {
        view.addSubview(joinLobbyButton)
        NSLayoutConstraint.activate([
            joinLobbyButton.heightAnchor.constraint(equalToConstant: 40),
            joinLobbyButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 60),
            joinLobbyButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -36),
            joinLobbyButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 36)
        ])
    }
    
    func setUpCreateButton() {
        view.addSubview(createLobbyButton)
        NSLayoutConstraint.activate([
            createLobbyButton.heightAnchor.constraint(equalToConstant: 40),
            createLobbyButton.topAnchor.constraint(equalTo: joinDecriptionLabel.bottomAnchor, constant: 32),
            createLobbyButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -36),
            createLobbyButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 36)
        ])
    }
    
    func configureButtonDescription(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "swipeMovieBlack")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = title
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }
    
    lazy var joinDecriptionLabel: UILabel = {
        let joinDecriptionLabel = self.configureButtonDescription(title: "Подключись к друзьям, чтобы выбрать фильм")
        return joinDecriptionLabel
    }()
    
    lazy var createDecriptionLabel: UILabel = {
        let createDecriptionLabel = self.configureButtonDescription(title: "Создай лобби, чтобы выбрать фильм вместе с друзьями")
        return createDecriptionLabel
    }()
    
    func setUpJoinDescription() {
        view.addSubview(joinDecriptionLabel)
        NSLayoutConstraint.activate([
            joinDecriptionLabel.topAnchor.constraint(equalTo: joinLobbyButton.bottomAnchor, constant: 8),
            joinDecriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            joinDecriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    lazy var createDescriptionLabel: UILabel = {
        let joinDescriptionLabel = self.configureButtonDescription(
            title: "Создай лобби, чтобы выбрать фильм вместе с друзьями")
        return joinDescriptionLabel
    }()
    
    func setUpCreateDiscription() {
        view.addSubview(createDecriptionLabel)
        NSLayoutConstraint.activate([
            createDecriptionLabel.topAnchor.constraint(equalTo: createLobbyButton.bottomAnchor, constant: 8),
            createDecriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -41),
            createDecriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 41)
        ])
    }
    
}
