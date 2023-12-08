//
//  DidEnterLobbyTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 20.11.2023.
//

import UIKit

class DidEnterLobbyTableViewCell: UITableViewCell {
    
    // MARK: private types
    
    private enum ConstantsForLobbyTableCell {
        
        static let fontSize: CGFloat = 17
        static let buttonHeight: CGFloat = 22
        static let cellHeight: CGFloat = 44
        static let cellCornerRadius: CGFloat = 20
        static let marginForCheckBox: CGFloat = 8
        static let spaceBetweenCheckBoxAndLabel: CGFloat = 4
        static let spaceBetweenCells: CGFloat = 4
        static let marginFromBottomAndTop: CGFloat = 4
    }
    
    // MARK: properties
    
    let filmListLable = CustomUILabelBuilderByType(type: .cell)
    
    // MARK: private properties
    
    private let foregroundView = CustomForegroundViewBuilderByType(type: .tableCell)
    
    // MARK: methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(named: "swipeMovieBlue")
        
        configureForegroundView()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        filmListLable.text = text
    }
    
    // MARK: private methods
    
    // ForegroundView methods
    
    private func configureForegroundView() {
        
        contentView.addSubview(foregroundView)
        
        NSLayoutConstraint.activate([
            foregroundView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                                constant: ConstantsForLobbyTableCell.marginFromBottomAndTop),
            foregroundView.heightAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.cellHeight),
            foregroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantsForAllViews.marginFromSides),
            foregroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                   constant: -ConstantsForLobbyTableCell.marginFromBottomAndTop)
        ])
    }
    
    // Label methods
    
    private func configureLabel() {
        
        foregroundView.addSubview(filmListLable)
        
        NSLayoutConstraint.activate([
            filmListLable.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                   constant: ConstantsForLobbyTableCell.cellCornerRadius),
            filmListLable.centerYAnchor.constraint(equalTo: foregroundView.centerYAnchor)
        ])
    }
}
