//
//  CustomUIButtonBuilderByType.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.12.2023.
//

import Foundation
import UIKit

final class CustomUIButtonBuilderByType: UIButton {
    
    // MARK: types
    
    enum ButtonType {
        case ordinary
        case bigRounded
        case smallRounded
    }
    
    // MARK: private types
    
    private enum ConstantsForCustomUIButton {
        
        static let height: CGFloat = 44
        static let cornerRadius: CGFloat = height / 2
        static let smallButtonWidth: CGFloat = 237
        static let bigButtonWidth: CGFloat = UIScreen.main.bounds.width - 2 * ConstantsForAllViews.marginFromSides
        static let buttonTextFontSize: CGFloat = 17
    }
    
    // MARK: function of setting up default buttons for SwipeMovie app for many views
    
    init(title: String, type: ButtonType) {
        super.init(frame: CGRect.null)
        
        super.setTitle(title, for: .normal)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .ordinary:
            super.tintColor = .systemBlue
            super.setTitleColor(.systemBlue, for: .normal)
            super.titleLabel?.font = UIFont.systemFont(ofSize: ConstantsForCustomUIButton.buttonTextFontSize,
                                                        weight: .regular)
        case .bigRounded:
            super.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
            super.backgroundColor = UIColor(named: "swipeMovieBlue")
            super.layer.cornerRadius = ConstantsForCustomUIButton.cornerRadius

            NSLayoutConstraint.activate([
                super.heightAnchor.constraint(equalToConstant: ConstantsForCustomUIButton.height),
                super.widthAnchor.constraint(equalToConstant: ConstantsForCustomUIButton.bigButtonWidth)
            ])
            
        case .smallRounded:
            super.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
            super.backgroundColor = UIColor(named: "swipeMovieBlue")
            super.layer.cornerRadius = ConstantsForCustomUIButton.cornerRadius

            NSLayoutConstraint.activate([
                super.heightAnchor.constraint(equalToConstant: ConstantsForCustomUIButton.height),
                super.widthAnchor.constraint(equalToConstant: ConstantsForCustomUIButton.smallButtonWidth)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func unblockButton1() {
        super.isEnabled = true
        super.backgroundColor = UIColor(named: "swipeMovieBlue")
    }
    
    func blockButton1() {
        super.isEnabled = false
        super.backgroundColor = .systemGray
    }
    
}
