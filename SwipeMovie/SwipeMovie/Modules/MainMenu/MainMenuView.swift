//
//  MainMenuView.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 25.11.2023.
//

import UIKit

class MainMenuView: UIView {

// MARK: - Properties
    
    lazy var joinLobbyButton: UIButton = {
        let joinButton = self.configureMainButton(title: "Присоединиться к лобби")
        return joinButton
    }()
    
    lazy var createLobbyButton: UIButton = {
        let createLobbyButton = self.configureMainButton(title: "Cоздать")
        return createLobbyButton
    }()
    
    lazy var joinDecriptionLabel: UILabel = {
        let joinDecriptionLabel = self.configureButtonDescription(
            title: "Подключись к друзьям, чтобы выбрать фильм")
        return joinDecriptionLabel
    }()
    
    lazy var createDecriptionLabel: UILabel = {
        let createDecriptionLabel = self.configureButtonDescription(
            title: "Создай лобби, чтобы выбрать фильм вместе с друзьями")
        return createDecriptionLabel
    }()
    
    private let whiteView: UIView = {
        let whiteView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.backgroundColor = UIColor(named: "swipeMovieWhite")
        whiteView.clipsToBounds = true
        whiteView.layer.cornerRadius = 40
        whiteView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return whiteView
    }()
    
    private let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textColor = UIColor(named: "swipeMovieWhite")
        welcomeLabel.text = "Добро пожаловать в SwipeMovie!"
        return welcomeLabel
    }()
    
    private let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 17.0, *) {
            timeLabel.font = UIFont.preferredFont(forTextStyle: .extraLargeTitle)
        } else {
            timeLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        }
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .center
        timeLabel.textColor = UIColor(named: "swipeMovieBlack")
        timeLabel.text = "Настало время выбрать фильм"
        return timeLabel
    }()
    
// MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Methods
    
    private func configureView() {
        setUpWhiteView()
        setUpWelcomeLabel()
        setUpCreateDiscription()
        setUpCreateButton()
        setUpJoinDescription()
        setUpJoinButton()
        setUpTimeLabel()
    }
    
    private func setUpWhiteView() {
        self.addSubview(whiteView)
        let topConstant = UIScreen.main.bounds.height / 4
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: topConstant),
            whiteView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            whiteView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            whiteView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
    private func setUpWelcomeLabel() {
        self.addSubview(welcomeLabel)
        let topConstant = UIScreen.main.bounds.height / 8 - (welcomeLabel.bounds.height / 2)
        NSLayoutConstraint.activate([
            welcomeLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: topConstant),
            welcomeLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -38),
            welcomeLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 38)
        ])
    }
    
    private func setUpTimeLabel() {
        self.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 60),
            timeLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -41),
            timeLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 41)
        ])
    }
    
    private func configureMainButton(title: String) -> UIButton {
        let mainButton = UIButton()
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.setTitle(title, for: .normal)
        mainButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        mainButton.titleLabel?.adjustsFontForContentSizeCategory = true
        mainButton.tintColor = UIColor(named: "swipeMovieWhite")
        mainButton.backgroundColor = UIColor(named: "swipeMovieBlue")
        mainButton.layer.cornerRadius = 20
        return mainButton
    }
    
    private func setUpJoinButton() {
        self.addSubview(joinLobbyButton)
        NSLayoutConstraint.activate([
            joinLobbyButton.heightAnchor.constraint(equalToConstant: 40),
            joinLobbyButton.bottomAnchor.constraint(equalTo: joinDecriptionLabel.topAnchor, constant: -10),
            joinLobbyButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -36),
            joinLobbyButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 36)
        ])
    }
    
    private func setUpCreateButton() {
        self.addSubview(createLobbyButton)
        NSLayoutConstraint.activate([
            createLobbyButton.bottomAnchor.constraint(equalTo: createDecriptionLabel.topAnchor, constant: -10),
            createLobbyButton.heightAnchor.constraint(equalToConstant: 40),
            createLobbyButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -36),
            createLobbyButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 36)
        ])
    }
    
    private func configureButtonDescription(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "swipeMovieBlack")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = title
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }
    
    private func setUpJoinDescription() {
        self.addSubview(joinDecriptionLabel)
        NSLayoutConstraint.activate([
            joinDecriptionLabel.bottomAnchor.constraint(equalTo: createLobbyButton.topAnchor, constant: -26),
            joinDecriptionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            joinDecriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func setUpCreateDiscription() {
        self.addSubview(createDecriptionLabel)
        NSLayoutConstraint.activate([
            createDecriptionLabel.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                constant: -38),
            createDecriptionLabel.rightAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.rightAnchor,
                constant: -41),
            createDecriptionLabel.leftAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leftAnchor,
                constant: 41)
        ])
    }
}
