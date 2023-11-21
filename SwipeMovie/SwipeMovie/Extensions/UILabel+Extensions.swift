//
//  UILabel+Extensions.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 21.11.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    // MARK: function of setting up white top title label for many views
    
    static func makeMainLabel(text: String = "error") -> UILabel {
        
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
    
    // MARK: function of setting up black caption label for many views
    
    static func makeCaptionLabel(text: String = "error") -> UILabel {
        
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
}
