//
//  CustomUILabelBuilderByType.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.12.2023.
//

import Foundation
import UIKit

final class CustomUILabelBuilderByType: UILabel {
    
    // MARK: private types
        
    enum LabelType {
        case title
        case subtitle
        case caption
        case mediumText
    }
    
    // MARK: private types
    
    private enum ConstantsForCustomLabel {
        
        static let captionFontSize: CGFloat = 15
        static let titleFontSize: CGFloat = 34
        static let subtitleFontSize: CGFloat = 22
    }
    
    // MARK: function of setting up white top title label for many views
    
    init(type: LabelType) {
        super.init(frame: CGRectZero)

        super.numberOfLines = 0
        super.lineBreakMode = .byTruncatingTail
        super.textAlignment = .center
        super.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .title:
            super.textColor = UIColor(named: "swipeMovieWhite")
            super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.titleFontSize,
                                           weight: .bold)

        case .subtitle:
            super.textColor = UIColor(named: "swipeMovieWhite")
            super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.subtitleFontSize,
                                           weight: .regular)

        case .caption:
            super.textColor = UIColor(named: "swipeMovieBlack")
            super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.captionFontSize,
                                           weight: .regular)

        case .mediumText:
            super.textColor = UIColor(named: "swipeMovieBlack")
            super.font = UIFont.systemFont(ofSize: ConstantsForCustomLabel.subtitleFontSize,
                                           weight: .medium)

        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeText(text: String) {
        super.text = text
    }
}

