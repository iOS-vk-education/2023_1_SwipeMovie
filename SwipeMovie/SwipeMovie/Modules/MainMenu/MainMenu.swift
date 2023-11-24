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

        setUpCreateDiscription()
        setUpCreateButton()
        setUpJoinDescription()
        setUpJoinButton()
        setUpTimeLabel()
        print(self.view.frame.width)
    }
    
    func dynamicFontSize(_ FontSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 375 * FontSize
        return calculatedFontSize
    }
    
    lazy var fontsize = dynamicFontSize(32)
    
    func getActualTimeLabelFont() -> CGFloat {
        var fontSize: CGFloat
        // iphone 5s,SE screen width 375
        // iphone 15 screen width 393
        switch self.view.frame.width {
        case 375:
            fontSize = 32
        case 393:
            fontSize = 43
        default:
            fontSize = 32
        }
        return fontSize
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
        let topConstant = self.view.bounds.height / 4
        print(topConstant)
        NSLayoutConstraint.activate([
                        whiteView.topAnchor.constraint(
                            equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: topConstant),
                        whiteView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                        whiteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                        whiteView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
//    func setUpWhiteView() {
//        self.view.addSubview(whiteView)
//        NSLayoutConstraint.activate([
//            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 242),
//            whiteView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            whiteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            whiteView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
//        ])
//    }
    
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
        let topConstant = self.view.bounds.height / 8 - (welcomeLabel.bounds.height / 2)
        NSLayoutConstraint.activate([
            welcomeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant),
            welcomeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -38),
            welcomeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 38)
        ])
    }
    
    let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: , weight: .medium)
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .center
        timeLabel.textColor = UIColor(named: "swipeMovieBlack")
        timeLabel.text = "Настало время выбрать фильм"
        return timeLabel
    }()
    
    func setUpTimeLabel() {
        view.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: -60),
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
            joinLobbyButton.bottomAnchor.constraint(equalTo: joinDecriptionLabel.topAnchor, constant: -10),
            joinLobbyButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -36),
            joinLobbyButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 36)
        ])
    }
    
    func setUpCreateButton() {
        view.addSubview(createLobbyButton)
        NSLayoutConstraint.activate([
            createLobbyButton.bottomAnchor.constraint(equalTo: createDecriptionLabel.topAnchor, constant: -10),
            createLobbyButton.heightAnchor.constraint(equalToConstant: 40),
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
        let joinDecriptionLabel = self.configureButtonDescription(
            title: "Подключись к друзьям, чтобы выбрать фильм")
        return joinDecriptionLabel
    }()
    
    lazy var createDecriptionLabel: UILabel = {
        let createDecriptionLabel = self.configureButtonDescription(
            title: "Создай лобби, чтобы выбрать фильм вместе с друзьями")
        return createDecriptionLabel
    }()
    
    func setUpJoinDescription() {
        view.addSubview(joinDecriptionLabel)
        NSLayoutConstraint.activate([
            joinDecriptionLabel.bottomAnchor.constraint(equalTo: createLobbyButton.topAnchor, constant: -26),
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
            createDecriptionLabel.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -38),
            createDecriptionLabel.rightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.rightAnchor,
                constant: -41),
            createDecriptionLabel.leftAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor,
                constant: 41)
        ])
    }
    
}
