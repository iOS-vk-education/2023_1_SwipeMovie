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
    }
    
    // MARK: properties
    
    let filmListLable = UILabel()
    
    // MARK: private properties
    
    private let foregroundView = UIView()
    
    // MARK: methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        configureForegroundView()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    // ForegroundView methods
    
    private func configureForegroundView() {
        
        makeForegroundView()
        configureForegroundViewConstraints()
    }
    
    private func makeForegroundView() {
    
        foregroundView.backgroundColor = UIColor(named: "swipeMovieWhite")
        foregroundView.layer.cornerRadius = ConstantsForLobbyTableCell.cellHeight / 2.0
        foregroundView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureForegroundViewConstraints() {
        
        contentView.addSubview(foregroundView)
        
        NSLayoutConstraint.activate([
            foregroundView.heightAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.cellHeight),
            foregroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foregroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantsForAllViews.marginFromSides)
        ])
    }
    
    // Label methods
    
    private func configureLabel() {
        
        makeLabel()
        configureLabelConstraints()
    }
    
    private func makeLabel() {
        
        filmListLable.textColor = .black
        filmListLable.font = UIFont.systemFont(ofSize: ConstantsForLobbyTableCell.fontSize, weight: .regular)
        filmListLable.numberOfLines = 1
        filmListLable.lineBreakMode = .byTruncatingTail
        filmListLable.textAlignment = .left
        filmListLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLabelConstraints() {
        
        foregroundView.addSubview(filmListLable)
        
        NSLayoutConstraint.activate([
            filmListLable.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                   constant: ConstantsForLobbyTableCell.cellCornerRadius),
            filmListLable.centerYAnchor.constraint(equalTo: foregroundView.centerYAnchor)
        ])
    }
}
