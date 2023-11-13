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
// function of setting up white top title label
func getMainLabel(text: String = "error") -> UILabel {
    let label = UILabel()
    label.textColor = UIColor(named: "swipeMovieWhite")
    label.font = UIFont.systemFont(ofSize: ConstantsMain.mainLabelFontSize, weight: .bold)
    label.numberOfLines = 0
    label.lineBreakMode = .byTruncatingTail
    label.textAlignment = .center
    label.text = text
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}
// function of setting up black caption label
func getCaptionLabel(text: String = "error") -> UILabel {
    let label = UILabel()
    label.textColor = UIColor(named: "swipeMovieBlack")
    label.font = UIFont.systemFont(ofSize: ConstantsForWhiteForegroundView.captionFontSize, weight: .regular)
    label.numberOfLines = 0
    label.lineBreakMode = .byTruncatingTail
    label.textAlignment = .center
    label.text = text
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
// function of setting up main white label above the foregroundView
func getMainLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor(named: "swipeMovieWhite")
    label.font = UIFont.systemFont(ofSize: ConstantsMain.mainLabelFontSize, weight: .bold)
    label.numberOfLines = 0
    label.lineBreakMode = .byTruncatingTail
    label.textAlignment = .center
    label.text = text
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}
// function of setting up black caption label
func getCaptionLabel(text: String = "error") -> UILabel {
    let label = UILabel()
    label.textColor = UIColor(named: "swipeMovieBlack")
    label.font = UIFont.systemFont(ofSize: ConstantsForWhiteForegroundView.captionFontSize, weight: .regular)
    label.numberOfLines = 0
    label.lineBreakMode = .byTruncatingTail
    label.textAlignment = .center
    label.text = text
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
