//
//  UIView+Extensions.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 21.11.2023.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: function of setting up white background view for many views
    
    static func makeForegroundView() -> UIView {
        
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForWhiteForegroundView.cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
}
