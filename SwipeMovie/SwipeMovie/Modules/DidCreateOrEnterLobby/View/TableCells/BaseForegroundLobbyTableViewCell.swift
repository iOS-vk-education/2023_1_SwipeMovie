//
//  BaseForegroundLobbyTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 10.12.2023.
//

import UIKit

class BaseForegroundLobbyTableViewCell: UITableViewCell {
    
    // MARK: private types
    
    private enum ConstantsForBaseForegroundTableCell {
        
        static let cellHeight: CGFloat = 44
        static let cellCornerRadius: CGFloat = 20
        static let spaceBetweenCells: CGFloat = 4
        static let marginFromBottomAndTop: CGFloat = -4
    }
    
    // MARK: properties

    let foregroundView = CustomForegroundViewBuilderByType(type: .tableCell)
    let filmListLable = CustomUILabelBuilderByType(type: .cell)
    
    // MARK: methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(named: "swipeMovieBlue")
        
        configureForegroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    func configure(text: String) {
        filmListLable.text = text
    }
    
    // ForegroundView methods
    
    private func configureForegroundView() {
        
        contentView.addSubview(foregroundView)
        
        NSLayoutConstraint.activate([
            foregroundView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                                constant: -ConstantsForBaseForegroundTableCell.marginFromBottomAndTop),
            foregroundView.heightAnchor.constraint(equalToConstant: ConstantsForBaseForegroundTableCell.cellHeight),
            foregroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantsForAllViews.marginFromSides),
            foregroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                   constant: ConstantsForBaseForegroundTableCell.marginFromBottomAndTop)
        ])
    }
}

