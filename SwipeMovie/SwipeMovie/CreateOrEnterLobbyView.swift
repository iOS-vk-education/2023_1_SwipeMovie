//
//  CreateOrEnterLobbyView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.11.2023.
//

import Foundation
import UIKit

class CreateLobbyView: UIView {
    var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "swipeMovieWhite")
        label.font = UIFont.systemFont(ofSize: ConstantsMain.mainLabelFontSize, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var foregroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForWhiteForegroundView.cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var bottomButton = UIButton()
    var nameTextField = UITextField()
    var lobbyTextField = UITextField()
    var nameTextFieldButton = UIButton()
    var lobbyTextFieldButton = UIButton()
    var nameStack = UIStackView()
    var lobbyStack = UIStackView()
    var createBottomButtonBottomConstraint: NSLayoutConstraint?
    init(frame: CGRect, type: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        if type == "create" {
            setForegroundView(bottomTitle: "Введите название лобби",
                              bottomPlaceHolder: "Название",
                              buttonTitle: "Создать")
            topLabel.text = "Создать лобби"
        } else if type == "enter" {
            setForegroundView(bottomTitle: "Введите код лобби",
                              bottomPlaceHolder: "******",
                              buttonTitle: "Присоединиться")
            topLabel.text = "Присоединиться к лобби"
        } else {
            setForegroundView()
            topLabel.text = "Error"
        }
        setCreateLobbyLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setForegroundView(bottomTitle: String = "Error",
                                   bottomPlaceHolder: String = "Error",
                                   buttonTitle: String = "Error") {
        self.addSubview(foregroundView)
        nameStack = getTextView(textField: nameTextField,
                                title: "Введите Ваше имя",
                                placeholder: "Имя",
                                button: nameTextFieldButton)
        lobbyStack = getTextView(textField: lobbyTextField,
                                 title: bottomTitle,
                                 placeholder: bottomPlaceHolder,
                                 button: lobbyTextFieldButton)
        foregroundView.addSubview(nameStack)
        foregroundView.addSubview(lobbyStack)
        nameStack.translatesAutoresizingMaskIntoConstraints = false
        lobbyStack.translatesAutoresizingMaskIntoConstraints = false
        bottomButton = getButton(title: buttonTitle,
                                      size: "small")
        foregroundView.addSubview(bottomButton)
        NSLayoutConstraint.activate([
            foregroundView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            foregroundView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nameStack.topAnchor.constraint(equalTo: foregroundView.topAnchor,
                                           constant: ConstantsForWhiteForegroundView.cornerRadius / 2),
            lobbyStack.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                constant: ConstantsMain.marginFromSides),
            nameStack.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            lobbyStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor,
                                            constant: ConstantsForTextFields.spaceBetweenTextFieldsWithLabels),
            lobbyStack.leadingAnchor.constraint(equalTo: nameStack.leadingAnchor),
            lobbyStack.centerXAnchor.constraint(equalTo: nameStack.centerXAnchor),
            bottomButton.topAnchor.constraint(equalTo: lobbyStack.bottomAnchor,
                                              constant: ConstantsForTextFields.spaceBetweenTextFieldsWithLabels),
            bottomButton.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor)
        ])
        createBottomButtonBottomConstraint =
                                bottomButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                                     constant: ConstantsMain.bottomIndent)
        createBottomButtonBottomConstraint?.isActive = true
    }
    private func setCreateLobbyLabel() {
        self.addSubview(topLabel)
        let dimensionBefore = self.safeAreaLayoutGuide.topAnchor.anchorWithOffset(to: topLabel.centerYAnchor)
        let dimensionAfter = topLabel.centerYAnchor.anchorWithOffset(to: foregroundView.topAnchor)
        NSLayoutConstraint.activate([
            dimensionBefore.constraint(equalTo: dimensionAfter),
            topLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            topLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                              constant: ConstantsMain.marginFromSides)
        ])
    }
}
