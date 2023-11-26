//
//  CustomUIButton.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 21.11.2023.
//

import Foundation
import UIKit
    
final class CustomUIButton: UIButton {
    
    // MARK: private types
    
    enum ConstantsForCustomUIButton {
        
        static let height: CGFloat = 44
        static let cornerRadius: CGFloat = height / 2
        static let smallButtonWidth: CGFloat = 237
        static let bigButtonWidth: CGFloat = UIScreen.main.bounds.width - 2 * ConstantsForAllViews.marginFromSides
    }
    
    // MARK: types
    
    enum ButtonSize {
        case ordinary
        case big
    }
    
    // MARK: function of setting up default buttons for SwipeMovie app for many views
    
    func makeButton(title: String, size: ButtonSize) {

        super.setTitle(title, for: .normal)
        super.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
        super.backgroundColor = UIColor(named: "swipeMovieBlue")
        super.layer.cornerRadius = ConstantsForCustomUIButton.cornerRadius
        super.translatesAutoresizingMaskIntoConstraints = false

        let width: CGFloat
        switch size {
        case .ordinary:
            width = ConstantsForCustomUIButton.smallButtonWidth

        case .big:
            width = ConstantsForCustomUIButton.bigButtonWidth
        }

        NSLayoutConstraint.activate([
            super.heightAnchor.constraint(equalToConstant: ConstantsForCustomUIButton.height),
            super.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
}
