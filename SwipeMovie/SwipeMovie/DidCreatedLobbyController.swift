//
//  DidCreatedLobbyController.swift
//  SwipeMovie
//
//  Created by Александр Бобрун on 10.11.2023.
//

import Foundation
import UIKit

class DidCreatedLobbyView: UIView {
    // constants
    private enum ConstantsForTopTitle {
        static let titleFontSize: CGFloat = ConstantsMain.mainLabelFontSize
        static let subtitleFontSize: CGFloat = 22
        static let codeFontSize = subtitleFontSize
        static let spaceBetweenTitleAndSubtitle: CGFloat = 10
        static let marginFromBorders: CGFloat = 16
        static let spaceBetweenTextAndButtom: CGFloat = 12
        static let heightOfCodeView: CGFloat = 30
    }
    // properties
    var codeShareButton = UIButton()
    var foregroundView = UIView()
    var bottomButton = UIButton()
    var guestsListButton = UIButton()
    // methods
    init(frame: CGRect, lobbyName: String, lobbyCode: String, type: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        setForegroundView(areGuestsReady: true, numberOfGuests: 1, type: "create")
        setTopView(lobbyName: lobbyName, lobbyCode: lobbyCode)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // function of setting up white foreground of this view and it's constraints
    private func setForegroundView(areGuestsReady: Bool = true, numberOfGuests: Int = 0, type: String = "create") {
        foregroundView = getForegroundView()
        foregroundView.layer.borderColor = UIColor(named: "swipeMovieBlue")?.cgColor
        foregroundView.layer.borderWidth = ConstantsForWhiteForegroundView.borderWidth
        foregroundView.layer.cornerRadius += foregroundView.layer.borderWidth
        self.addSubview(foregroundView)
        bottomButton = getButton(title: "Начать",
                                 size: "small")
        bottomButton.isEnabled = false
        bottomButton.backgroundColor = .systemGray
        foregroundView.addSubview(bottomButton)
        let captionLable = getCaptionLabel(text: "Пока все гости не будут готовы, \n Вы не сможете начать")
        // let captionLable = getCaptionLabel(text: "Все гости готовы, \n Вы можете начать")
        foregroundView.addSubview(captionLable)
        let guestsNumberLabel = getGuestsNumberLabel(numberOfGuests: numberOfGuests)
        foregroundView.addSubview(guestsNumberLabel)
        guestsListButton = getGuestsListButton()
        foregroundView.addSubview(guestsListButton)
        NSLayoutConstraint.activate([
            foregroundView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                                 constant: -foregroundView.layer.borderWidth),
            foregroundView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: foregroundView.layer.borderWidth),
            bottomButton.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            guestsNumberLabel.bottomAnchor.constraint(equalTo: foregroundView.topAnchor,
                                                      constant: ConstantsForWhiteForegroundView.cornerRadius + ConstantsForWhiteForegroundView.borderWidth),
            guestsNumberLabel.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                       constant: ConstantsForWhiteForegroundView.cornerRadius),
            guestsNumberLabel.bottomAnchor.constraint(equalTo: captionLable.topAnchor,
                                                      constant: -3 * ConstantsForWhiteForegroundView.spaceBetweenCaptionAndElements),
            guestsListButton.centerYAnchor.constraint(equalTo: guestsNumberLabel.centerYAnchor),
            guestsListButton.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor,
                                                       constant: -ConstantsForWhiteForegroundView.cornerRadius),
            captionLable.bottomAnchor.constraint(equalTo: bottomButton.topAnchor,
                                                 constant: -ConstantsForWhiteForegroundView.spaceBetweenCaptionAndElements),
            captionLable.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            captionLable.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                  constant: ConstantsMain.marginFromSides)
        ])
    }
    private func getGuestsNumberLabel(numberOfGuests: Int) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(named: "swipeMovieBlack")
        label.font = UIFont.systemFont(ofSize: ConstantsForWhiteForegroundView.textFontSize, weight: .medium)
        label.text = "Гости - \(numberOfGuests)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private func getGuestsListButton() -> UIButton {
        let button = UIButton()
        button.tintColor = .systemBlue
        button.setTitle("Посмотреть", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ConstantsForWhiteForegroundView.buttonTextFontSize, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    private func setTopView(lobbyName: String, lobbyCode: String) {
        let topView: UIView = {
            let view = UIView()
            let titlelabel = getTitleLabel(titleText: lobbyName)
            let subtitleLabel = getSubtitleLabel(subtitleText: "Код лобби:")
            let codeView = getCodeView(lobbyCode: lobbyCode)
            view.addSubview(titlelabel)
            view.addSubview(subtitleLabel)
            view.addSubview(codeView)
            NSLayoutConstraint.activate([
                titlelabel.topAnchor.constraint(equalTo: view.topAnchor),
                titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                subtitleLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor,
                                                   constant: ConstantsForTopTitle.spaceBetweenTitleAndSubtitle),
                subtitleLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor,
                                                        constant: -ConstantsForTopTitle.marginFromBorders),
                codeView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
                codeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                codeView.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor)
            ])
            return view
        }()
        self.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        let dimensionBefore = self.safeAreaLayoutGuide.topAnchor.anchorWithOffset(to: topView.centerYAnchor)
        let dimensionAfter = topView.centerYAnchor.anchorWithOffset(to: foregroundView.topAnchor)
        NSLayoutConstraint.activate([
            dimensionBefore.constraint(equalTo: dimensionAfter),
            topView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            topView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                              constant: ConstantsMain.marginFromSides)
        ])
    }
    private func getTitleLabel(titleText: String = "error") -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(named: "swipeMovieWhite")
        label.font = UIFont.systemFont(ofSize: ConstantsForTopTitle.titleFontSize, weight: .bold)
        label.text = titleText
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private func getSubtitleLabel(subtitleText: String = "error") -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(named: "swipeMovieWhite")
        label.font = UIFont.systemFont(ofSize: ConstantsForTopTitle.subtitleFontSize, weight: .regular)
        label.text = subtitleText
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private func getCodeView(lobbyCode: String = "000000") -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForTopTitle.heightOfCodeView / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        let codeLabel = getSubtitleLabel(subtitleText: lobbyCode)
        codeLabel.textColor = .systemBlue
        view.addSubview(codeLabel)
        codeShareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        codeShareButton.tintColor = .systemBlue
        codeShareButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(codeShareButton)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: ConstantsForTopTitle.heightOfCodeView),
            codeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: ConstantsForTopTitle.marginFromBorders),
            codeShareButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeShareButton.leadingAnchor.constraint(equalTo: codeLabel.trailingAnchor,
                                            constant: ConstantsForTopTitle.spaceBetweenTextAndButtom),
            codeShareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -ConstantsForTopTitle.heightOfCodeView / 2.0)
        ])
        return view
    }
}








final class DidCreatedLobbyController: UIViewController {
    var didCreatedLobbyView = DidCreatedLobbyView(frame: UIScreen.main.bounds,
                                                  lobbyName: "Название лобби",
                                                  lobbyCode: "123456",
                                                  type: "create")
    override func loadView() {
        self.view = didCreatedLobbyView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        didCreatedLobbyView.bottomButton.addTarget(self,
                                                   action: #selector(startButtonDidTapped),
                                                   for: .touchUpInside)
    }
    @objc func startButtonDidTapped() {
        print("started")
    }
}
