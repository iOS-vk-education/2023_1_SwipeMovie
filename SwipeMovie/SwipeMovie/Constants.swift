//
//  Constansts.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 05.11.2023.
//

import Foundation
import UIKit

enum ConstantsMain {
    static let mainLabelFontSize: CGFloat = 34
    static let marginFromSides: CGFloat = 20
    static let bottomIndent: CGFloat = -10
}

enum ConstantsForButton {
    static let height: CGFloat = 44
    static let cornerRadius: CGFloat = height / 2
    static let smallButtonWidth: CGFloat = 237
    static let bigButtonWidth: CGFloat = UIScreen.main.bounds.width - 2 * ConstantsMain.marginFromSides
    static let fontSize: CGFloat = 20
}

enum ConstantsForWhiteForegroundView {
    static let cornerRadius: CGFloat = 40
    static let borderWidth: CGFloat = 4
    static let captionFontSize: CGFloat = 15
    static let textFontSize: CGFloat = 22
    static let spaceBetweenCaptionAndElements: CGFloat = 5
    static let buttonTextFontSize: CGFloat = 17
}

