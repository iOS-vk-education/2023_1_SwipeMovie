//
//  DidEnteredLobbyView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 19.11.2023.
//

import Foundation
import UIKit

class DidEnteredLobbyView: UIView {
    
    // MARK: private types
    
    private enum ConstantsForTopTitle {
        
        static let subtitleFontSize: CGFloat = 22
        static let codeFontSize = subtitleFontSize
        static let spaceBetweenTitleAndSubtitle: CGFloat = 10
        static let marginFromBorders: CGFloat = 16
        static let spaceBetweenTextAndButtom: CGFloat = 12
        static let heightOfCodeView: CGFloat = 30
    }
    
    private enum ConstantsForTable {
        
        static let titleFontSize: CGFloat = 22
        static let buttonFontSize: CGFloat = 17
        static let heightOfTable: CGFloat = 3.0 / 5.0 * UIScreen.main.bounds.height
        static let heightOfCellWithSpace: CGFloat = 52
        static let spaceBetweenTableAndLable: CGFloat = 16
    }
    
    // MARK: private properties
    
    private var foregroundView = CustomForegroundViewBuilderByType(type: .bottomWithBorder)
    
    // MARK: properties
    
    var bottomButton = CustomUIButtonBuilderByType(title: "Готово", type: .smallRounded)
    var filmListTableView = UITableView()
    
    // MARK: methods
    
    init(frame: CGRect, lobbyName: String, lobbyCode: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureTableView()
        configureForegroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    private func configureTableView() {
        
        filmListTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        filmListTableView.rowHeight = ConstantsForTable.heightOfCellWithSpace
        addSubview(filmListTableView)
        filmListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                      constant: -70),
            // simple number to put last element of table under white foreground
            filmListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            filmListTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            filmListTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // function of setting up white foreground of this view and it's constraints
    
    private func configureForegroundView() {
        
        addSubview(foregroundView)
        
        foregroundView.addSubview(bottomButton)
        
        NSLayoutConstraint.activate([
            foregroundView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,
                                                 constant: -foregroundView.layer.borderWidth),
            foregroundView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                   constant: foregroundView.layer.borderWidth),
            
            bottomButton.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                 constant: ConstantsForAllViews.bottomIndent),
            
            foregroundView.topAnchor.constraint(equalTo: bottomButton.topAnchor,
                                                constant: 3 * ConstantsForAllViews.bottomIndent)
        ])
    }
}
