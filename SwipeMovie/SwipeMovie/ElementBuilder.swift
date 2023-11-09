//
//  ElementBuilder.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 05.11.2023.
//

import Foundation
import UIKit

// function of setting up buttons
func getButton(title: String, size: String = "") -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
    button.backgroundColor = UIColor(named: "swipeMovieBlue")
    button.layer.cornerRadius = ConstantsForButton.cornerRadius
    button.translatesAutoresizingMaskIntoConstraints = false
    let width: CGFloat
    if size == "small" {
        width = ConstantsForButton.smallButtonWidth
    } else if size == "big" {
        width = ConstantsForButton.bigButtonWidth
    } else {
        width = 100 // random number
    }
    NSLayoutConstraint.activate([
        button.heightAnchor.constraint(equalToConstant: ConstantsForButton.height),
        button.widthAnchor.constraint(equalToConstant: width)
    ])
    return button
}
// function of setting up textField with it's label and view
func getTextView(textField: UITextField, title: String, placeholder: String, button: UIButton) -> UIStackView {
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
// function of setting up main white label above the foregroundView
func getMainLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor(named: "swipeMovieWhite")
    label.font = UIFont.systemFont(ofSize: ConstantsMain.mainLabelFontSize, weight: .bold)
    label.numberOfLines = 0
    label.lineBreakMode = .byTruncatingTail
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}
// function of setting up white background view
func getForegroundView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor(named: "swipeMovieWhite")
    view.layer.cornerRadius = ConstantsForWhiteForegroundView.cornerRadius
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}
