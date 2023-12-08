//
//  CustomForegroundViewBuilderByType.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.12.2023.
//

import Foundation
import UIKit

final class CustomForegroundViewBuilderByType: UIView {
    
    // MARK: types
    
    enum ViewType {
        case bottomWithBorder
        case bottomWithoutBorder
        case tableCell
    }
    
    // MARK: private types
    
    private enum ConstantsForCustomUIView {
        
        static let cornerRadius: CGFloat = 40
        static let borderWidth: CGFloat = 4
        static let captionFontSize: CGFloat = 15
        static let spaceBetweenCaptionAndElements: CGFloat = 5
        static let buttonTextFontSize: CGFloat = 17
        static let cellHeight: CGFloat = 44
    }
    
    // MARK: methods
    
    init(type: ViewType) {
        super.init(frame: CGRectZero)
        
        super.translatesAutoresizingMaskIntoConstraints = false
        super.backgroundColor = UIColor(named: "swipeMovieWhite")
        super.layer.cornerRadius = ConstantsForCustomUIView.cornerRadius
        
        switch type {
        case .bottomWithBorder:
            super.layer.borderColor = UIColor(named: "swipeMovieBlue")?.cgColor
            super.layer.borderWidth = ConstantsForCustomUIView.borderWidth
            super.layer.cornerRadius = ConstantsForCustomUIView.cornerRadius + super.layer.borderWidth
            fallthrough
            
        case .bottomWithoutBorder:
            super.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
        case .tableCell:
            super.layer.cornerRadius = ConstantsForCustomUIView.cellHeight / 2.0
            super.heightAnchor.constraint(equalToConstant: ConstantsForCustomUIView.cellHeight).isActive = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
