//
//  DidCreateLobbyTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 20.11.2023.
//

import UIKit

class DidCreateLobbyTableViewCell: UITableViewCell {
    
    // MARK: private types
    
    private enum ConstantsForLobbyTableCell {
        
        static let buttonHeight: CGFloat = 22
        static let cellCornerRadius: CGFloat = 20
        static let marginForCheckBox: CGFloat = 8
        static let spaceBetweenCheckBoxAndLabel: CGFloat = 4
        static let spaceBetweenCells: CGFloat = 4
        static let marginFromBottomAndTop: CGFloat = 4
    }
    
    // MARK: properties
    
    let filmListLable = CustomUILabelBuilderByType(type: .cell)
    
    let checkBoxButton = UIButton()
    
    // MARK: private properties
    
    private let foregroundView = CustomForegroundViewBuilderByType(type: .tableCell)
    
    // MARK: methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(named: "swipeMovieBlue")
        
        configureForegroundView()
        configureButton()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    // ForegroundView methods
    
    private func configureForegroundView() {
        
        contentView.addSubview(foregroundView)
        
        NSLayoutConstraint.activate([
            foregroundView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                                constant: ConstantsForLobbyTableCell.marginFromBottomAndTop),
//            foregroundView.heightAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.cellHeight),
            foregroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantsForAllViews.marginFromSides),
            foregroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                   constant: -ConstantsForLobbyTableCell.marginFromBottomAndTop)
        ])
    }
    
    // Button methods
    
    private func configureButton() {
        
        makeButton()
        configureButtonConstraints()
    }
    
    private func makeButton() {
        
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemGray])
//        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemBlue])
        checkBoxButton.setImage(UIImage(systemName: "xmark.circle.fill")?.withConfiguration(config), for: .normal)
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.heightAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.buttonHeight).isActive = true
        checkBoxButton.widthAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.buttonHeight).isActive = true
    }
    
    private func configureButtonConstraints() {
        
        foregroundView.addSubview(checkBoxButton)
        
        NSLayoutConstraint.activate([
            checkBoxButton.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                    constant: ConstantsForLobbyTableCell.marginForCheckBox),
            checkBoxButton.centerYAnchor.constraint(equalTo: foregroundView.centerYAnchor)
        ])
    }
    
    // Label methods
    
    private func configureLabel() {
        
        foregroundView.addSubview(filmListLable)
        
        NSLayoutConstraint.activate([
            filmListLable.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor,
                                                   constant: ConstantsForLobbyTableCell.spaceBetweenCheckBoxAndLabel),
            filmListLable.centerYAnchor.constraint(equalTo: checkBoxButton.centerYAnchor)
        ])
    }
}
