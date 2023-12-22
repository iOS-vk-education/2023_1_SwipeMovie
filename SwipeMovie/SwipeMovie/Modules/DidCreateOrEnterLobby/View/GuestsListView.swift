//
//  GuestsListView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 04.12.2023.
//

import Foundation
import UIKit

class GuestsListView: UIView {
    
    // MARK: private types
    
    // MARK: properties
    
    var exitButton = CustomUIButtonBuilderByType(title: "Закрыть", type: .ordinary)
    var guestsListTableView = UITableView()
    
    // MARK: private properties
    
    // MARK: methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureTop()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    private func configureTop() {
        
        let guestsNumberLabel = CustomUILabelBuilderByType(type: .mediumText)
        guestsNumberLabel.text = "Гости"
        guestsNumberLabel.textColor = UIColor(named: "swipeMovieWhite")
        addSubview(guestsNumberLabel)
        
        exitButton.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
        addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            guestsNumberLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                   constant: ConstantsForAllViews.marginFromSides),
            guestsNumberLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                       constant: ConstantsForAllViews.marginFromSides),
            
            exitButton.centerYAnchor.constraint(equalTo: guestsNumberLabel.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                       constant: -ConstantsForAllViews.marginFromSides)
        ])
    }
    
    private func configureTableView() {
        
        guestsListTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        addSubview(guestsListTableView)
        guestsListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            guestsListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            guestsListTableView.topAnchor.constraint(equalTo: exitButton.bottomAnchor),
            guestsListTableView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guestsListTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}
