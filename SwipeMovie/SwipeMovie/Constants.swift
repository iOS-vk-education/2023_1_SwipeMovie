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
    static let height = 2.0 / 3.0 * UIScreen.main.bounds.height
    static let cornerRadius: CGFloat = 40
}

enum ConstantsForTextFields {
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
