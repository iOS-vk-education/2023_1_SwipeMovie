//
//  DidEnterLobbyTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 20.11.2023.
//

import UIKit

class DidEnterLobbyTableViewCell: BaseForegroundLobbyTableViewCell {
    
    // MARK: private types
    
    private enum ConstantsForDidEnterLobbyTableCell {
    
        static let labelMargin: CGFloat = 20
    }
    
    // MARK: methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    // Label methods
    
    private func configureLabel() {
        
        foregroundView.addSubview(filmListLable)
        
        NSLayoutConstraint.activate([
            filmListLable.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                   constant: ConstantsForDidEnterLobbyTableCell.labelMargin),
            filmListLable.centerYAnchor.constraint(equalTo: foregroundView.centerYAnchor)
        ])
    }
}
