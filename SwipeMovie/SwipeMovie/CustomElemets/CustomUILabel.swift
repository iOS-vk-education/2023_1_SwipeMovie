//
//  CustomUILabel.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 21.11.2023.
//

import Foundation
import UIKit

final class CustomUILabel: UILabel {
    
    // MARK: private types
    
    enum ConstantsForCustomLabel {
        
        static let captionFontSize: CGFloat = 15
        static let titleFontSize: CGFloat = 34
        static let subtitleFontSize: CGFloat = 22
    }
    
    // MARK: function of setting up white top title label for many views
    
    func setText(text: String = "error") {
        super.text = text
    }
    
    func makeTitleLabel(text: String = "error") {
        
        super.textColor = UIColor(named: "swipeMovieWhite")
        super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.titleFontSize, weight: .bold)
        super.numberOfLines = 0
        super.lineBreakMode = .byTruncatingTail
        super.textAlignment = .center
        super.text = text
        super.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeSubtitleLabel(text: String = "error") {
        
        super.textColor = UIColor(named: "swipeMovieWhite")
        super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.subtitleFontSize, weight: .regular)
        super.numberOfLines = 0
        super.lineBreakMode = .byTruncatingTail
        super.textAlignment = .center
        super.text = text
        super.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: function of setting up black caption label for many views
    
    func makeCaptionLabel(text: String = "error") {
          
        super.textColor = UIColor(named: "swipeMovieBlack")
        super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.captionFontSize, weight: .regular)
        super.numberOfLines = 0
        super.lineBreakMode = .byTruncatingTail
        super.textAlignment = .center
        super.text = text
        super.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
