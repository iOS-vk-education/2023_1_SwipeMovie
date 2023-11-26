//
//  CustomUIView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 21.11.2023.
//

import Foundation
import UIKit

final class CustomUIView: UIView {
    
    // MARK: private types
    
    private enum ConstantsForCustomUIView {
        
        static let cornerRadius: CGFloat = 40
        static let borderWidth: CGFloat = 4
        static let captionFontSize: CGFloat = 15
        static let spaceBetweenCaptionAndElements: CGFloat = 5
        static let buttonTextFontSize: CGFloat = 17
    }
    
    // MARK: function of setting up white background view for many views
    
    func makeForegroundView() {
        
        super.backgroundColor = UIColor(named: "swipeMovieWhite")
        super.layer.cornerRadius = ConstantsForCustomUIView.cornerRadius
        super.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        super.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: function of setting up blue borders for white background view for many views
    
    func makeBlueBordersForForegroundView() {
        
        super.layer.borderColor = UIColor(named: "swipeMovieBlue")?.cgColor
        super.layer.borderWidth = ConstantsForCustomUIView.borderWidth
        super.layer.cornerRadius += super.layer.borderWidth
    }
}
