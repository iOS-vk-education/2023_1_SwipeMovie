//
//  DidCreateLobbyView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 19.11.2023.
//

import Foundation
import UIKit

class DidCreatedLobbyView: UIView {
    
    // MARK: private types
    
    private enum ConstantsForTable {
        
        static let titleFontSize: CGFloat = 22
        static let buttonFontSize: CGFloat = 17
        static let heightOfTable: CGFloat = 3.0 / 5.0 * UIScreen.main.bounds.height
        static let heightOfCellWithSpace: CGFloat = 52
        static let spaceBetweenTableAndLable: CGFloat = 16
    }
    
    private enum ConstantsForForegroundView {
        
        static let spaceBetweenCaptionAndElements: CGFloat = 5
    }
    
    // MARK: properties
    
    var bottomButton = CustomUIButtonBuilderByType(title: "Начать", type: .smallRounded)
    var guestsListButton = CustomUIButtonBuilderByType(title: "Посмотреть", type: .ordinary)
    var filmListTableView = UITableView()
    
    // MARK: private properties
    
    private var foregroundView = CustomForegroundViewBuilderByType(type: .bottomWithBorder)
    private var captionLable = CustomUILabelBuilderByType(type: .caption)
    private var guestsNumberLabel = CustomUILabelBuilderByType(type: .mediumText)
    
    // MARK: methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "swipeMovieBlue")
        configureTableView()
        configureForegroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateGuestNumber(number: Int) {
        guestsNumberLabel.text = "Гости - \(number)"
    }
    
    func guestsAreReady() {
        bottomButton.blockButton()
        captionLable.text = "Все гости готовы, \n Вы можете начать"
    }
    
    func guestsAreNotReady() {
        bottomButton.unblockButton()
        captionLable.text = "Пока вы не выберете фильмы \n или все гости не будут готовы, \n Вы не сможете начать"
    }
    
    // MARK: private methods
    
    // function  of setting up tableView of this view and it's constraints
    
    private func configureTableView() {
        
        filmListTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        addSubview(filmListTableView)
        filmListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                      constant: -160),
            // simple number to put last element of table under white foreground
            filmListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            filmListTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            filmListTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // function of setting up white foreground of this view and it's constraints
    private func configureForegroundView() {
        
//        foregroundView.makeForegroundView()
//        foregroundView.makeBlueBordersForForegroundView()
        addSubview(foregroundView)
        foregroundView.addSubview(bottomButton)
        foregroundView.addSubview(captionLable)
        
        captionLable.text = "Все гости готовы, \n Вы можете начать"
        
        guestsNumberLabel.text = "Гости - 1"
        foregroundView.addSubview(guestsNumberLabel)
        
        foregroundView.addSubview(guestsListButton)
        
        let foregroundViewCornerRadius = foregroundView.layer.cornerRadius
        let foregroundViewBorderWidth = foregroundView.layer.borderWidth
        
        NSLayoutConstraint.activate([
            foregroundView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,
                                                 constant: -foregroundViewBorderWidth),
            foregroundView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                   constant: foregroundViewCornerRadius),
            
            bottomButton.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                 constant: ConstantsForAllViews.bottomIndent),
            
            guestsNumberLabel.bottomAnchor.constraint(equalTo: foregroundView.topAnchor,
                                                      constant: foregroundViewCornerRadius + foregroundViewBorderWidth),
            guestsNumberLabel.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                       constant: foregroundView.layer.cornerRadius),
            guestsNumberLabel.bottomAnchor.constraint(equalTo: captionLable.topAnchor,
                                                      constant: -1.0 / 2.0 * foregroundViewCornerRadius),
            
            guestsListButton.centerYAnchor.constraint(equalTo: guestsNumberLabel.centerYAnchor),
            guestsListButton.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor,
                                                    constant: -foregroundViewCornerRadius),
            
            captionLable.bottomAnchor.constraint(equalTo: bottomButton.topAnchor,
                                                 constant: -ConstantsForForegroundView.spaceBetweenCaptionAndElements),
            captionLable.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            captionLable.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                  constant: ConstantsForAllViews.marginFromSides)
        ])
    }
}
