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
        static let textFontSize: CGFloat = 22
        static let buttonTextFontSize: CGFloat = 17
    }
    
    // MARK: properties
    
    var bottomButton = CustomUIButton()
    var guestsListButton = UIButton()
    var filmListTableView = UITableView()
    
    // MARK: private properties
    
    private var foregroundView = CustomUIView()
    private var captionLable = CustomUILabel()
    
    private var areGuestsReady = true
    
    // MARK: methods
    
    init(frame: CGRect, lobbyName: String, lobbyCode: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureTableView()
        configureForegroundView(areGuestsReady: areGuestsReady,
                                numberOfGuests: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func guestsAreReady() {
        areGuestsReady = true
    }
    
    func guestsAreNotReady() {
        areGuestsReady = false
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
    
    private func configureForegroundView(areGuestsReady: Bool = true, numberOfGuests: Int = 0) {
        
        foregroundView.makeForegroundView()
        foregroundView.makeBlueBordersForForegroundView()
        self.addSubview(foregroundView)
        
        bottomButton.makeButton(title: "Начать",
                                size: .ordinary)
        foregroundView.addSubview(bottomButton)
        
        captionLable.makeCaptionLabel()
        foregroundView.addSubview(captionLable)
        
        switch areGuestsReady {
        case true:
            bottomButton.isEnabled = true
            bottomButton.backgroundColor = UIColor(named: "swipeMovieBlue")
            captionLable.text = "Все гости готовы, \n Вы можете начать"
            
        case false:
            bottomButton.isEnabled = false
            bottomButton.backgroundColor = .systemGray
            captionLable.text = "Пока все гости не будут готовы, \n Вы не сможете начать"
        }
        
        let guestsNumberLabel = makeGuestsNumberLabel(numberOfGuests: numberOfGuests)
        foregroundView.addSubview(guestsNumberLabel)
        
        guestsListButton = makeGuestsListButton()
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
    
    private func makeGuestsNumberLabel(numberOfGuests: Int) -> UILabel {
        
        let label = UILabel()
        
        label.textColor = UIColor(named: "swipeMovieBlack")
        label.font = UIFont.systemFont(ofSize: ConstantsForForegroundView.textFontSize,
                                       weight: .medium)
        label.text = "Гости - \(numberOfGuests)"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeGuestsListButton() -> UIButton {
        
        let button = UIButton()
        
        button.tintColor = .systemBlue
        button.setTitle("Посмотреть", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ConstantsForForegroundView.buttonTextFontSize,
                                                    weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
