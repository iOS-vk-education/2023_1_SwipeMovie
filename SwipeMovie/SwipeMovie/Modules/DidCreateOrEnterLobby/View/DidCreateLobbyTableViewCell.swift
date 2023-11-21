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
        
        static let fontSize: CGFloat = 17
        static let buttonHeight: CGFloat = 22
        static let cellHeight: CGFloat = 44
        static let cellCornerRadius: CGFloat = 20
        static let marginForCheckBox: CGFloat = 8
        static let spaceBetweenCheckBoxAndLabel: CGFloat = 4
        static let spaceBetweenCells: CGFloat = 4
    }
    
    // MARK: private properties
    
    private let foregroundView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForLobbyTableCell.cellHeight / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: properties
    
    let filmListLable: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: ConstantsForLobbyTableCell.fontSize, weight: .regular)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let checkBoxButton: UIButton = {
        
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemGray])
//        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemBlue])
        button.setImage(UIImage(systemName: "xmark.circle.fill")?.withConfiguration(config), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.buttonHeight).isActive = true
        button.widthAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.buttonHeight).isActive = true
        
        return button
    }()
    
    // MARK: methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        contentView.addSubview(foregroundView)
        foregroundView.addSubview(filmListLable)
        foregroundView.addSubview(checkBoxButton)
        
        NSLayoutConstraint.activate([
            foregroundView.heightAnchor.constraint(equalToConstant: ConstantsForLobbyTableCell.cellHeight),
            foregroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foregroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantsMain.marginFromSides),
            
            checkBoxButton.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                    constant: ConstantsForLobbyTableCell.marginForCheckBox),
            checkBoxButton.centerYAnchor.constraint(equalTo: foregroundView.centerYAnchor),
            
            filmListLable.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor,
                                                   constant: ConstantsForLobbyTableCell.spaceBetweenCheckBoxAndLabel),
            filmListLable.centerYAnchor.constraint(equalTo: checkBoxButton.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
