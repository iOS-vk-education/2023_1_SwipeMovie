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
    
    private var foregroundView = CustomUIView()
    var topTitleView = TopTitleLobbiesView()
    
    // MARK: properties
    
    var bottomButton = CustomUIButton()
    var filmListTableView = UITableView()
    
    // MARK: methods
    
    init(frame: CGRect, lobbyName: String, lobbyCode: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureTableView()
        configureForegroundView()
        configureTopView(lobbyName: lobbyName,
                         lobbyCode: lobbyCode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    private func configureTableView() {
        
        let tableLabel = CustomUILabel()
        tableLabel.makeSubtitleLabel(text: "Списки фильмов")
        tableLabel.font = UIFont.systemFont(ofSize: tableLabel.font.pointSize,
                                            weight: .medium)
        addSubview(tableLabel)
        
        filmListTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        filmListTableView.rowHeight = ConstantsForTable.heightOfCellWithSpace
        addSubview(filmListTableView)
        filmListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                constant: -ConstantsForTable.heightOfTable),
            tableLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: ConstantsForAllViews.marginFromSides),
            
            filmListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                      constant: -70),
            // simple number to put last element of table under white foreground
            filmListTableView.topAnchor.constraint(equalTo: tableLabel.bottomAnchor,
                                                   constant: ConstantsForTable.spaceBetweenTableAndLable),
            filmListTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            filmListTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // function of setting up white foreground of this view and it's constraints
    
    private func configureForegroundView() {
        
        foregroundView.makeForegroundView()
        foregroundView.makeBlueBordersForForegroundView()
        addSubview(foregroundView)
        
        bottomButton.makeButton(title: "Готово",
                                size: .ordinary)
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
    
    private func configureTopView(lobbyName: String, lobbyCode: String) {
        
        topTitleView.makeTopView(lobbyName: lobbyName, lobbyCode: lobbyCode)
        self.addSubview(topTitleView)
        topTitleView.translatesAutoresizingMaskIntoConstraints = false
        
        let dimensionBefore = safeAreaLayoutGuide.topAnchor.anchorWithOffset(to: topTitleView.centerYAnchor)
        let dimensionAfter = topTitleView.centerYAnchor.anchorWithOffset(to: filmListTableView.topAnchor)
        
        NSLayoutConstraint.activate([
            dimensionBefore.constraint(equalTo: dimensionAfter,
                                       constant: -40),
            topTitleView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            topTitleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                            constant: ConstantsForAllViews.marginFromSides)
        ])
    }
}
