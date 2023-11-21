//
//  UIButton+Extensions.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 21.11.2023.
//

import Foundation
import UIKit

extension UIButton {
    
    enum ButtonSize {
        case ordinary
        case big
    }
    
    // MARK: function of setting up default buttons for SwipeMovie app for many views
    
    static func makeButton(title: String, size: ButtonSize) -> UIButton {

        let button = UIButton()

        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
        button.backgroundColor = UIColor(named: "swipeMovieBlue")
        button.layer.cornerRadius = ConstantsForButton.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false

        let width: CGFloat
        switch size {
        case .ordinary:
            width = ConstantsForButton.smallButtonWidth

        case .big:
            width = ConstantsForButton.bigButtonWidth
        }

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: ConstantsForButton.height),
            button.widthAnchor.constraint(equalToConstant: width)
        ])

        return button
    }
}
    
