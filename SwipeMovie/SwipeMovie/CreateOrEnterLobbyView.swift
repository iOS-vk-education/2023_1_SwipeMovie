//
//  CreateOrEnterLobbyView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.11.2023.
//

import Foundation
import UIKit

class CreateLobbyView: UIView {
    // constants
    private enum ConstantsForTextFields {
        static let height: CGFloat = 44
        static let width: CGFloat = 353
        static let borderWidth: CGFloat = 2
        static let fontSize: CGFloat = 17
        static let labelFontSize: CGFloat = 22
        static let margingFromBorder: CGFloat = 32
        static let spaceUnderLabel: CGFloat = 12
        static let cornerRadius: CGFloat = 20
        static let fullHeight: CGFloat = height + spaceUnderLabel + labelFontSize
        static let spaceBetweenTextFieldsWithLabels: CGFloat = 26
    }
    // properties
    var topLabel = UILabel()
    var foregroundView = UIView()
    var bottomButton = UIButton()
    var nameTextField = UITextField()
    var lobbyTextField = UITextField()
    var nameTextFieldButton = UIButton()
    var lobbyTextFieldButton = UIButton()
    var nameStack = UIStackView()
    var lobbyStack = UIStackView()
    var createBottomButtonBottomConstraint: NSLayoutConstraint?
    // methods
    init(frame: CGRect, type: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        topLabel = getMainLabel()
        if type == "create" {
            setForegroundView(bottomTitle: "Введите название лобби",
                              bottomPlaceHolder: "Название",
                              buttonTitle: "Создать")
            topLabel = getMainLabel(text: "Создать лобби")
        } else if type == "enter" {
            setForegroundView(bottomTitle: "Введите код лобби",
                              bottomPlaceHolder: "******",
                              buttonTitle: "Присоединиться")
            topLabel = getMainLabel(text: "Присоединиться к лобби")
        } else {
            setForegroundView()
            topLabel = getMainLabel()
        }
        setCreateLobbyLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // function of setting up white foreground of this view and it's constraints
    private func setForegroundView(bottomTitle: String = "Error",
                                   bottomPlaceHolder: String = "Error",
                                   buttonTitle: String = "Error") {
        foregroundView = getForegroundView()
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
    // function of setting up label of this view and it's constraints
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
    // function of setting up textField with it's label and view
    private func getTextView(textField: UITextField,
                             title: String,
                             placeholder: String,
                             button: UIButton) -> UIStackView {
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        let titleLabelView: UIView = {
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.textColor = UIColor(named: "swipeMovieBlack")
            titleLabel.font = UIFont.systemFont(ofSize: ConstantsForTextFields.labelFontSize)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            let view = UIView()
            view.addSubview(titleLabel)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: ConstantsForTextFields.labelFontSize),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            return view
        }()
        let textFieldView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = ConstantsForTextFields.cornerRadius
            view.layer.borderColor = UIColor(named: "swipeMovieBlue")?.cgColor
            view.layer.borderWidth = 2
            view.addSubview(textField)
            view.addSubview(button)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: ConstantsForTextFields.height),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.widthAnchor.constraint(equalToConstant: ConstantsForTextFields.height),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: ConstantsForTextFields.margingFromBorder),
                textField.trailingAnchor.constraint(equalTo: button.leadingAnchor)
            ])
            return view
        }()
        let textFieldStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = ConstantsForTextFields.spaceUnderLabel
            stack.addArrangedSubview(titleLabelView)
            stack.addArrangedSubview(textFieldView)
            return stack
        }()
        return textFieldStack
    }
}
